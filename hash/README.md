# Hashes

Hashes are just a kind of Map, and such an important one that it deserves its own challenge. Hashes implement all the Map methods (set, get, etc.)

## Why is this important?

Hashes are _fast_. Inserting and retrieving records are both constant time (O(1)). In other words it will take the same amount of time to set and fetch from the hash table no matter how big it is. This is a wonderful property. In addition to providing a fast key:value collection, Hashes can be used to create Sets that can check membership in constant time.

## Release 1, Implement a Hash

### Interface

Implement and test a `Hash` class, you can use Ruby's array on this one behind the scenes if you'd like.

Your Hash should only use Strings as keys. Don't worry about other types.

Since a Hash is a kind of Map, it has the same interface:

- `Hash::new`: Instantiate a new dictionary
- `Hash#set(key, value)`: Add a key-value pair. If the key is already present, replace the value
- `Hash#get(key)`: Retrieve the value stored at `key`
- `Hash#has_key?(key)`: Answer where or not the dictionary has an entry for `key`
- `Hash#remove(key)`: Remove the entry stored at `key`
- `Hash#iterate{ |value, key| block }`: Iterate through the Hash, passing the block each value and key

Each of these methods (except iterate) should be O(1).

### Things to think about

 * What data structure have you used that provides constant-time reads and writes?
 * How can you use that structure to your advantage?
 * Read Wikipedia's entry on [Hash Tables](http://en.wikipedia.org/wiki/Hash_table) if you get stuck
 * How will you produce a [Hash Function](http://en.wikipedia.org/wiki/Hash_function) for a String? Note: it doesn't need to be a perfect hash function, collisions are OK


## Release 2, Why are Hashes fast?

In a file called `notes.md`, describe _why_ Hash operations are so fast. What about them gives us these constant time methods? What are some downsides of a hash?

## Release 3, Implement a HashSet

Implement and test a `HashSet` class. Your HashSet should conform to the Set interface:

### Interface

- `HashSet::new()`: Instantiate a new empty HashSet.
- `HashSet#add(element)`: Add an element to the set (if necessary)
- `HashSet#remove(element)`: Remove `element` from the set if it's present
- `HashSet#contains?(element)`: Answer whether or not `element` is in the set
- `HashSet#iterate{ |element| block }`: Iterate through all of the elements of the receiver
- `HashSet#size`: Return the size of the set

Make sure `#add`, `#remove`, `#contains`, and `#size` are constant time.
