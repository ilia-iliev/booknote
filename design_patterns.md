AUTHOR: Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides

# 1. What is the book about as a whole?
The book systematizes and describes object-oriented design patterns. A design pattern in that context is an abstracation of how objects relate to each other while balancing reusability of objects and encapsulation of logic. The book provides an overview of the most common such patterns, with sample code and thoughts about tradeoffs and when are they useful.

# 2. What is being said in detail, and how?
Designing a great system does require reusability. It is useful to systematize what OOP typically use - so that terminology is unified and discussion and planning is eased. The book breaks the patterns into three types:

## Creational 
Related to creation of new objects

1. Factory - an object that let's the client select what other object to create. i.e. factory.create("dog) or factory.create("cat") 
2. Abstract Factory - encapsulates related objects; a single instance of abstract factory A creates objects A_1 and A_2 but instance B creates B_2 and B_1
3. Builder - responsible solely for building the object because of complex instantiation that is not needed after building
4. Prototype - provides a way to clone an existing object instead of initializing a new one
5. Singleton - ensures that the conrete object is built once. Could be lazy.

## Structural
Related to composing how objects relations

1. Adapter - it "adapts" the interface of A to B. This is especially useful when A is internal and B is external
2. Bridge - it's like an adapter but both A and B are interfaces. So B provides implementations for B1, B2, B3... and A provides implementations for A1,A2,A3... And we get the combinations
3. Composite - a "group" of objects that has the same interface as an individual object and passes functionality down to the members
4. Decorator - a "wrapper" around a class that handles dynamically injecting new functionality without defining new classes
5. Facade - hides internal implementation and object coupling by providing a more intuitive 'facade' for interacting with idiosyncracy
6. Flyweight - provides a 'shared' object that can be used in many classes or other objects to save resources
7. Proxy - it's a class that stands in the way of requests to internal object. This can be useful for load balancing or any request pre-processing.

## Behavioral
Related to objects with typical common 

1. Chain of Responsibility - objects with common interface are 'chained' like A->B->C... There is some common method that either processes the request or forwards it down the chain
2. Command - an object that encapsulates a request; instead of having object A know about object B and call it directly - we introduce command C that implements the request and where it goes
3. Iterator - provides a way to traverse a composition of objects. The idea is to decouple the traversal logic from the composition. 
4. Mediator - an isolated implementation of the coupling instead of having the classes reference each other, being tighly coupled
5. Memento - snapshot is a better name; a way to save/pass/load the current state of the object
6. Observer - a 'notificaton' for objects of class A that can subscribe when a method is invoked in another class B
7. State - an object can have different behaviours given it's internal state. Instead of if/else-ing, a 'state' is an object that implements all possible state-behaviours
8. Strategy - an interface of algorithms that can be changed at runtime. S (interface) implemented by A,B,C... algorithms. Then object O can choose if it wants A,B or C at runtime.
9. Template - an implementation of algorithm with chosen dedicated (not all!) methods that can be overridden by sub-strategies
10. Visitor - encapsulates an algorithm that is typically expected to reference a large number of object. Dedicates algorithm state and custom logic away from class implementation.

# 3. Is the book true, in whole or part?
I have personally experienced many of the patterns and the book is absolutely true in that regard. It does a great job of systematizing some of the common patterns.

I personally dislike some of the names of the patterns - for example Snapshot is to me a more descriptive name than Memento or Cache vs Flyweight. But the goal of providing a common framework for naming conventions is achieved

# 4. What of it?
I should use the naming conventions of the book. What's more, it's a good idea to do refactoring with those patterns in mind. I should experiment with injecting them into code assistant as a skill to do refactoring. Nevertheless, it's useful to refer back to the names and be reminded every once in a while of them every time I move from prototyping to refactoring.

