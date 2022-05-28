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

class QueueUsingStack {
	var stk1 = Stack<Int>()
	var stk2 = Stack<Int>()

	public init() {}

	public func add(_ value : Int) {
		stk1.push(value)
	}

	public func remove() -> Int {
		var value : Int
		if stk2.isEmpty == false {
			value = stk2.pop()!
			return value
		}

		while stk1.isEmpty == false {
			value = stk1.pop()!
			stk2.push(value)
		}

		value = stk2.pop()!
		return value
	}
}

// Testing code
var que = QueueUsingStack()
que.add(1)
que.add(11)
que.add(111)
print(que.remove())
print(que.remove())
print(que.remove())
print(que.remove())
print(que.remove())
