func bucketSort(_ data : inout [Int], _ lowerRange : Int, _ upperRange : Int) {
	let rng = upperRange - lowerRange
	let size = data.count
	var count = [Int](repeating: 0, count : rng )
	var i = 0
	while i < size {
		count[data[i]-lowerRange]+=1
		i+=1
	}

	var j = 0
	i = 0
	while i < rng {
		while count[i] > 0 {
			data[j] = i + lowerRange
			j+=1
			count[i]-=1
		}
		i+=1
	}
}

// Testing code
/*
var data = [23, 24, 22, 21, 26, 25, 27, 28, 21, 21]
bucketSort(&data, 20, 30)
print(data)
*/

import Foundation

func randArray(n:Int ) -> [Int] {
    var result:[Int] = []
    for _ in 0..<n {
        result.append(20 + Int.random(in: 1..<10))
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
	bucketSort(&testArray, 20, 30)
    let endTime = Date()
    let timeInterval: Double = endTime.timeIntervalSince(startTime)
    print("Array size = \(i*100), Time interval = \(timeInterval) sec")
	validator(&testArray)
}