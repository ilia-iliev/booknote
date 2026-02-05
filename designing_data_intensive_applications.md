# 1. What is the book about as a whole?
The book is an expository practical work of data considerations when developing software applications. Provides relevant history and development as well as various tradeoffs on data design decisions. The aim is on actionable and practical.

# 2. What is being said in detail, and how?
The book provides an overview on the most important data-related technologies such as databases, languages, encoding formats and storage types. Then the book leverages this knowledge to move to developing applications and shows through example practical considerations, race conditions and tradeoffs. 

The book first lays the foundations of data - including brief history. Then it provides an overview of the main ways of storing data and querying data. Then it moves to applications - application-level and analytics models. Provides an overview of how data is encoded on disk and various types there.

The second part is more practical - about scaling data across distributed system. Goes into more details and various tradeoffs about replication, partitioning, transactions, consistency. The focus is that everything is a tradeoff and solving any one issue usually comes at a cost. 

The last part is about processing data - batches, streams and queues. Again, focus is on practical tips.


# 3. Is the book true, in whole or part?
The book is absolutely true as far as my knowledge goes. However, some advice could become outdated as the field is changing.

# 4. What of it?
Writing is easy in append mode and all issues start to arise when deleting comes into the mix. Of course, deleting is necessary for most applications so this is a design consideration rather than actionable advice. 

The philosophy of having increase-only with single source of truth (SST) is used time and time again and is incredibly useful in data integrity as each entry has a unique id and order of operations is preserved.

It's not possible to have a multiple sources of truth. Because storage does fail, you can't always rely on SST and I should consider what happens when it fails. Eventual failure becomes inevitable with scale. A good approach is redundant nodes with leader voting.

## Data Redundancy
Non-negiotable at scale. A hard drive will fail eventually and recovery must be planned for.

## Partitioning
Consistent hashing is widely used in practice. It's basically a ring - list of nodes and each node is responsible for hash ranges. Data is inserted according to the ranges. If a node becomes too hot in range [hot_start, hot_end], we insert a new node in [hot_start, hot_halfway] and now only that data will be moved.  

## Order & Consistency
There are several ways of ordering:

### Linearizability
Appearing as one copy of the data, in linear fashion. There is no concurrency and that makes it practical for smaller-case applications

### Causality
Preserves "happens before/after" for events that matter. Those that have no causal dependence are concurrent and we don't care about them. Causal dependence can be transaction, device or programmer intent

### Serializability
- Two-Phase Locking - acquire lock before write/read and release after. First, it only acquires all locks, one by one. Once the transaction is done, it only releases locks.
- Serializable Snapshot Isolation (SSI) - transactions happen on a snapshot of the data. The snapshot is being tracked with strictly increasing id and writes know which version was last read and can abort if mismatch

## WAL
In essence, the leader writes in append fashion. It is treated as SST. If a node wants to make a change, it sends a request to the leader, the leader writes to WAL and broadcasts to all workers who write in own log and send an ACK back. Because all messages have a unique ID that is increase-only, each worker knows if it's missing data and can replay messages on demand.

