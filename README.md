# IndexedDictionary is an implementation of an ordered Dictionary with access to items by index

A dictionary is a hash table providing quick access to the records it contains by keys. Keys can be of any hashable type. The most common way to access values in a dictionary is to use a key as a subscript. 
The disadvantage of Dictionary is that it is an unordered collection. In particular, the order you insert items into a Dictionary doesn’t define the order they’re iterated.

IndexedDictionary is designed for tasks where you want to preserve the order of items in the Dictionary in which they were added and have quick access to the "key-value" by index, which is the sequence number of the record in the Dictionary.

### Advantages of IndexedDictionary

- IndexedDictionary stores a collection of "key-value" pairs in the order in which they are added to the Dictionary. 
- Iteration through IndexedDictionary always occurs in the same order.
- Access to value by key with O(1) complexity.
- Accessing a "key-value" by index with O(1) complexity.
- Adding a new item with O(1) complexity.
- Display a visual representation of the "index-key-value" sequence in Dictionary.

### Limitations

- IndexedDictionary keys can be of any type implementing the `Hashable` protocol.
- Values can be of any type, subject to the restrictions below.
- Adding a new key-value pair is possible only at the end of IndexedDictionary using `add(key: Key, value: Value)` method.
- It is not possible to remove an item inside an IndexedDictionary. Only the last item can be removed using the `removeLast()` method. With the `removeAll()` method, you can clear the entire IndexedDictionary.
- To implement the `getIndexesFor(value: Value)` method, the type of values stored in the IndexedDictionary must conform to the `Equatable` protocol.
- To be able to print all "index-key-values" stored in IndexedDictionary, the values type must conform to the `CustomStringConvertible` protocol.
