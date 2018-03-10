
func selectionSort(_ arr : inout [Int]) {
	let size = arr.count
	var ( i, j, max ) = (0,0,0)
	while i < size-1 {
		max = 0
		j = 1
		while j < size-1-i {
			if arr[j] > arr[max] {
				max = j
			}
			j+=1
		}
		arr.swapAt(size-1-i, max)
		i+=1
	}
}

func selectionSort2(_ arr : inout [Int]) {
	let size = arr.count
	var ( i, j, min) = (0,0,0)
	while i < size-1 {
		min = i
		j = i + 1
		while j < size {
			if arr[j] < arr[min] {
				min = j
			}
			j+=1
		}
		arr.swapAt(i, min)
		i+=1
	}
}

var data = [9, 1, 8, 2, 7, 3, 6, 4, 5]
selectionSort(&data)
print(data)
var data2 = [9, 1, 8, 2, 7, 3, 6, 4, 5]
selectionSort2(&data2)
print(data2)

