//bubbleSort sorting method.
func bubbleSort(_ arr :inout [Int]) {
	let size = arr.count
	var i = 0
	while i < (size - 1) {
		var j = 0
		while j < size-i-1 {
			if (arr[j] > arr[j+1]) {
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
			if (arr[j] > arr[j+1]) {
				arr.swapAt(j, j+1)
				swapped = 1
			}
			j+=1
		}
		i+=1
	}
}

import Foundation

func randArray(n:Int ) -> [Int] {
    var result:[Int] = []
    for _ in 0..<n {
        result.append(Int(rand() % 100))
    }
    return result
}

for i in 1...20 {
    var testArray: [Int] = randArray(n: i * 100)
    let startTime = Date()
    bubbleSort(&testArray)
    let endTime = Date()
    let timeInterval: Double = endTime.timeIntervalSince(startTime)
    print("Array size = \(i*100), Time interval = \(timeInterval) sec")
}


/*
var data = [9, 1, 8, 2, 7, 3, 6, 4, 5]
bubbleSort2(&data)
print(data)
*/