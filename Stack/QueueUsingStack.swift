class Stack<T> {
	var stk = [T]()
	
	public init() {}

	public func push(_ value : T) {
		stk.append(value)
	}
	
	public func pop() -> T {
		return stk.removeLast()
	}
	
	public func top() -> T {
		let length = stk.count
		let res = stk[length-1]
		return res
	}
	
	public func display() {
		print(stk)	
	}

	public func isEmpty() -> Bool {
		return stk.isEmpty
	}
	
	public func length() -> Int {
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
	if stk2.isEmpty() == false {
		value = stk2.pop()
		return value
	}

	while stk1.isEmpty() == false {
		value = stk1.pop()
		stk2.push(value)
	}

	value = stk2.pop()
	return value
}
}

var que = QueueUsingStack()
que.add(1)
que.add(11)
que.add(111)
print(que.remove())
que.add(2)
que.add(21)
que.add(211)
print(que.remove())
print(que.remove())
print(que.remove())
print(que.remove())
print(que.remove())
