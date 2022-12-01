class Queue<T> {
	var head : Node?
	var tail : Node?
	var count : Int

	class Node {
		var value : T
		var next : Node?

		public init(_ val : T, _ nxt : Node? = nil) {
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
	
	public func peek() -> T? {
		if self.isEmpty() {
			print("QueueEmptyException")
			return nil
		}
	
		return self.head!.value
	}
	
	public func add(_ value : T) {
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
	
	public func remove() -> T? {
		if self.isEmpty() {
			print("QueueEmptyException")
			return nil
		}
	
		let value = self.head!.value
		self.head = self.head!.next
		self.count -= 1
		return value
	}
	
	public func display() {
		var temp = self.head
		print("Queue :: ", terminator:"")
		while temp != nil {
			
			print(temp!.value, terminator:" ")
			temp = temp!.next
		}
	}
}

// Testing code.
let que : Queue<Int> = Queue<Int>();
que.add(1);
que.add(2);
que.add(3);
print("Queue remove : " + String(que.remove()!));
print("Queue remove : " + String(que.remove()!));
