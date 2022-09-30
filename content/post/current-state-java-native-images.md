---
title: "The current state of Java native images"
date: 2022-09-30T16:56:17+02:00
draft: false
---


Native compilation of Java applications revolutionized the whole ecosystem and enabled new kinds of workloads written in Java.
A lot of engineering effort was required for it to succeed and a significant marketing budget was spent to add it to the Java developer radar.

However, the tradeoffs and implications when taming this horse are not always obvious nor shared with the same passion as its benefits.

**The good** things are the ones we keep reading all the time [we will have compacted native executables and memory consumption, startup time, and application size among others will improve dramatically](https://www.graalvm.org/native-image/).

**The bad** is that [peak throughput and max latency in some cases could be worse than a regular Just In Time application](https://blogs.oracle.com/javamagazine/post/pedal-to-the-metal-high-performance-java-with-graalvm-native-image). The JVM is one of the best pieces of engineering out there, and it won't be there helping us anymore.

**The ugly** is that we are working in a closed world now. That means every class, every method call, and every variable must be known beforehand during compilation. And because of some of Java’s dynamic features when using a native image it will only include the elements reached from our applications entry point, meaning that [we will never be 100% sure if a code path will break our application in runtime.](https://www.graalvm.org/22.1/reference-manual/native-image/Limitations/)

Because **not every class can be reached when compiling the application as a native image**, we need to start adding information to the [metadata](https://www.graalvm.org/22.2/reference-manual/native-image/metadata/).

For example:
```
{
  "name":"io.swagger.models.AbstractModel",
  "allDeclaredFields":true,
  "queryAllDeclaredMethods":true,
  "methods":[
    {"name":"getExclusiveMaximum","parameterTypes":[] }, 
    {"name":"getExclusiveMinimum","parameterTypes":[] }, 
    {"name":"getExternalDocs","parameterTypes":[] }, 
    {"name":"getMaxLength","parameterTypes":[] }, 
    {"name":"getMaximum","parameterTypes":[] }, 
    {"name":"getMinLength","parameterTypes":[] }, 
```

Manually adding every single possible class and method is not very practical, so what can we do today to be comfortable enough to put an application into production?
[GraalVM SDK comes with an agent](https://www.graalvm.org/22.0/reference-manual/native-image/Agent/) that helps us generate the configuration for the project when a code path is executed in runtime.

The application can be run by passing a couple of parameters to be told it needs to be running with the agent:

```
java -agentlib:native-image-agent=config-output-dir=src/main/resources/META-INF/native-image -jar build/libs/myapp.jar
```

After that, we can execute our acceptance tests suite:

```
./gradlew acceptanceTest
```

And after stopping our application we see that it generated all [the JSON configuration](https://www.graalvm.org/22.2/reference-manual/native-image/metadata/#specifying-metadata-with-json) for us:
```
tree src/main/resources/META-INF

src/main/resources/META-INF
└── native-image
    ├── agent-extracted-predefined-classes
    ├── jni-config.json
    ├── predefined-classes-config.json
    ├── proxy-config.json
    ├── reflect-config.json
    ├── resource-config.json
    └── serialization-config.json
2 directories, 6 files
```

This is a great starting point but **most projects are not compatible yet with native compilation**.
[A new repository was created in order for everything to contribute reachability-metadata for every project.](https://github.com/oracle/graalvm-reachability-metadata/tree/master/metadata) However, it is still early days and not every project is there.
That leaves us with very few options if we still want to use them and have a higher confidence level.

For example, we use swagger-parser: `io.swagger.parser.v3:swagger-parser` to parse and generate some OpenAPI spec objects.

**If we don't parse an object that will execute all the parsing code paths, with all its fields in our acceptance test suite, it will not work for every scenario, meaning that it will likely crash in production at runtime.**

By looking at [this chunk of code](https://github.com/swagger-api/swagger-core/blob/f06d463d829ea4f51d846cdcdda37f448def9f7c/modules/swagger-core/src/main/java/io/swagger/v3/core/util/ObjectMapperFactory.java#L157-L208) we can see how by going through an if statement or not, things can get out of hands very easily.
Even if we today add a full object in our tests, what happens when `swagger-parser` gets upgraded will remain unknown.

Something that improved recently is that we can now execute the unit tests of a project with the agent to trigger code paths that are not triggered by the agent and `config-merge-dir` to merge the configuration instead of replacing the acceptance test ones.

By just adding the VM option:

```
-agentlib:native-image-agent=config-merge-dir=src/main/resources/META-INF/native-image
```

[There is even JUnit5 support for it now](https://junit.org/junit5/docs/current/user-guide/#writing-tests-conditional-execution-native).


However, even if this is a great step forward for our confidence, because now we are covering almost 99% of our project, that does not mean that we are covering 99% of the libraries themselves.

So, what can we do about it? We can apply the same method with the repository of the external dependency and run the agent there too:

```
git clone https://github.com/swagger-api/swagger-core.git

MAVEN_OPTS=-agentlib:native-image-agent=config-merge-dir=src/main/resources/META-INF/native-image" ./mvnw install
```

This should give us a much better level of confidence and that configuration can be contributed to [reachability-metadata](https://github.com/oracle/graalvm-reachability-metadata) making us very good Open Source citizens.

In conclusion, native images are a very useful tool that brought a lot of innovation into the Java ecosystem, frameworks supporting them do a very decent job when inferring the required native configurations for reflection, resources, proxies, etc… but there are still several other pieces that need to be navigated when trying to make it production ready for some use cases.

Thanks to Abel Salgado, Vicente Soriano, Ignacio Lozano, and Sébastien Deleuze for their feedback on this article.
