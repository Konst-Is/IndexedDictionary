public struct IndexedDictionary<Key, Value> where Key: Hashable {
    
    private var keysAndValues = Dictionary<Key, Value>()
    private var indexesAndKeys = Dictionary<Int, Key>()
    public var count = 0
    
    public var isEmpty: Bool {
        keysAndValues.isEmpty
    }
    
    public var keysInOrder: [Key]? {
        guard !isEmpty else { return nil }
        return (0..<count).map { indexesAndKeys[$0]! }
    }
    
    public var valuesInOrder: [Value]? {
        guard !isEmpty else { return nil }
        return (0..<count).map { keysAndValues[indexesAndKeys[$0]!]! }
    }
    
    public var first: (key: Key, value: Value)? {
        guard !isEmpty else { return nil }
        let key = indexesAndKeys[0]!
        return (key, keysAndValues[key]!)
    }
    
    public var last: (key: Key, value: Value)? {
        guard !isEmpty else { return nil }
        let key = indexesAndKeys[count - 1]!
        return (key, keysAndValues[key]!)
    }
    
    public init(firstKey: Key, firstValue: Value) {
        self.keysAndValues[firstKey] = firstValue
        self.indexesAndKeys[0] = firstKey
        self.count = 1
    }
    
    public init() {
    }
    
    public subscript(key: Key) -> Value? {
        get {
            guard let value = keysAndValues[key] else { return nil }
            return value
        }
        set {
            guard keysAndValues[key] != nil, let newValue = newValue else { return }
            keysAndValues[key] = newValue
        }
    }
    
    public subscript(index: Int) -> (key: Key, value: Value) {
        get {
            guard (0..<count).contains(index) else { fatalError() }
            let key = indexesAndKeys[index]!
            return (key, keysAndValues[key]!)
        }
        set {
            guard (0..<count).contains(index) else { return }
            let key = indexesAndKeys[index]!
            keysAndValues[key] = newValue.value
        }
    }
    
    public mutating func add(key: Key, value: Value) {
        keysAndValues[key] = value
        count += 1
        indexesAndKeys[count - 1] = key
    }
    
    @discardableResult
    public mutating func removeLast() -> (key: Key, value: Value)? {
        guard !isEmpty else { return nil }
        let lastValue = last!
        keysAndValues[lastValue.key] = nil
        indexesAndKeys[count - 1] = nil
        count -= 1
        return lastValue
    }
    
    public mutating func removeAll() {
        keysAndValues = [:]
        indexesAndKeys = [:]
        count = 0
    }
    
    public func getIndexForKey(key: Key) -> Int? {
        guard keysAndValues[key] != nil else { return nil }
        var index = 0
        for i in 0..<count {
            if indexesAndKeys[i] == key {
                index = i
                break
            }
        }
        return index
    }
    
}

public extension IndexedDictionary where Value: Equatable {
    
    func getIndexesForValue(value: Value) -> [Int]? {
        guard !isEmpty else { return nil }
        var indexes: [Int]? = []
        for i in 0..<count {
            if keysAndValues[indexesAndKeys[i]!] == value {
                indexes?.append(i)
            }
        }
        return indexes
    }
    
}

extension IndexedDictionary: CustomStringConvertible where Value: CustomStringConvertible {
    
    public var description: String {
        guard !isEmpty else { return "nil" }
        var str = "["
        for i in 0..<count {
            let key = indexesAndKeys[i]!
            str += "index: \(i), key: \(key), value: \(keysAndValues[key]!)\n"
        }
        str = String(str.dropLast(1)) + "]"
        return str
    }
    
}

