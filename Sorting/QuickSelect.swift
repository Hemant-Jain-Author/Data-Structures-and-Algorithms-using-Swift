func quickSelect(_ arr : inout [Int], _ key : Int) -> Int {
	let size = arr.count
	// Kth element is at k-1 index.
	quickSelectUtil(arr : &arr, start : 0, stop : size-1, key : key - 1)
	return arr[key-1]
}

func quickSelectUtil(arr : inout [Int], start : Int, stop : Int, key : Int) {
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
	if(upper > key) {
		quickSelectUtil(arr : &arr, start : start, stop : upper-1, key : key) // pivot -1 is the upper for left sub array.
	}
	else {
		quickSelectUtil(arr : &arr, start : upper+1, stop : stop, key : key)  // pivot + 1 is the lower for right sub array.
	}
}

var data = [9, 1, 8, 2, 7, 3, 6, 4, 5]
for i in 1...9 {
	print(quickSelect(&data, i))
	data = [9, 1, 8, 2, 7, 3, 6, 4, 5]
}