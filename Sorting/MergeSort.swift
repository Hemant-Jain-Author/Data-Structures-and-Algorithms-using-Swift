func merge(arr : inout [Int], tempArray : inout [Int], lowerIndex : Int, middleIndex : Int, upperIndex : Int) {
	var lowerStart = lowerIndex
	let lowerStop = middleIndex
	var upperStart = middleIndex + 1
	let upperStop = upperIndex

	var index = lowerIndex
	while index <= upperIndex {
		if (lowerStart <= lowerStop ) && (upperStart > upperStop || arr[lowerStart] < arr[upperStart]){
			tempArray[index] = arr[lowerStart]
			lowerStart+=1
		} else {
			tempArray[index] = arr[upperStart]
			upperStart+=1
		}
		index+=1
	}
	var i = lowerIndex
	while i <= upperIndex {
		arr[i] = tempArray[i]
		i+=1
	}
}

func mergeSrt(arr : inout [Int], tempArray : inout [Int], lowerIndex : Int, upperIndex : Int) {
	if lowerIndex >= upperIndex {
		return
	}
	let middleIndex = (lowerIndex + upperIndex) / 2
	mergeSrt(arr:&arr, tempArray:&tempArray, lowerIndex:lowerIndex, upperIndex :middleIndex)
	mergeSrt(arr:&arr, tempArray:&tempArray, lowerIndex:middleIndex+1, upperIndex :upperIndex)
	merge(arr:&arr, tempArray:&tempArray, lowerIndex:lowerIndex, middleIndex:middleIndex, upperIndex :upperIndex)
}

func mergeSort(_ arr : inout [Int]) {
	let size = arr.count
	var tempArray = [Int](repeating: 0, count : size )
	mergeSrt(arr : &arr, tempArray : &tempArray, lowerIndex : 0, upperIndex : size-1)
}

// Testing code
/*
var data = [9, 1, 8, 2, 7, 3, 6, 4, 5]
mergeSort(&data)
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
    mergeSort(&testArray)
    let endTime = Date()
    let timeInterval: Double = endTime.timeIntervalSince(startTime)
    print("Array size = \(i*100), Time interval = \(timeInterval) sec")
	validator(&testArray)
}