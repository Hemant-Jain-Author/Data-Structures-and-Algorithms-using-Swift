class CircularLinkedList{
	class Node{
		var value : Int
		var next : Node?

		init(_ val : Int) {
			self.value = val
			self.next = nil
		}

		init(_ val : Int, _ nxt : Node?) {
			self.value = val
			self.next = nxt
		}
	}

	var tail : Node?
	var count : Int

	init() {
		self.tail = nil
		self.count = 0
	}

	func size() -> Int {
		return self.count
	}
	
	func isEmpty() -> Bool {
		return self.count == 0
	}
	
	func peek() -> Int {
		if self.isEmpty() {
			print("EmptyListException")
			return 0
		}
		return self.tail!.next!.value
	}
	
	func addHead(_ value : Int) {
		let temp = Node(value, nil)
		if self.isEmpty() {
			self.tail = temp
			temp.next = temp
		} else {
			temp.next = self.tail!.next
			self.tail!.next = temp
		}
		self.count+=1 
	}
	
	func addTail(_ value : Int) {
		let temp = Node(value, nil)
		if self.isEmpty() {
			self.tail = temp
			temp.next = temp
		} else {
			temp.next = self.tail!.next
			self.tail!.next = temp
			self.tail = temp
		}
		self.count+=1 
	}
	
	func removeHead() -> Int {
		if self.isEmpty() {
			print("EmptyListException")
			return 0
		}
		let value = self.tail!.next!.value
	
		if self.tail === self.tail!.next {
			self.tail = nil
		} else {
			self.tail!.next = self.tail!.next!.next
		}
		self.count-=1 
		return value
	}
	
	func isPresent(_ data : Int) -> Bool {
		var temp = self.tail
		var i = 0 
		while i < self.count {
			if temp!.value == data {
				return true
			}
			i+=1
			temp = temp!.next
		}
		return false
	}
	
	func display() {
		if self.isEmpty() {
			return
		}
		var temp = self.tail!.next
		while temp !== self.tail {
			print(temp!.value, terminator:" ")
			temp = temp!.next
		}
		print(temp!.value)
	}
	
	func freeList() {
		self.tail = nil
		self.count = 0
	}
	
	func removeNode(_ key : Int) -> Bool {
		if self.isEmpty() {
			return false
		}
	
		var prev = self.tail
		var curr = self.tail!.next
		let head = self.tail!.next
	
		if curr!.value == key { // head and single node case.
			if curr === curr!.next { // single node case
				self.tail = nil
			} else { // head case
				self.tail!.next = self.tail!.next!.next
			}
			return true
		}
	
		prev = curr
		curr = curr!.next
	
		while curr !== head {
			if curr!.value == key {
				if curr === self.tail {
					self.tail = prev
				}
				prev!.next = curr!.next
				return true
			}
			prev = curr
			curr = curr!.next
		}
		return false
	}
	
	func copyListReversed() -> CircularLinkedList {
		let cl = CircularLinkedList()
		var curr = self.tail!.next
		let head = curr
	
		if curr != nil {
			cl.addHead(curr!.value)
			curr = curr!.next
		}
		while curr !== head {
			cl.addHead(curr!.value)
			curr = curr!.next
		}
		return cl
	}
	
	func copyList() -> CircularLinkedList {
		let cl = CircularLinkedList()
		var curr = self.tail!.next
		let head = curr
	
		if curr != nil {
			cl.addTail(curr!.value)
			curr = curr!.next
		}
		while curr !== head {
			cl.addTail(curr!.value)
			curr = curr!.next
		}
		return cl
	}

}

var ll = CircularLinkedList()
ll.addHead(1)
ll.addHead(2)
ll.addHead(3)
ll.addHead(1)
ll.addHead(2)
ll.addHead(3)
ll.display()