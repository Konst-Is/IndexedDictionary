# IndexedDictionary is an implementation of an ordered Dictionary with access to items by index

A dictionary is a hash table providing quick access to the records it contains by keys. Keys can be of any hashable type. The most common way to access values in a dictionary is to use a key as a subscript. 
The disadvantage of Dictionary is that it is an unordered collection. In particular, the order you insert items into a Dictionary doesn’t define the order they’re iterated.
IndexedDictionary is designed for tasks where you want to preserve the order of items in the Dictionary in which they were added and have quick access to the "key-value" by index, which is the sequence number of the record in the Dictionary.
