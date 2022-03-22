func less(_ value1 : Int, _ value2 : Int) -> Bool {
	return value1 < value2
}
	
func more(_ value1 : Int, _ value2 : Int) -> Bool {
	return value1 > value2
}

func insertionSort(_ arr : inout [Int]) {
	let size = arr.count
	var temp = 0
	var i = 1
	var j : Int 

	while i < size {
		temp = arr[i]
		j = i
		while j > 0 && more(arr[j-1], temp) {
			arr[j] = arr[j-1]
			j-=1
		}
		arr[j] = temp
		i+=1
	}
}

// Testing code
/*
var data = [9, 1, 8, 2, 7, 3, 6, 4, 5]
insertionSort(&data)
print(data)
*/
import Foundation

func randArray(n:Int ) -> [Int] {
    var result:[Int] = []
    for _ in 0..<n {
        result.append(Int.random(in: 1..<100))
    }
    return result
}
func validator(_ arr : inout [Int]) {
	let size = arr.count
	var i = 0
	while i < size-2 {
		if(arr[i] > arr[i+1]) {
			print("Not sorted at index \(i)")
			print(arr)
			return
		}
		i += 1
	}
}
for i in 1...20 {
    var testArray: [Int] = randArray(n: i * 100)
    let startTime = Date()
    insertionSort(&testArray)
    let endTime = Date()
    let timeInterval: Double = endTime.timeIntervalSince(startTime)
    print("Array size = \(i*100), Time interval = \(timeInterval) sec")
	validator(&testArray)
}