+++
date = "2016-01-11T22:03:14Z"
draft = false
title = "The Boy Scout Rule"

+++

Every other developer has been in a situation where they see a very nasty piece of code they don't even want to look at.

What should I do there? Why would I bother fixing it, causing more bugs and delaying the task I am now working on?
There are a couple of metaphors that I like and try to apply and share with every colleague I work with.

Back in the 70s [a program for “Safe and Clean Neighborhoods” in the State of New Jersey was created.](http://www.theatlantic.com/magazine/archive/1982/03/broken-windows/304465/) The program was aimed to develop a criminological theory of the effects of urban disorder that is known today as the 'broken window theory'.

When you see a building, or a street that is completely clean, you don’t want to be the first to mess it up.
However, if you see a dirty street, you don’t care that much about throwing something extra to the floor.

If you see a piece of paper and you don’t pick it up, it will look like nobody cares about the street, so people will stop caring, making the street dirtier.

The same happens with our software, if we decide to continue the tangle and add more quick-win, bad code into the system, it will be a rotten project sooner than later.

**One broken window leads to many broken windows.**

{{< figure src="/broken-window.jpg" alt="Broken window" >}}

The Boy Scouts have a rule that says: **“Always leave the campground cleaner than you found it”.**
If you find a piece of paper in the floor, pick it up regardless of who threw it there.

If we follow similar rules with our code we should always refactor every module we touch, regardless of who first created it. The whole project will just increase its quality over time and will give us that “always refactoring mode” we all should have. **Einstein once said that “there is no force so powerful in the universe as compound interest”**

The time spent in refactoring the module you are working
on, once you understand its logic, is way lower than if you set up a task to fix it in the future, you will have to regain the knowledge to know exactly what to do there.

**Dogs aren't just for Christmas and features aren’t just for the next release**

So, the next time you see something that shouldn’t be there, refactor it, talk about this theory with your colleagues and predicate with the example. May the software we all build be professional and a pleasant to work with system.

