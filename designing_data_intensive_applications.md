# 1. What is the book about as a whole?
Giving an overview of processing data. The book provides history and considerations for a person who wishes to understand what is data, what are the different types of storage and how data can be processed for various purposes.

The book tries to be useful and provide actionable advice on data design; common pitfalls and the tradeoffs between the design decisions.

# 2. What is being said in detail, and how?
Data design is a trade-off, depending on what you want to achieve. Here are the main ones:

## Speed
A lot of applications make tradeoffs for sake of speed. Consistency is not always as important as speed, especially for real users. 

## Redundancy
Non-negiotiable when it comes to scaling. Data must be copied across drives. 

## Order
There are several ways of ordering:

### Linearizability
Appearing as one copy of the data, in linear fashion. There is no concurrency and that makes it practical for smaller-case applications

### Causality
Preserves "happens before/after" for events that matter. Those that have no causal dependence are concurrent and we don't care about them. Causal dependence can be transaction, device or programmer intent

### Serializability
- Two-Phase Locking - acquire lock before write/read and release after. First, it only acquires all locks, one by one. Once the transaction is done, it only releases locks.
- Serializable Snapshot Isolation (SSI) - transactions happen on a snapshot of the data. The snapshot is being tracked with strictly increasing id and writes know which version was last read and can abort if mismatch/

## Distributed
Distributed data is difficult to reason about and difficult to manage. It comes with a lot of caveats. Here are pros and cons:

### Pros:
- It's the only way to achieve low latency for a global (world-wide) application because of network delay
- It's the only way to achieve horizontal scaling
- Provides redundancy
- It's a difficult problem so tooling is generally available like ZooKeeper which seems to be industry standard in terms of reliability at the time of writing

### Cons:
- Leader-follower is a complex system that can cause issues like split-brain (multiple leaders) if not designed correctly. Correct design at best carries overhead communication cost
- Network delay is non-deterministic
- Issues often compound like a domino effect
- Clocks are absolutely unreliable
- Order of operations is a very difficult problem and there is nuance - linearizability vs serializability

# 3. Is the book true, in whole or part?
The book is absolutely true as far as my knowledge goes. However, some advice could become outdated as the field is changing.

# 4. What of it?
Writing is easy in append mode and all issues start to arise when deleting comes into the mix. Of course, deleting is necessary for most applications so this is a design consideration rather than actionable advice. 

The philosophy of having increase-only with single source of truth (SST) is used time and time again and is incredibly useful in data integrity as each entry has a unique id and order of operations is preserved.

It's not possible to have a multiple sources of truth. Because storage does fail, you can't always rely on SST and I should consider what happens when it fails. Eventual failure becomes inevitable with scale. A good approach is redundant nodes with leader voting.

I especially liked the write-ahead-log (WAL) philosophy. In essence, the leader writes in append fashion. It is treated as SST. If a node wants to make a change, it sends a request to the leader, the leader writes to WAL and broadcasts to all workers who write in own log and send an ACK back. Because all messages have a unique ID that is increase-only, each worker knows if it's missing data and can replay messages on demand.
