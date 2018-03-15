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

func isBalancedParenthesis(expn : String) -> Bool {
	let stk = Stack<Character>()
	var val : Character?
	for ch in expn {
		switch ch {
		case "{", "[", "(":
			stk.push(ch)
		case "}":
			val = stk.pop()
			if val == nil || val! != "{" {
				return false
			}
		case "]":
			val = stk.pop()
			if val == nil || val! != "[" {
				return false
			}
		case ")":
			val = stk.pop()
			if val == nil || val! != "(" {
				return false
			}
		default :
			print()
		}
	}
	return stk.isEmpty
}

// Testing code

var expn = "{()}[]"
var value = isBalancedParenthesis(expn : expn)
print("Given Expn: \(expn)")
print("isBalancedParenthesis: \(value)")
expn = "{()}[][][()][][]{)"
value = isBalancedParenthesis(expn : expn)
print("Given Expn: \(expn)")
print("isBalancedParenthesis: \(value)")

func insertAtBottom(stk : inout Stack<Int>, value : Int) {
	if stk.isEmpty {
		stk.push(value)
	} else {
		let out = stk.pop()
		insertAtBottom(stk : &stk, value : value)
		stk.push(out!)
	}
}

func reverseStack(stk : inout Stack<Int>) {
	if stk.isEmpty {
		return
	}
	let value = stk.pop()
	reverseStack(stk : &stk)
	insertAtBottom(stk : &stk, value : value!)
}


func postfixEvaluate(expn : String) -> Int {
	let stk = Stack<Int>()
	let expArr = expn.split(separator : " ")
	for tkn in expArr {
		if let value = Int(tkn) {
			stk.push(value)
		} else {
			let num1 = stk.pop()!
			let num2 = stk.pop()!

			switch tkn {
			case "+":
				stk.push(num1 + num2)
			case "-":
				stk.push(num1 - num2)
			case "*":
				stk.push(num1 * num2)
			case "/":
				stk.push(num1 / num2)
			default :
				break
			}
		}
	}
	return stk.pop()!
}

// Testing code
let expn = "6 5 2 3 + 8 * + 3 + *"
let value = postfixEvaluate(expn: expn)
print("Given Postfix Expn: \(expn)")
print("Result after Evaluation: \(value)")

func precedence(_ x : Character) -> Int {
	if x == "(" {
		return (0)
	}
	if x == "+" || x == "-" {
		return (1)
	}
	if x == "*" || x == "/" || x == "%" {
		return (2)
	}
	if x == "^" {
		return (3)
	}
	return (4)
}

func infixToPostfix(expn : String) -> String {
	print(expn)
	let stk = Stack<Character>()
	var output = ""
	var out : Character?

	for ch in expn {
		if ch <= "9" && ch >= "0" {
			output.append(ch)
		} else {
			switch ch {
			case "+", "-", "*", "/", "%", "^":
				while stk.isEmpty == false && precedence(ch) <= precedence(stk.top()!) {
					out = stk.pop()
					output = output + " "
					output.append(out!)
				}
				stk.push(ch)
				output = output + " "
			case "(":
				stk.push(ch)
			case ")":
				while stk.isEmpty == false && stk.top()! != "(" {
					out = stk.pop()
					output = output + " " 
					output.append(out!)
					output = output + " "
				}
				if stk.isEmpty == false && stk.top()! == "(" {
					_ = stk.pop()
				}
			default :
				print()
			}
		}
	}

	while stk.isEmpty == false {
		out = stk.pop()
		output.append(out!)
		output = output + " "
	}
	return output
}

// Testing code
let expn = "10+((3))*5/(16-4)"
let value = infixToPostfix(expn : expn)
print("Infix Expn: \(expn)")
print("Postfix Expn: \(value)")

func stockSpanRange(arr : [Int]) -> [Int] {
	var SR = Array(repeating: 0, count: arr.count)

	SR[0] = 1
	var i = 1
	while i < arr.count {
		SR[i] = 1
		var j = i - 1
		while (j >= 0) && (arr[i] >= arr[j]) {
			SR[i]+=1
			j-=1
		}
		i+=1
	}
	return SR
}

func stockSpanRange2(arr : [Int]) -> [Int] {
	let stk = Stack<Int>()
	var SR = Array(repeating: 0, count: arr.count)
	stk.push(0)
	SR[0] = 1
	var i = 1
	while i < arr.count {
		while stk.isEmpty == false && arr[stk.top()!] <= arr[i] {
			_ = stk.pop()
		}
		if stk.isEmpty {
			SR[i] = (i + 1)
		} else {
			SR[i] = (i - stk.top()!)
		}
		stk.push(i)
		i+=1
	}
	return SR
}

// Testing code
let stock = [4, 6, 8, 12, 2, 1, 7, 8]
print(stock)
print(stockSpanRange(arr:stock))
print(stockSpanRange2(arr:stock))

func getMaxArea(arr : [Int]) -> Int {
	let size = arr.count
	var maxArea = -1
	var currArea = 0
	var minHeight = 0
	var i = 1
	while i < size {
		minHeight = arr[i]
		var j = i - 1
		while j >= 0 {
			if minHeight > arr[j] {
				minHeight = arr[j]
			}
			currArea = minHeight * (i - j + 1)
			if maxArea < currArea {
				maxArea = currArea
			}
			j-=1
		}
		i+=1
	}
	return maxArea
}

func getMaxArea2(arr : [Int]) -> Int {
	let size = arr.count
	let stk = Stack<Int>()
	var maxArea = 0
	var Top = 0
	var TopArea = 0
	var i = 0
	while i < size {
		while (i < size) && (stk.isEmpty || arr[stk.top()!] <= arr[i]) {
			stk.push(i)
			i+=1
		}
		while stk.isEmpty == false && (i == size || arr[stk.top()!] > arr[i]) {
			Top = stk.top()!
			_ = stk.pop()
			if stk.isEmpty {
				TopArea = arr[Top] * i
			} else {
				TopArea = arr[Top] * (i - stk.top()! - 1)
			}

			if maxArea < TopArea {
				maxArea = TopArea
			}
		}
	}
	return maxArea
}

// Testing code
let stock = [4, 6, 8, 12, 2, 1, 7, 8]
print(stock)
print(getMaxArea(arr:stock))
print(getMaxArea2(arr:stock))