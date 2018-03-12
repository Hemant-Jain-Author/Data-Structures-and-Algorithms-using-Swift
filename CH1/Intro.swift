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

func ArrayExample() {
	var arr = [Int](repeating: 0, count : 10 )
	var i = 0
	while i < 10 {
		arr[i] = i
		i+=1
	}
	print(arr)
}

func SliceExample() {
	var s = [Int]()
	var i = 0
	while i < 10 {
		s.append(i)
		i+=1
	}
	print(s)
}

func Permutation(_ data : inout [Int], _ i : Int, _ length : Int) {
	if length == i {
		print(data)
		return
	}
	var j = i
	while j < length {
		data.swapAt(i, j)
		Permutation(&data, i+1, length)
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
Permutation(&data, 0, 5)

func GCD(_ m : Int, _ n : Int) -> Int {
	if m < n {
		return GCD(n, m)
	}
	if m%n == 0 {
		return n
	}
	return GCD(n, m%n)
}

print("GCD 5 3 \(GCD(5,3))")

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

func MaxSubArraySum(_ data : [Int]) -> Int {
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
print("Max sub array sum :\(MaxSubArraySum(data2))")

func VariableExample() {
	let var1 = 100
	let var2 = 200
	let var3 = var1 + var2
	print("Adding \(var1) and \(var2) will give \(var3)")
}
VariableExample()

func VectorExample() {
	var data = [Int](repeating: 0, count : 10 )
	var i = 0 
	while i < 10 {
		data[i] = i
		i+=1
	}
	print(data)
}
VectorExample()

func SumArray(_ data : [Int]) -> Int {
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
print("sum of all the values in array:\(SumArray(data3))")

func SequentialSearch(data : [Int], value : Int) -> Bool {
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

func BinarySearch(data : [Int], value : Int) -> Bool {
	let size = data.count
	var mid : Int
	var low = 0
	var high = size - 1
	while low <= high {
		mid = low + (high-low)/2 // To afunc the overflow
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

func RotateArray(_ data :inout [Int], k : Int) {
	let n = data.count
	ReverseArray(&data, 0, k-1)
	ReverseArray(&data, k, n-1)
	ReverseArray(&data, 0, n-1)
}

func ReverseArray( _ data : inout [Int], _ start : Int, _ end : Int) {
	var i = start
	var j = end
	while i < j {
		data.swapAt(i, j)
		i+=1
		j-=1
	}
}

func ReverseArray2(data : inout [Int]) {
	var i = 0
	var j = data.count - 1
	while i < j {
		data.swapAt(i, j)
		i+=1
		j-=1
	}
}

var point = coord(x:10, y:10)
print("X axis coord value is  \(point.x)")
print("Y axis coord value is  \(point.y)")

struct student  {
	var rollNo : Int
	var firstName : String
	var lastName : String

	func GetFirstName() -> String {
		return self.firstName
	}

	func GetLastName() -> String {
		return self.lastName
	}

	func GetRollNo() -> Int {
		return self.rollNo
	}
}

var ptrStud = student(rollNo:1, firstName:"hemant",lastName:"jain")
print("Student Name: \(ptrStud.GetFirstName()) \(ptrStud.GetLastName()) Roll No: \(ptrStud.GetRollNo())")

func Sum(_ num1 : Int, _ num2 : Int) -> Int {
	let result = num1 + num2
	return result
}

// calling a function to calculate sum
var result2 = Sum(10, 20)
print("Sum is : \(result2)")

// local variable definition
var x = 10
var y = 20
// calling a function to find sum
let result = Sum(x, y)
print("Sum is : \(result)")

func Factorial(_ i : Int) -> Int {
	// Termination Condition
	if i <= 1 {
		return 1
	}
	// Body, Recursive Expansion
	return i * Factorial(i-1)
}

print("factorial 5 is :: \(Factorial(5))")

func BinarySearchRecursive(_ data : inout [Int], _ low : Int, _ high : Int, _ value : Int) -> Int {
	let mid = low + (high-low)/2 // To afunc the overflow
	if data[mid] == value {
		return mid
	} else if data[mid] < value {
		return BinarySearchRecursive(&data, mid+1, high, value)
	} else {
		return BinarySearchRecursive(&data, low, mid-1, value)
	}
}
