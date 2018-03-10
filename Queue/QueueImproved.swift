struct Queue {
	fileprivate var que = [Int]()
	fileprivate var head : Int = 0

	public init() {}

	public mutating func add(_ value : Int) {
		que.append(value)
	}
	
	public var isEmpty: Bool {
    	return count == 0
  	}

  	public var count: Int {
    	return que.count - head
  	}

	public mutating func remove() -> Int? {
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

	public func top() -> Int? {
		guard head < que.count else { 
			return nil 
		}

		return que[head]
	}
}


var s = Queue()
var length = 100
var i = 0
while i < length {
	s.add(i)
	i += 1
}
print(s.count)
i = 0
while i < length/2 {
	let temp = s.remove()
	if(temp != nil) {
		print(temp!)// as Any)
	}
	i += 1
}

/*
https://stackoverflow.com/questions/25846561/printing-optional-variable
*/