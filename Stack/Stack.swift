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
		if stk.isEmpty {
			return nil
		}
		let length = stk.count
		let res = stk[length-1]
		return res
	}
	
	public func isEmpty() -> Bool {
		return stk.isEmpty
	}
	
	public func length() -> Int {
		return stk.count
	}
}


var s = Stack()
var length = 10
var i = 0
 while i < length {
	s.push(i)
	i += 1
}
print(s.length())
i = 0
 while i < length {
	let temp = s.pop()
	if(temp != nil) {
		print(temp!)// as Any)
	}
	i += 1
}

/*
https://stackoverflow.com/questions/25846561/printing-optional-variable
*/