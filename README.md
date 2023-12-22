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
- Adding a new key-value pair is possible only at the end of IndexedDictionary using `add(key:, value:)` method.
- It is not possible to remove an item inside an IndexedDictionary. Only the last item can be removed using the `removeLast()` method. With the `removeAll()` method, you can clear the entire IndexedDictionary.
- To implement the `getIndexesFor(value:)` method, the type of values stored in the IndexedDictionary must conform to the `Equatable` protocol.
- To be able to print all "index-key-values" stored in IndexedDictionary, the values type must conform to the `CustomStringConvertible` protocol.

### API

```swift
// public struct IndexedDictionary<Key, Value> where Key: Hashable

count // number of items in the Dictionary
isEmpty // returns true if the Dictiobary is empty and false otherwise
keysInOrder // returns an index-ordered Array of keys or nil if the dictionary is empty
valuesInOrder // returns an index-ordered Array of values or nil if the dictionary is empty
first // returns the first "key-value" pair or nil if the dictionary is empty
last // returns the last "key-value" pair or nil if the dictionary is empty
init() /*  initializer that creates an empty IndexedDictionary. When calling this
initialiser, you must pass to it generic parameters - types keys and values. */
init(firstKey: Key, firstValue: Value) /* initializer that creates an IndexedDictionary
instance with the first "key-value" pair. When calling it, the generic parameters of keys
and values types can be omitted explicitly. */
subscript(key: Key) -> Value? /* returns an optional value for the key or sets a new value
for the given key */
subscript(index: Int) -> (key: Key, value: Value) /* returns a key-value pair at the given
index or sets a new value at the key that matches the given index. Checking the validity
of the index, as in Array, is the responsibility of the programmer. If you enter an index
outside the range (0..<count) you will get a runtime error. */
add(key: Key, value: Value) /* adds a new "key-value" pair to the Dictionary with an index
that is 1 greater than the index of the last item. */
removeLast() -> (key: Key, value: Value)? /* method that removes the last "key-value" pair,
if it exists, and returns its optional value. */
removeAll() // method that completely clears the Dictionary.
getIndexFor(key: Key) -> Int? // method that returns an optional index value on the given key.
getIndexesFor(value: Value) -> [Int]? /* method that returns an optional Array of
indices for the given value. To implement this method, the type of values must conform
to the Equatable protocol. */
description /* forms a string describing all items in the Dictionary. To implement this
method the values type must conform to the CustomStringConvertible protocol. */
```

### How to integrate IndexedDictionary into your project

- Open your project in XCode, in the project settings open the Package Dependencies tab, click + , paste the link "https://github.com/Konst-Is/IndexedDictionary.git" into the search box and click "Add Package".
- In the file where you will use IndexedDictionary, add "import IndexedDictionary".
