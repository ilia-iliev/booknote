# 1. What is the book about as a whole?
The book provides a philosophy on programming. Gives a framework of thinking about programming as a craft and lists some actionable tips and practical that naturally stem from that philosophy.

# 2. What is being said in detail, and how?
Programming is a craft and should be treated as one. A practitioner should feel pride in his work and should employ continuous effort in improving - both his work and himself.

## Philosophy
- take responsibility for the code you work on
- fix bad code and decisions as soon as identified; broken windows attract crime
- work in small steps rather than big sweeps
- software can never be perfect, so focus on delivery
- continuously invest in updating knowledge
- communication with the user is critical

## Approach
- DRY - Don't Repeat Yourself
- Code should be designed to be decoupled
- Allow for flexibility; don't lock into a single option when there are viable others
- Tracer bullets: involve the users as early as possible to gather feedback
- Prototype to validate a lesson before committing more resources
- Creating a Domain-Specific-Language is a great way to simplify a problem
- Estimating time to solve a problem is a skill and must be treated as one

## Tools
- Prioritize human readability, i.e. natural text
- Invest in learning shell commands
- Invest in learning IDE
- Invest in learning source control tools
- Invest in learning debugging 
- Invest in learning tools for automated text manipulation
- Automated Code generation is a great way to achieving DRY

## Paranoia
- Design by Contract - formalize requirements, result and constraints of classes (invariants)
- Terminate when assumptions are violated
- Use assertions whenever possible
- Use exceptions for exceptional cases
- Explicitly de-allocate what was allocated

## Bend or Break
- Law of Demeter: an object (O) method (M) is allowed to call: 
  1. methods belonging to O
  2. parameters passed to M
  3. objects created by M
  4. component objects to O
- Use configuration files for settings. The code should use abstractions
- Plan and design in advance what can be made concurrent
- Separate view from model
- Use "blackboards" - design an algorithm that supports read/write/pop/notify to decouple data from decision

## While you are coding
- Don't program by coincidence - understand the program and its assumptions
- Learn to estimate algorithm speed
- Refactor early and often
- Design your code to be testable
- Don't depend on things you don't understand

## Before the project
- Formalize requirements and needs
- Challenge constraints
- If starting is daunting, do a prototype
- Specifications must ultimately result in doing
- Formal Methods (UML, waterfall, agile) are a starting point but don't always fit

## Pragmatic Projects
- A good team is a multiplier. Put the effort into organizing a team around pragmatic philosophy
- Build team automation
- Test extensively
- Integrate documentation tooling
- Manage user expectations - underpromise, overdeliver
- Put your name on your work

# 3. Is the book true, in whole or part?
The advice of the book is sound. The bit about treating your work as a craft - signing it and feeling pride resonates especially. Most of the advice flows naturally from that. The book covers a lot of topics and is a bit light on some details - for example, organizing teams, communication skills and testing software deserve own books. In that sense, there is some actionable and clear advice (like DRY) and some general directions. 

I don't agree with some of the tips - for example, design by contract is a good idea but formalizing it into comments is not always necessary and tends to bloat functions/classes that should be trivial. Also, managing documentation makes sense in some cases but the overhead is not always worth it when the team is small.

# 4. What of it?
I agree with the mental framework that programming must be treated as a craft; that tools change and that the individual must have a sound to rely on.

I wholeheartedly agree with the philosophical framework of taking responsibility for own code. I also like the advice about involvement with the user and started using that advice in practice. I have implemented some of the advice that particularly resonated in my code assistant - about DRY, refactoring often, isolating configuration, exceptions being exceptional.

I experimented with assertions in code and using code generation but found it to be more trouble than it's worth. I realized I value readability of the code and some of the advice goes against that - design by contract, elaborate documentation.

A takeaway from the book is that have to invest more in researching how to implement tests; I feel like this is more possible than ever with code assistants. However I struggle with rapidly evolving code and I find that I'm spending more and more time fixing tests after each new change/iteration.
