class HashTableSC{
	class Node{
		var value : Int
		var next : Node?

		init(value:Int, next:Node?) {
			self.value = value
			self.next = next
		}
	}

	var listArray : [Node?]
	var tableSize : Int
	
	public init() {
		self.tableSize = 101
		self.listArray = Array(repeating: nil, count: self.tableSize)
	}
	
	func computeHash(key : Int) -> Int {
		// This is most simple hash function
		// more complex hash function can be used.
		return key % self.tableSize
	}
	
	func add(_ value : Int) {
		let index = self.computeHash(key : value)
		let temp = Node(value : value, next : self.listArray[index])
		self.listArray[index] = temp
	}
	
	func remove(_ value : Int) -> Bool {
		let index = self.computeHash(key : value)
		var nextNode : Node? 
		var head : Node? = self.listArray[index]
		if head != nil && head!.value == value {
			self.listArray[index] = head!.next
			return true
		}
		while head != nil {
			nextNode = head!.next
			if nextNode != nil && nextNode!.value == value {
				head!.next = nextNode!.next
				return true
			}
			head = nextNode
		}
		return false
	}
	
	func display() {
		var i = 0
		while i < self.tableSize {
			var head = self.listArray[i]
			if head != nil {
				print("\nValues at index :: \(i) are :: ", terminator:" ")
			}
			while head != nil {
				print(head!.value, terminator:" ")
				head = head!.next
			}
			i += 1
		}
	}
	
	func find(_ value : Int) -> Bool {
		let index = self.computeHash(key : value)
		var head = self.listArray[index]
		while head != nil {
			if head!.value == value {
				return true
			}
			head = head!.next
		}
		return false
	}
}



var ht = HashTableSC()
ht.add(89)
ht.display()
print()
print("89 found : \(ht.find(89))")