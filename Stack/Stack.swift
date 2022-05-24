class Stack {
	var stk = [Int]()
	
	public init() {}

	public func push(_ value : Int) {
		stk.append(value)
	}
	
	public func pop() -> Int? {
		if stk.isEmpty {
			return nil
		}
		return stk.removeLast()
	}
	
	public func top() -> Int? {
		return stk.last
	}
	
	public var isEmpty : Bool {
		return stk.isEmpty
	}
	
	public var count : Int {
		return stk.count
	}

	public func display() {
		print(stk)	
	}
}

var s = Stack()
s.push(1)
s.push(2)
s.push(3)

while !s.isEmpty {
	//print(s.top()!)
	let temp : Int = s.pop()!
	print(temp)
}
