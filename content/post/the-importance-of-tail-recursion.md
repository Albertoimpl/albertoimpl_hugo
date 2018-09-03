+++
date = "2015-12-05T23:16:00Z"
draft = false
title = "The importance of tail recursion"
+++
On your way to becoming a more functional developer, you have to regain some of your recursion skills.
Recursion is pure functional programming best natural match because you don’t need any state to recurse.

If we look into its pure mathematical concept, a function has no side effects and no state. No side effects mean you can’t use counters in loops since that would be a mutable state being modified (with would be the side effect).
Recursive algorithms are simpler because they only deal with input values. In an iterative algorithm, we need to consider the list as a whole.

	def factorial_iterative(n)
	  accumulated = 1
	  while n > 1
	    accumulated = n * accumulated
	    n = n - 1
	  end
	  accumulated
	end

However, dealing with recursion is a dangerous thing, [also a bad smell](http://www.refactoring.com/catalog/replaceRecursionWithIteration.html), since we could end up with a stack overflow if we are not careful enough. The stack will expand per call. Several languages help us avoid having expanding stacks.

	def factorial_recursive(n)
	  return 1 if n <= 1
	  n * factorial_recursive(n - 1)
	end

A tail call happens when a function makes a function call as its final action so there are no outstanding operations within the function at the moment the return occurs.
If you no longer need the stack, you can unwind the recursive calls.

	def factorial_tailcall(n, accumulated=1)
	  return accumulated if n <= 1
	  factorial_tailcall(n - 1, n * accumulated)
	end

Sadly, some languages like Java don’t support tail recursion.

I've found a few tricks to reach a similar optimization using lambda expressions in Java 8. Almost like the [trampolines used in Groovy](http://mrhaki.blogspot.ie/2011/04/groovy-goodness-recursion-with-closure.html).

	def factorial
	factorial = {
	    it <= 1 ? 1 : it * factorial(it - 1)
	}

By just adding the trampoline, the function will be returning a TrampolineClosure until it reaches the value, without increasing the stack.

	def factorial
	factorial = {it, acc = 1->
	    it <= 1 ? acc : factorial.trampoline(it - 1, it * acc)
	}.trampoline()

Java 8 didn’t add any compile level tail recursion support. There are some security sensitive methods that count stack frames between JDK library code and calling code to figure out who's calling them.
We can still create our own functional interface with a similar behavior [inspired by the Groovy TrampolineClosure implementation](https://github.com/groovy/groovy-core/blob/master/src/main/groovy/lang/TrampolineClosure.java).

	@FunctionalInterface
	public interface Trampoline<V> {

	    V trampoline();

	    default V call() {
	        Object trampoline = this;
	        while (trampoline instanceof Trampoline) {
	            trampoline = ((Trampoline) trampoline).trampoline();
	        }
	        @SuppressWarnings("unchecked")
	        V value = (V) trampoline;
	        return value;
	    }
	}

By using this Trampoline interface our factorial function will look like this:

	public static Trampoline factorial(final int n, final BigInteger accumulated) {
	    return () -> {
	        if (n <= 1) return accumulated;
	        return factorial(n - 1, accumulated.multiply(BigInteger.valueOf(n)));
	    };
	}

Full examples can be found here:

- Ruby: [https://gist.github.com/AlbertoImpl/1bc5fe6f30653c4fbf58](https://gist.github.com/AlbertoImpl/1bc5fe6f30653c4fbf58)
- Java: [https://gist.github.com/AlbertoImpl/3fbf55d5310e0b185e9a](https://gist.github.com/AlbertoImpl/3fbf55d5310e0b185e9a)




