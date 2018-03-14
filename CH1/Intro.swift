// func IncrementPassByValue(x : Int) {
// 	x+=1
// }

// func IncrementPassByPointer(x : inout Int) {
// 	x+=1
// }

// var i = 10
// print("Value of i bewhilee increment is : \(i)")
// IncrementPassByValue(i)
// print("Value of i after increment is : \(i)")

// print("Value of i bewhilee increment is : \(i)")
// IncrementPassByPointer(&i)
// print("Value of i after increment is : \(i)")

struct coord {
	var x : Int
	var y : Int
}

func arrayExample() {
	var arr = [Int](repeating: 0, count : 10 )
	var i = 0
	while i < 10 {
		arr[i] = i
		i+=1
	}
	print(arr)
}

func sliceExample() {
	var s = [Int]()
	var i = 0
	while i < 10 {
		s.append(i)
		i+=1
	}
	print(s)
}

func gcd(_ m : Int, _ n : Int) -> Int {
	if m < n {
		return gcd(n, m)
	}
	if m%n == 0 {
		return n
	}
	return gcd(n, m%n)
}

print("GCD 5 3 \(GCD(5,3))")

func permutation(_ data : inout [Int], _ i : Int, _ length : Int) {
	if length == i {
		print(data)
		return
	}
	var j = i
	while j < length {
		data.swapAt(i, j)
		permutation(&data, i+1, length)
		data.swapAt(i, j)
		j+=1
	}
}

var data = [Int](repeating: 0, count : 5 )
var i = 0
while i < 5 {
	data[i] = i
	i+=1
}
permutation(&data, 0, 5)

func function2() {
	print("fun2 line 1")
}

func function1() {
	print("fun1 line 1")
	function2()
	print("fun1 line 2")
}

func main() {
	print("main line 1")
	function1()
	print("main line 2")
}

main()

func variableExample() {
	let var1 = 100
	let var2 = 200
	let var3 = var1 + var2
	print("Adding \(var1) and \(var2) will give \(var3)")
}
variableExample()

func sumArray(_ data : [Int]) -> Int {
	let size = data.count
	var total = 0
	var index = 0
	while index < size {
		total = total + data[index]
		index+=1
	}
	return total
}

var data3 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print("sum of all the values in array:\(sumArray(data3))")

func sequentialSearch(data : [Int], value : Int) -> Bool {
	let size = data.count
	var i = 0
	while i < size {
		if value == data[i] {
			return true
		}
		i+=1
	}
	return false
}

func binarySearch(data : [Int], value : Int) -> Bool {
	let size = data.count
	var mid : Int
	var low = 0
	var high = size - 1
	while low <= high {
		mid = low + (high-low)/2 // To avoid the overflow
		if data[mid] == value {
			return true
		} else {
			if data[mid] < value {
				low = mid + 1
			} else {
				high = mid - 1
			}
		}
	}
	return false
}

func rotateArray(_ data :inout [Int], _ k : Int) {
	let n = data.count
	reverseArray(&data, 0, k-1)
	reverseArray(&data, k, n-1)
	reverseArray(&data, 0, n-1)
}

func reverseArray( _ data : inout [Int], _ start : Int, _ end : Int) {
	var i = start
	var j = end
	while i < j {
		data.swapAt(i, j)
		i+=1
		j-=1
	}
}

var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
rotateArray(&arr, 4)
print(arr)


func reverseArray2(data : inout [Int]) {
	var i = 0
	var j = data.count - 1
	while i < j {
		data.swapAt(i, j)
		i+=1
		j-=1
	}
}


func maxSubArraySum(_ data : [Int]) -> Int {
	let size = data.count
	var maxSoFar = 0
	var maxEndingHere = 0
	var i = 0
	while i < size {
		maxEndingHere = maxEndingHere + data[i]
		if maxEndingHere < 0 {
			maxEndingHere = 0
		}
		if maxSoFar < maxEndingHere {
			maxSoFar = maxEndingHere
		}
		i+=1
	}
	return maxSoFar
}

var data2 = [1, -2, 3, 4, -4, 6, -14, 8, 2]
print("Max sub array sum :\(maxSubArraySum(data2))")

func factorial(_ i : Int) -> Int {
	// Termination Condition
	if i <= 1 {
		return 1
	}
	// Body, Recursive Expansion
	return i * factorial(i-1)
}

print("factorial 5 is :: \(factorial(5))")




var point = coord(x:10, y:10)
print("X axis coord value is  \(point.x)")
print("Y axis coord value is  \(point.y)")

struct Student  {
	var rollNo : Int
	var firstName : String
	var lastName : String

	func getFirstName() -> String {
		return self.firstName
	}

	func getLastName() -> String {
		return self.lastName
	}

	func getRollNo() -> Int {
		return self.rollNo
	}
}

var ptrStud = Student(rollNo:1, firstName:"hemant",lastName:"jain")
print("Student Name: \(ptrStud.getFirstName()) \(ptrStud.getLastName()) Roll No: \(ptrStud.getRollNo())")

func sum(_ num1 : Int, _ num2 : Int) -> Int {
	let result = num1 + num2
	return result
}

// calling a function to calculate sum
var result2 = sum(10, 20)
print("sum is : \(result2)")

// local variable definition
var x = 10
var y = 20
// calling a function to find sum
let result = sum(x, y)
print("Sum is : \(result)")

func binarySearchRecursive(_ data : inout [Int], _ value : Int) -> Bool {
	return binarySearchRecursive(&data, 0, data.count, value)
}

func binarySearchRecursive(_ data : inout [Int], _ low : Int, _ high : Int, _ value : Int) -> Bool {
	if(low > high) {
		return false
	}

	let mid = low + (high-low)/2 // To afunc the overflow
	if data[mid] == value {
		return true
	} else if data[mid] < value {
		return binarySearchRecursive(&data, mid+1, high, value)
	} else {
		return binarySearchRecursive(&data, low, mid-1, value)
	}
}

var arr2 = [1,3,5,6,8,9,11,14,17,18]
print(binarySearchRecursive(&arr2, 9))
print(binarySearchRecursive(&arr2, 7))
