func quickSort(_ arr : inout [Int]) {
	let size = arr.count
	quickSortUtil(arr : &arr, start : 0, stop : size-1)
}

func quickSortUtil(arr : inout [Int], start : Int, stop : Int) {
	if stop <= start {
		return
	}
	let pivot = arr[start]
	var lower = start
	var upper = stop

	while lower <= upper {
		if(arr[lower] > pivot) {
			arr.swapAt(upper, lower)
			upper -= 1
		} else {
			lower += 1
		}
	}
	arr.swapAt(upper, start) // upper is the pivot position
	quickSortUtil(arr : &arr, start : start, stop : upper-1) // pivot -1 is the upper for left sub array.
	quickSortUtil(arr : &arr, start : upper+1, stop : stop)  // pivot + 1 is the lower for right sub array.
}

func quickSort2(_ arr : inout [Int]) {
	let size = arr.count
	quickSortUtil2(arr : &arr, start : 0, stop : size-1)
}

func quickSortUtil2(arr : inout [Int], start : Int, stop : Int) {
	if start < stop {
		let p = partition(arr : &arr, start : start, stop : stop)
        quickSortUtil2(arr : &arr, start : start, stop : p)
        quickSortUtil2(arr : &arr, start : p + 1, stop : stop)
	}
}

func partition(arr : inout [Int], start : Int, stop : Int) -> Int {
	let pivot = arr[start]
    var i = start - 1
    var j = stop + 1
    while true {
		repeat{
			i += 1
		}while arr[i] < pivot

        repeat {
			j -= 1
		}while arr[j] > pivot

        if i >= j {
			return j
		}

        arr.swapAt(i, j)
	}
}

/*
var data = [9, 1, 8, 2, 7, 3, 6, 4, 5]
quickSort(&data)
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
    quickSort(&testArray)
    let endTime = Date()
    let timeInterval: Double = endTime.timeIntervalSince(startTime)
    print("Array size = \(i*100), Time interval = \(timeInterval) sec")
	validator(&testArray)
}