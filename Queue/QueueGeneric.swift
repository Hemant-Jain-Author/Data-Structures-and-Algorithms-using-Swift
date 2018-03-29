class Queue<T> {
	fileprivate var que = [T]()
	fileprivate var head : Int = 0

	public init() {}

	public var isEmpty: Bool {
		return count == 0
	}

	public var count: Int {
		return que.count - head
	}
	
	public func add(_ value : T) {
		que.append(value)
	}
	
	public func remove() -> T? {
		guard head < que.count else { 
			return nil 
		}
		let element = que[head]
		head += 1

		// Minimum 50 elements need to be freed.
		// One forth of the of total elements need to be freed.
		if(head > 50 && head * 4 > count) {
			que.removeFirst(head)
			head = 0
			print("array size modified.")
		}		
		return element
	}

	public func front() -> T? {
		guard head < que.count else { 
			return nil 
		}
		return que[head]
	}
}


// Testing code
var q = Queue<Int>()
q.add(1)
q.add(2)
q.add(3)
var temp = q.remove()
if(temp != nil) {
	print(temp!)
}
temp = q.remove()
if(temp != nil) {
	print(temp!)
}


/*
var s = Queue<Int>()
var length = 100
var i = 0
while i < length {
	s.add(i)
	i += 1
}
print(s.count)
i = 0
while i < length*2 {
	let temp = s.remove()
	if(temp != nil) {
		print(temp!)
	}
	i += 1
}
*/