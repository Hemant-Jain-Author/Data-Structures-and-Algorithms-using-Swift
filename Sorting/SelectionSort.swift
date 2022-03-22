
func selectionSort(_ arr : inout [Int]) {
	let size = arr.count
	var ( i, j, max ) = (0,0,0)
	while i < size {
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

// Testing code

/*
var data = [9, 1, 8, 2, 7, 3, 6, 4, 5]
selectionSort(&data)
print(data)
*/
/*
var data2 = [9, 1, 8, 2, 7, 3, 6, 4, 5]
selectionSort2(&data2)
print(data2)
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
    selectionSort2(&testArray)
    let endTime = Date()
    let timeInterval: Double = endTime.timeIntervalSince(startTime)
    print("Array size = \(i*100), Time interval = \(timeInterval) sec")
	validator(&testArray)
}