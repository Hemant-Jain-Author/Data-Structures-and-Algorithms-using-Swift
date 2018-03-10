class Queue {
	var head : Node?
	var tail : Node?
	var count : Int

	class Node {
		var value : Int
		var next : Node?

		public init(_ val : Int) {
			self.value = val
			self.next = nil
		}

		public init(_ val : Int, _ nxt : Node?) {
			self.value = val
			self.next = nxt
		}
	}

	public init() {
		self.head = nil
		self.count = 0
	}

	public func size() -> Int {
		return self.count
	}
	
	public func isEmpty() -> Bool {
		return self.count == 0
	}
	
	public func peek() -> (value:Int, flag:Bool) {
		if self.isEmpty() {
			print("QueueEmptyException")
			return (0, false)
		}
	
		return (self.head!.value, true)
	}
	
	public func add(value : Int) {
		let temp = Node(value)
		if self.head == nil {
			self.head = temp
			self.tail = temp
		} else {
			self.tail!.next = temp
			self.tail = temp
		}
		self.count += 1
	}
	
	public func remove() -> (value:Int, flag:Bool) {
		if self.isEmpty() {
			print("QueueEmptyException")
			return (0, false)
		}
	
		let value = self.head!.value
		self.head = self.head!.next
		self.count -= 1
		return (value, true)
	}
	
	public func display() {
		var temp = self.head
		while temp != nil {
			print(temp!.value, terminator:" ")
			temp = temp!.next
		}
	}
}

let q = Queue()
var i = 1
while i <= 10 {
	q.add(value:i)
	i += 1
}

i = 1
while i <= 5 {
	print(q.remove())
	i += 1
}