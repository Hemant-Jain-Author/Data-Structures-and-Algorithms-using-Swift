class DoublyLinkedList{
	class Node{
		var value : Int
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

	init() {
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
	
	public func peek() -> Int {
		if self.isEmpty() {
			print("Empty List Error")
		}
		return self.head!.value
	}
	
	public func addHead(_ value : Int) {
		let newNode = Node(value, nil, nil)
		if self.count == 0 {
			self.tail = newNode
			self.head = newNode
		} else {
			self.head!.prev = newNode
			newNode.next = self.head
			self.head = newNode
		}
		self.count+=1 
	}
	
	public func addTail(_ value : Int) {
		let newNode = Node(value, nil, nil)
		if self.count == 0 {
			self.head = newNode
			self.tail = newNode
		} else {
			newNode.prev = self.tail
			self.tail!.next = newNode
			self.tail = newNode
		}
		self.count+=1 
	}
	
	public func removeHead() -> (value : Int, flag : Bool) {
		if self.isEmpty() {
			print("Empty List Error")
			return (0, false)
		}
	
		let value = self.head!.value
		self.head = self.head!.next
	
		if self.head == nil {
			self.tail = nil
		} else {
			self.head!.prev = nil
		}
		self.count-=1 
		return (value, true)
	}
	
	public func removeNode(_ key : Int) -> Bool {
		var curr = self.head
		if curr == nil { // empty list
			return false
		}
		if curr!.value == key { // head is the node with value key.
			curr = curr!.next
			self.count-=1 
			if curr != nil {
				self.head = curr
				self.head!.prev = nil
			} else {
				self.tail = nil // only one element in self.
			}
			return true
		}
		while curr!.next != nil {
			if curr!.next!.value == key {
				curr!.next = curr!.next!.next
				if curr!.next == nil { // last element case.
					self.tail = curr
				} else {
					curr!.next!.prev = curr
				}
				self.count-=1 
				return true
			}
			curr = curr!.next
		}
		return false
	}
	
	public func isPresent(_ key : Int) -> Bool {
		var temp = self.head
		while temp != nil {
			if temp!.value == key {
				return true
			}
			temp = temp!.next
		}
		return false
	}
	
	public func freeList() {
		self.tail = nil
		self.head = nil
		self.count = 0
	}
	
	public func display() {
		var temp = self.head
		while temp != nil {
			print(temp!.value, terminator:" ")
			temp = temp!.next
		}
		print()
	}
	
	public func reverseList() {
		var curr = self.head
		var tempNode: Node?
		while curr != nil {
			tempNode = curr!.next
			curr!.next = curr!.prev
			curr!.prev = tempNode
			if curr!.prev == nil {
				self.tail = self.head
				self.head = curr
				return
			}
			curr = curr!.prev
		}
		return
	}
	
	public func copyListReversed(dll : inout DoublyLinkedList) {
		var curr = self.head
		while curr != nil {
			dll.addHead(curr!.value)
			curr = curr!.next
		}
	}
	
	public func copyList(dll : inout DoublyLinkedList) {
		var curr = self.head
		while curr != nil {
			dll.addTail(curr!.value)
			curr = curr!.next
		}
	}
	public func sortedInsert(_ value : Int) {
		let newNode = Node(value, nil, nil)
		var curr = self.head
		if curr == nil { // first element
			self.head = newNode
			self.tail = newNode
		}
	
		if self.head!.value <= value { // at the begining
			newNode.next = self.head
			self.head!.prev = newNode
			self.head = newNode
		}
	
		while curr!.next != nil && curr!.next!.value > value { // treversal
			curr = curr!.next
		}
	
		if curr!.next == nil { // at the end
			self.tail = newNode
			newNode.prev = curr
			curr!.next = newNode
		} else { // all other
			newNode.next = curr!.next
			newNode.prev = curr
			curr!.next = newNode
			newNode.next!.prev = newNode
		}
	}
	
	public func removeDuplicate() {
		var curr = self.head
		var deleteMe: Node?
		while curr != nil {
			if (curr!.next != nil) && curr!.value == curr!.next!.value {
				deleteMe = curr!.next
				curr!.next = deleteMe!.next
				curr!.next!.prev = curr
				if deleteMe === self.tail {
					self.tail = curr
				}
			} else {
				curr = curr!.next
			}
		}
	}
}


var ll = DoublyLinkedList()
ll.addHead(1)
ll.addHead(2)
ll.addHead(3)
ll.addHead(4)
ll.addHead(5)
ll.addHead(6)
ll.display()
print(ll.removeHead())
ll.display()
ll.freeList()
ll.display()
ll.addHead(11)
ll.addHead(21)
ll.addHead(31)
ll.addHead(41)
ll.addHead(51)
ll.addHead(61)
ll.display()