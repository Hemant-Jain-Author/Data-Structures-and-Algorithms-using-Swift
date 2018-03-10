func quickSort(_ arr : inout [Int]) {
	let size = arr.count
	quickSortUtil(arr : &arr, start : 0, stop : size-1)
}

func quickSortUtil(arr : inout [Int], start : Int, stop : Int) {
	if stop <= start {
		return
	}
	let pivot = arr[start]
	var lower = start+1
	var upper = stop

	while lower < upper {
		while arr[lower] <= pivot && lower < upper {
			lower+=1
		}
		while arr[upper] > pivot && lower <= upper {
			upper-=1
		}
		if lower < upper {
			arr.swapAt(upper, lower)
		}
	}
	arr.swapAt(upper, start) // upper is the pivot position
	quickSortUtil(arr : &arr, start : start, stop : upper-1) // pivot -1 is the upper for left sub array.
	quickSortUtil(arr : &arr, start : upper+1, stop : stop)  // pivot + 1 is the lower for right sub array.
}


func quicksort(Arr : inout [Int], start : Int, stop : Int) {
	if start < stop {
		let p = partition(Arr : &Arr, start : start, stop : stop)
        quicksort(Arr : &Arr, start : start, stop : p)
        quicksort(Arr : &Arr, start : p + 1, stop : stop)
	}
}

func partition(Arr : inout [Int], start : Int, stop : Int) -> Int {
	let pivot = Arr[start]
    var i = start - 1
    var j = stop + 1
    while true {
		repeat{
			i += 1
		}while Arr[i] < pivot

        repeat {
			j -= 1
		}while Arr[j] > pivot

        if i >= j {
			return j
		}

        Arr.swapAt(i, j)
	}
}

/*
var data = [9, 1, 8, 2, 7, 3, 6, 4, 5]
quickSort(&data)
print(data)
*/

import Foundation

func randArray(n:Int ) -> [Int] {
    var result:[Int] = []
    for _ in 0..<n {
        result.append(Int(rand() % 100))
    }
    return result
}

for i in 1...10 {
    var testArray: [Int] = randArray(n: i * 100)
    let startTime = Date()
    quickSort(&testArray)
    let endTime = Date()
    let timeInterval: Double = endTime.timeIntervalSince(startTime)
    print("Array size = \(i*1000), Time interval = \(timeInterval) sec")
}