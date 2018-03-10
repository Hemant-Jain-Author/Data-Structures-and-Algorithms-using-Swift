func quickSelect(_ arr : inout [Int], _ key : Int) -> Int {
	let size = arr.count
	quickSelectUtil(arr : &arr, start : 0, stop : size-1, key : key)
	return arr[key-1]
}

func quickSelectUtil(arr : inout [Int], start : Int, stop : Int, key : Int) {
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
	if(upper > key) {
		quickSelectUtil(arr : &arr, start : start, stop : upper-1, key : key) // pivot -1 is the upper for left sub array.
	}
	else {
		quickSelectUtil(arr : &arr, start : upper+1, stop : stop, key : key)  // pivot + 1 is the lower for right sub array.
	}
}

var data = [9, 1, 8, 2, 7, 3, 6, 4, 5]
print(quickSelect(&data, 7))
