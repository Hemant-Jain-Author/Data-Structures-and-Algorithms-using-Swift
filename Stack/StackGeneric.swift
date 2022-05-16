class Stack<T> {
	var stk = [T]()
	
	public init() {}

	public func push(_ value : T) {
		stk.append(value)
	}
	
	public func pop() -> T? {
		if stk.isEmpty  { 
			return nil 
		}
		return stk.removeLast()
	}
	
	public func top() -> T? {
		if stk.isEmpty {
			return nil
		}
		return stk.last!
	}
	
	public func display() {
		print(stk)	
	}

	public var isEmpty : Bool {
		return stk.isEmpty
	}
	
	public var count : Int {
		return stk.count
	}
}


var s = Stack<Int>()
s.push(1)
s.push(2)
s.push(3)

while !s.isEmpty {
	let temp : Int = s.pop()!
	print(temp)
}

s.push(11)
s.push(12)
s.push(13)
while let temp = s.pop() {
	print(temp)
}
