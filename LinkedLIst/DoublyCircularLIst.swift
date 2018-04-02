class DoublyCircularLinkedList{
	class Node{
		var value: Int
		var next : Node?
		var prev : Node?

		init(_ val : Int) {
			self.value = val
			self.next = nil
			self.prev = nil
		}

		init(_ val : Int, _ nxt : Node?, _ prv : Node?) {
			self.value = val
			self.next = nxt
			self.prev = prv
		}
	}
	
	var head : Node?
	var tail : Node?
	var count : Int

	public init() {
		self.head = nil
		self.tail = nil
		self.count = 0
	}

	public func size() -> Int {
		return self.count
	}
	
	public func isEmpty() -> Bool {
		return self.count == 0
	}
	
	public func peekHead() -> Int {
		if self.isEmpty() {
			print("Empty List Error")
		}
		return self.head!.value
	}
	//Other methods

	public func addHead(value: Int) {
		let newNode = Node(value)
		if self.count == 0 {
			self.tail = newNode
			self.head = newNode
			newNode.next = newNode
			newNode.prev = newNode
		} else {
			newNode.next = self.head
			newNode.prev = self.head!.prev
			self.head!.prev = newNode
			newNode.prev!.next = newNode
			self.head = newNode
		}
		self.count+=1 
	}
	
	public func addTail(value: Int) {
		let newNode = Node(value)
		if self.count == 0 {
			self.head = newNode
			self.tail = newNode
			newNode.next = newNode
			newNode.prev = newNode
		} else {
			newNode.next = self.tail!.next
			newNode.prev = self.tail
			self.tail!.next = newNode
			newNode.next!.prev = newNode
			self.tail = newNode
		}
		self.count+=1 
	}

	public func display() {
		if self.isEmpty() {
			return
		}
		print("List size is ::", self.count)
		print("List content :: ")
		var temp = self.head
		while true {
			print(temp!.value, terminator: " ")
			temp = temp!.next
			if temp === self.head {
				break
			}
		}
		print()
	}

	public func isPresent(key: Int) -> Bool {
		var temp = self.head
		if self.head == nil {
			return false
		}
	
		while true {
			if temp!.value == key {
				return true
			}
			temp = temp!.next
			if temp === self.head {
				break
			}
		}
		return false
	}
	
	public func freeList() {
		self.head = nil
		self.tail = nil
		self.count = 0
	}
	
	public func removeHead() -> (value : Int, flag : Bool) {
		if self.count == 0 {
			print("Empty List Error")
			return (0, false)
		}
	
		let value = self.head!.value
		self.count-=1 
	
		if self.count == 0 {
			self.head = nil
			self.tail = nil
			return (value, true)
		}
	
		let next = self.head!.next
		next!.prev = self.tail
		self.tail!.next = next
		self.head = next
		return (value, true)
	}
	
	public func removeTail() -> (value : Int, flag : Bool) {
		if self.count == 0 {
			print("Empty List Error")
			return (0, false)
		}
	
		let value = self.tail!.value
		self.count-=1 
		if self.count == 0 {
			self.head = nil
			self.tail = nil
			return (value, true)
		}
	
		let prev = self.tail!.prev
		prev!.next = self.head
		self.head!.prev = prev
		self.tail = prev
		return (value, true)
	}
}

var ll = DoublyCircularLinkedList()
ll.addHead(value:1)
ll.addHead(value:2)
ll.addHead(value:3)
ll.addHead(value:1)
ll.addHead(value:2)
ll.addHead(value:3)
ll.display()
