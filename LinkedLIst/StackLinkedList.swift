

class Stack {
	var head : Node?
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
	
	public func peek() -> (value : Int, flag  : Bool) {
		if self.isEmpty() {
			print("StackEmptyException")
			return (0, false)
		}
		return (self.head!.value, true)
	}
	
	public func push(_ value : Int) {
		self.head = Node(value, self.head)
		self.count += 1
	}
	
	public func pop() -> (value:Int, flag:Bool) {
		if self.isEmpty() {
			print("StackEmptyException")
			return (0, false)
		}
	
		let value = self.head!.value
		self.head = self.head!.next
		self.count -= 1
		return (value, true)
	}
	
	public func display() {
		var temp = self.head
		print("Value stored in stck are :: ")
		while temp != nil {
			print(temp!.value, terminator:" ")
			temp = temp!.next
		}
		print()
	}
}

let s = Stack()
var i = 1
while i <= 100 {
	s.push(i)
	i += 1
}
print("popped values are :: ")
i = 1
while i <= 120 {
	print(s.pop().value, terminator:" ")
	i += 1
}