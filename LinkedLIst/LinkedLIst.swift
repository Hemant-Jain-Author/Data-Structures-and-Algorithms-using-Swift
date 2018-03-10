class List {
	var head : Node?
	var count : Int

	class Node {
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

	public init() {
		self.head = nil
		self.count = 0
	}

// Sum returns the sum of the list elements.
public func sum() -> Int {
	var temp = self.head
	var sum = 0
	while temp != nil {
		sum += temp!.value
		temp = temp!.next
	}
	return sum
}

public func size() -> Int {
	return self.count
}

public func isEmpty() -> Bool {
	return (self.count == 0)
}

public func peek() -> (value : Int, flag : Bool) {
	guard let head = self.head else {
		print("EmptyListException")
		return (0, false)
	}
	return (head.value, true)
}

public func addHead(value : Int) {
	self.head = Node(value, self.head)
	self.count += 1
}

public func addTail(value : Int) {
	var curr = self.head
	let newNode = Node(value, nil)
	if curr == nil {
		self.head = newNode
		return
	}
	while curr!.next != nil {
		curr = curr!.next
	}
	curr!.next = newNode
}

public func display() {
	var curr = self.head
	while curr != nil {
		print(curr!.value, terminator: " ")
		curr = curr!.next
	}
	print("")
}

public func sortedInsert(value : Int) {
	let newNode = Node(value, nil)
	var curr = self.head

	if curr == nil || curr!.value > value {
		newNode.next = self.head
		self.head = newNode
		return
	}
	while curr!.next != nil && curr!.next!.value < value {
		curr = curr!.next
	}

	newNode.next = curr!.next
	curr!.next = newNode
}

public func isPresent(data : Int) -> Bool {
	var temp = self.head
	while temp != nil {
		if temp!.value == data {
			return true
		}
		temp = temp!.next
	}
	return false
}

public func removeHead() -> (value : Int, flag : Bool) {
	guard let head = self.head else {
		print("EmptyListException")
		return (0, false)
	}
	let value = head.value
	self.head = head.next
	self.count -= 1
	return (value, true)
}

public func deleteNode(delValue : Int) -> Bool {
	var temp = self.head
	if self.isEmpty() {
		print("EmptyListException")
		return false
	}

	if delValue == self.head!.value {
		self.head = self.head!.next
		self.count -= 1
		return true
	}

	while temp!.next != nil {
		if temp!.next!.value == delValue {
			temp!.next = temp!.next!.next
			self.count -= 1
			return true
		}
		temp = temp!.next
	}
	return false
}

public func deleteNodes(delValue : Int) {
	var currNode = self.head
	while currNode != nil && currNode!.value == delValue {
		self.head = currNode!.next
		currNode = self.head
	}

	while currNode != nil {
		let nextNode = currNode!.next
		if nextNode != nil && nextNode!.value == delValue {
			currNode!.next = nextNode!.next
		} else {
			currNode = nextNode
		}
	}
}

public func freeList() {
	self.head = nil
	self.count = 0
}

public func reverse() {
	var curr = self.head
	var prev : Node?
	var next : Node?
	while curr != nil {
		next = curr!.next
		curr!.next = prev
		prev = curr
		curr = next
	}
	self.head = prev
}

public func reverseRecurse() {
	self.head = reverseRecurseUtil( currentNode : self.head, nextNode : nil)
}

private func reverseRecurseUtil(currentNode : Node?, nextNode : Node?) -> Node? {
	guard let currentNode = currentNode else {
		return nil
	}

	if currentNode.next == nil {
		currentNode.next = nextNode
		return currentNode
	}

	let ret = reverseRecurseUtil(currentNode : currentNode.next, nextNode : currentNode)
	currentNode.next = nextNode
	return ret
}

public func removeDuplicate() {
	var curr = self.head
	while curr != nil {
		if curr!.next != nil && curr!.value == curr!.next!.value {
			curr!.next = curr!.next!.next
		} else {
			curr = curr!.next
		}
	}
}
public func copyListReversed() -> List {
	var tempNode : Node? = nil
	var tempNode2 : Node? = nil
	var curr = self.head
	while curr != nil {
		tempNode2 = Node(curr!.value, tempNode)
		curr = curr!.next
		tempNode = tempNode2
	}
	let ll2 = List()
	ll2.head = tempNode
	return ll2
}

public func copyList() -> List {
	var headNode : Node, tailNode : Node, tempNode : Node
	var curr = self.head

	if curr == nil {
		let ll2 = List()
		ll2.head = nil
		return ll2
	}

	headNode = Node(curr!.value, nil)
	tailNode = headNode
	curr = curr!.next

	while curr != nil {
		tempNode = Node(curr!.value, nil)
		tailNode.next = tempNode
		tailNode = tempNode
		curr = curr!.next
	}
	let ll2 = List()
	ll2.head = headNode
	return ll2
}

public func compareList(ll : List) -> Bool {
	return compareListUtil(head1 : self.head, head2 : ll.head)
}

private func compareListUtil(head1 : Node?, head2 : Node?) -> Bool {
	if head1 == nil && head2 == nil {
		return true
	} else if (head1 == nil) || (head2 == nil) || (head1!.value != head2!.value) {
		return false
	} else {
		return compareListUtil(head1 : head1!.next, head2 : head2!.next)
	}
}

public func findLength() -> Int {
	var curr = self.head
	var count = 0
	while curr != nil {
		count += 1
		curr = curr!.next
	}
	return count
}

public func nthNodeFromBegining(index : Int) -> (value : Int, flag : Bool) {
	if index > self.size() || index < 1 {
		print("TooFewNodes")
		return (0, false)
	}
	var count = 0
	var curr = self.head
	while curr != nil && count < index-1 {
		count += 1
		curr = curr!.next
	}
	return (curr!.value, true)
}

public func nthNodeFromEnd(index : Int) -> (value : Int, flag : Bool) {
	let size = self.count
	if size != 0 && size < index {
		print("TooFewNodes")
		return (0, false)
	}
	let startIndex = size - index + 1
	return nthNodeFromBegining(index : startIndex)
}

public func nthNodeFromEnd2(index : Int) -> (value : Int, flag : Bool) {
	var count = 1
	var forward = self.head
	var curr = self.head
	while forward != nil && count <= index {
		count += 1
		forward = forward!.next
	}

	if forward == nil {
		print("TooFewNodes")
		return (0, false)
	}

	while forward != nil {
		forward = forward!.next
		curr = curr!.next
	}
	return (curr!.value, true)
}

public func makeLoop() {
	var temp = self.head
	while temp != nil {
		if temp!.next == nil {
			temp!.next = self.head
			return
		}
		temp = temp!.next
	}
}

public func loopDetect() -> Bool {
	var slowPtr = self.head
	var fastPtr = self.head

	while fastPtr!.next != nil && fastPtr!.next!.next != nil {
		slowPtr = slowPtr!.next
		fastPtr = fastPtr!.next!.next
		if slowPtr! === fastPtr! {
			print("loop found")
			return true
		}
	}
	print("loop not found")
	return false
}


public func reverseListLoopDetect() -> Bool {
	let tempHead = self.head
	reverse()
	if tempHead === self.head {
		reverse()
		print("loop found")
		return true
	}
	reverse()
	print("loop not found")
	return false
}

public func loopTypeDetect() -> Int {
	var slowPtr = self.head
	var fastPtr = self.head
	while fastPtr!.next != nil && fastPtr!.next!.next != nil {
		if self.head === fastPtr!.next || self.head === fastPtr!.next!.next {
			print("circular list loop found")
			return 2
		}
		slowPtr = slowPtr!.next
		fastPtr = fastPtr!.next!.next
		if slowPtr === fastPtr {
			print("loop found")
			return 1
		}
	}
	print("loop not found")
	return 0
}

public func removeLoop() {
	let loopPoint = loopPointDetect()
	if loopPoint === nil {
		return
	}

	var firstPtr = self.head
	if loopPoint === self.head {
		while firstPtr!.next !== self.head {
			firstPtr = firstPtr!.next
		}
		firstPtr!.next = nil
		return
	}

	var secondPtr = loopPoint
	while firstPtr!.next !== secondPtr!.next {
		firstPtr = firstPtr!.next
		secondPtr = secondPtr!.next
	}
	secondPtr!.next = nil
}

public func loopPointDetect() -> Node? {
	var slowPtr = self.head
	var fastPtr = self.head

	while fastPtr!.next != nil && fastPtr!.next!.next != nil {
		slowPtr = slowPtr!.next
		fastPtr = fastPtr!.next!.next
		if slowPtr === fastPtr {
			return slowPtr
		}
	}
	return nil
}


public func findIntersection(h1 : Node?, h2 : Node?) -> Node? {
	var head = h1
	var head2 = h2
	var l1 = 0
	var l2 = 0
	var tempHead = head
	var tempHead2 = head2
	while tempHead != nil {
		l1 += 1
		tempHead = tempHead!.next
	}
	while tempHead2 != nil {
		l2 += 1
		tempHead2 = tempHead2!.next
	}
	var diff : Int
	if l1 < 12 {
		let temp = head
		head = head2
		head2 = temp
		diff = l2 - l1
	} else {
		diff = l1 - l2
	}
	while diff > 0 {
		head = head!.next
		diff -= 1
	}
	while head! !== head2! {
		head = head!.next
		head2 = head2!.next
	}
	return head
}
}

var lst = List()
lst.addHead(value:1)
lst.addHead(value:2)
lst.addHead(value:3)
lst.display()
var lst2 = lst.copyList()
print(lst.compareList(ll:lst2))
var lst3 = lst.copyListReversed()
lst3.display()
print(lst.isPresent(data:7))
print(lst.isPresent(data:4))