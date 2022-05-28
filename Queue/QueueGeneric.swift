class Queue<T> {
	private var que = [T]()

	public init() {}

	public var isEmpty: Bool {
		return que.count == 0
	}

	public var count: Int {
		return que.count
	}
	
	public func add(_ value : T) {
		que.append(value)
	}
	
	public func remove() -> T? {
		if que.isEmpty { 
			return nil 
		}
		return que.removeFirst()
	}

	public func front() -> T? {
		return que.first
	}
}


// Testing code
var q = Queue<Int>()
q.add(1)
q.add(2)
q.add(3)
while !q.isEmpty {
	let temp : Int = q.remove()!
	print(temp)
}
