class Stack<T> {
	var stk = [T]()
	
	public init() {}

	public func push(_ value : T) {
		stk.append(value)
	}
	
	public func pop() -> T? {
		return stk.popLast()
	}
	
	public func top() -> T? {
		return stk.last
	}
	
	public func display() {
		print(stk)	
	}

	public var isEmpty: Bool {
		return stk.isEmpty
	}
	
	public var count : Int {
		return stk.count
	}
}



let s = Stack<Int>()
var length = 10
var i = 0
 while i < length {
	s.push(i)
	i += 1
}
print(s.count)
i = 0
 while i <= length {
	let temp = s.pop()
	if(temp != nil) {
		print(temp!)
	}
	i += 1
}