
func less(_ value1 : Int, _ value2 : Int) -> Bool {
	return value1 < value2
}
	
func more(_ value1 : Int, _ value2 : Int) -> Bool {
	return value1 > value2
}

//bubbleSort sorting method.
func bubbleSort(_ arr :inout [Int]) {
	let size = arr.count
	var i = 0
	while i < (size - 1) {
		var j = 0
		while j < size-i-1 {
			if more(arr[j], arr[j+1]) {
				arr.swapAt(j, j+1)
			}
			j+=1
		}
		i+=1
	}
}

//bubbleSort2 sorting method.
func bubbleSort2(_ arr :inout [Int]) {
	let size = arr.count
	var swapped = 1
	var i = 0
	while i < (size - 1) && swapped == 1 {
		swapped = 0
		var j = 0
		while j < size-i-1 {
			if more(arr[j], arr[j+1]) {
				arr.swapAt(j, j+1)
				swapped = 1
			}
			j+=1
		}
		i+=1
	}
}


// Testing code 
/*
var data = [9, 1, 8, 2, 7, 3, 6, 4, 5]
bubbleSort2(&data)
print(data)
*/

import Foundation
#if os(Windows)
public func arc4random_uniform(_ max: UInt32) -> Int32 {
  return (rand() % Int32(max-1))
}
#endif

func randArray(n:Int ) -> [Int] {
    var result:[Int] = []
    for _ in 0..<n {
        result.append(Int(arc4random_uniform(100)))
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
    bubbleSort(&testArray)
    let endTime = Date()
    let timeInterval: Double = endTime.timeIntervalSince(startTime)
    print("Array size = \(i*100), Time interval = \(timeInterval) sec")
	validator(&testArray)
}