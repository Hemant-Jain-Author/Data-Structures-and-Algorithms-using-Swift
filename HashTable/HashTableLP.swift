
class HashTable {
	var Arr : [Int]
	var Flag : [NodeState]
	var tableSize : Int

	enum NodeState{
		case EmptyNode
		case LazyDeleted
		case FilledNode
	}

	public init(tSize : Int) {
		self.tableSize = tSize
		self.Arr = Array(repeating:0, count:(tSize + 1))
		self.Flag = Array(repeating:NodeState.EmptyNode, count:(tSize + 1))
	}
	
	func computeHash(key : Int) -> Int {
		// This is most simple hash function
		// more complex hash function can be used
		return key % self.tableSize
	}
	
	func resolverFun(index : Int) -> Int {
		return index
	}
	
	func add(_ value : Int) -> Bool {
		var hashValue = self.computeHash(key : value)
		var i = 0
		while i < self.tableSize {
			if self.Flag[hashValue] == NodeState.EmptyNode || self.Flag[hashValue] == NodeState.LazyDeleted {
				self.Arr[hashValue] = value
				self.Flag[hashValue] = NodeState.FilledNode
				return true
			}
			hashValue  +=  self.resolverFun(index:i)
			hashValue %= self.tableSize
			i += 1
		}
		return false
	}
	
	func find(_ value : Int) -> Bool {
		var hashValue = self.computeHash(key : value)
		var i = 0
		while  i < self.tableSize {
			if self.Flag[hashValue] == NodeState.EmptyNode {
				return false
			}
			if self.Flag[hashValue] == NodeState.FilledNode && self.Arr[hashValue] == value {
				return true
			}
			hashValue  +=  self.resolverFun(index:i)
			hashValue %= self.tableSize
			i += 1
		}
		return false
	}
	
	func remove(_ value : Int) -> Bool {
		var hashValue = self.computeHash(key : value)
		var i = 0
		while i < self.tableSize {
			if self.Flag[hashValue] == NodeState.EmptyNode {
				return false
			}
			if self.Flag[hashValue] == NodeState.FilledNode && self.Arr[hashValue] == value {
				self.Flag[hashValue] = NodeState.LazyDeleted
				return true
			}
			hashValue  +=  self.resolverFun(index:i)
			hashValue %= self.tableSize
			i += 1
		}
		return false
	}
	
	func display() {
		print("\nValues Stored in HashTable are::")
		var i = 0
		while i < self.tableSize {
			if self.Flag[i] == NodeState.FilledNode {
				print("Node at index [", i, " ] :: ", self.Arr[i])
			}
			i += 1
		}
	}
}


var ht = HashTable(tSize:1000)
print(ht.add(89))
print(ht.add(18))
print(ht.add(49))
print(ht.add(58))
print(ht.add(69))
print(ht.add(89))
print(ht.add(18))
print(ht.add(49))
print(ht.add(58))
print(ht.add(69))
ht.display()
print("89 found : \(ht.find(89))")
print(ht.remove(89))
print(ht.remove(18))
print(ht.remove(49))
print(ht.remove(58))
print(ht.remove(69))
ht.display()


/*
Values Stored in HashTable are::
Node at index [18 ] :: 18
Node at index [19 ] :: 18
Node at index [49 ] :: 49
Node at index [50 ] :: 49
Node at index [58 ] :: 58
Node at index [59 ] :: 58
Node at index [69 ] :: 69
Node at index [70 ] :: 69
Node at index [89 ] :: 89
Node at index [90 ] :: 89

Values Stored in HashTable are::
Node at index [19 ] :: 18
Node at index [50 ] :: 49
Node at index [59 ] :: 58
Node at index [70 ] :: 69
Node at index [90 ] :: 89
*/
