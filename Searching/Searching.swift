func linearsearchUnsorted(_ data : [Int], _ value : Int) -> Bool {
	let size = data.count
	var i = 0 
	while i < size {
		if value == data[i] {
			return true
		}
		i += 1
	}
	return false
}

func linearsearchSorted( _ data : [Int], _ value : Int) -> Bool {
	let size = data.count
	var i = 0 
	while i < size {
		if value == data[i] {
			return true
		} else if value < data[i] {
			return false
		}
		i += 1 
	}
	return false
}

func binarysearch(_ data : [Int], _ value : Int) -> Bool {
	let size = data.count
	var low = 0
	var high = size - 1
	var mid = 0

	while low <= high {
		mid = (low + high)/2
		if data[mid] == value {
			return true
		} else if data[mid] < value {
			low = mid + 1
		} else {
			high = mid - 1
		}
	}
	return false
}

func binarySearchRecursive(_ data : inout [Int], _ value : Int) -> Bool {
	return binarySearchRecursive(&data, 0, data.count, value)
}

func binarySearchRecursive(_ data : inout [Int], _ low : Int, _ high : Int, _ value : Int) -> Bool {
	if(low > high) {
		return false
	}

	let mid = (low + high) / 2
	if data[mid] == value {
		return true
	} else if data[mid] < value {
		return binarySearchRecursive(&data, mid+1, high, value)
	} else {
		return binarySearchRecursive(&data, low, mid-1, value)
	}
}

var arr2 = [1,3,5,6,8,9,11,14,17,18]
print(binarySearchRecursive(&arr2, 9))
print(binarySearchRecursive(&arr2, 7))

func printRepeating(_ data : [Int]) {
	let size = data.count
	print("\nRepeating elements are :", terminator:" ")
	var i = 0 
	while i < size {
		var j = i + 1 
		while j < size {
			if data[i] == data[j] {
				print(data[i], terminator:" ")
			}
			j += 1
		}
		i += 1 
	}
}

func printRepeating2(_ dataIn : [Int]) {
	let size = dataIn.count
	var data = dataIn.sorted(by : <) // Sort(data)
	print("\nRepeating elements are : ", terminator:" ")
	var i = 1
	while i < size {
		if data[i] == data[i-1] {
			print(data[i], terminator:" ")
		}
		i += 1
	}
}

func printRepeating3(_ data : [Int]) {
	var s = Set<Int>()
	let size = data.count
	print("\nRepeating elements are : ", terminator:" ")
	var i = 0 
	while i < size {
		if s.contains(data[i]) {
			print(data[i], terminator:" ")
		} else {
			s.insert(data[i])
		}
		i += 1
	}
	
}

func printRepeating4(_ data : [Int], _ intrange : Int) {
	let size = data.count
	var count = [Int](repeating:0,count: intrange)
	var i = 0 
	while i < size {
		count[i] = 0
		i += 1
	}
	print("\nRepeating elements are : ", terminator:" ")
	i = 0 
	while i < size {
		if count[data[i]] == 1 {
			print(data[i], terminator:" ")
		} else {
			count[data[i]] += 1
		}
		i += 1
	}
}

func getMaxCount(_ data : [Int]) -> Int {
	let size = data.count
	var max = data[0]
	var count = 1
	var maxCount = 1
	var i = 0 
	while i < size {
		count = 1
		var j = i + 1
		while j < size {
			if data[i] == data[j] {
				count += 1
			}
			j += 1 
		}
		if count > maxCount {
			max = data[i]
			maxCount = count
		}
		i += 1 
	}
	return max
}

func getMaxCount2(_ dataIn : [Int]) -> Int {
	let size = dataIn.count
	var data = dataIn.sorted(by : <) // Sort(data,size)
	var max = data[0]
	var maxCount = 1
	var curr = data[0]
	var currCount = 1
	var i = 1 
	while  i < size {
		if data[i] == data[i-1] {
			currCount += 1
		} else {
			currCount = 1
			curr = data[i]
		}
		if currCount > maxCount {
			maxCount = currCount
			max = curr
		}
		i += 1
	}
	return max
}

func getMaxCount3(_ data : [Int], _ dataRange : Int) -> Int {
	var max = data[0]
	var maxCount = 1
	let size = data.count
	var count = [Int](repeating:0, count:dataRange)
	var i = 0 
	while i < size {
		count[data[i]] += 1
		if count[data[i]] > maxCount {
			maxCount = count[data[i]]
			max = data[i]
		}
		i += 1
	}
	return max
}

func getMajority(_ data : [Int]) -> (index : Int, flag : Bool) {
	let size = data.count
	var max = 0
	var count = 0
	var maxCount = 0
	var i = 0 
	while i < size {
		var j = i + 1
		while j < size {
			if data[i] == data[j] {
				count += 1
			}
			j += 1
		}
		if count > maxCount {
			max = data[i]
			maxCount = count
		}
		i += 1 
	}
	if maxCount > size/2 {
		return (max, true)
	}
	print("MajorityDoesNotExist")
	return (0, false)
}

func getMajority2(_ dataIn : [Int]) -> (index : Int, flag : Bool) {
	let size = dataIn.count
	var data = dataIn.sorted(by : <) // Sort(data,size)
	let majIndex = size / 2
	let candidate = data[majIndex]
	var count = 0
	var i = 0 
	while i < size  {
		if data[i] == candidate {
			count += 1
		}
		i += 1
	}
	if count > size/2 {
		return (data[majIndex], true)
	}
	print("MajorityDoesNotExist")
	return (0, false)
}

func getMajority3(_ data : [Int]) -> (index : Int, flag : Bool) {
	var majIndex = 0
	var count = 1
	let size = data.count
	var i = 1 
	while i < size {
		if data[majIndex] == data[i] {
			count += 1
		} else {
			count -= 1
		}

		if count == 0 {
			majIndex = i
			count = 1
		}
		i += 1
	}
	let candidate = data[majIndex]
	count = 0
	i = 0 
	while i < size {
		if data[i] == candidate {
			count += 1
		}
		i += 1
	}
	if count > size/2 {
		return (data[majIndex], true)
	}
	print("MajorityDoesNotExist")
	return (0, false)
}

func findMissingNumber(_ data : [Int]) -> (index : Int, flag : Bool) {
	var found : Int
	let size = data.count
	var i = 1 
	while  i <= size {
		found = 0
		var j = 0 
		while j < size {
			if data[j] == i {
				found = 1
				break
			}
			j += 1
		}
		if found == 0 {
			return (i, true)
		}
		i += 1
	}
	print("NoNumberMissing")
	return (0, false)
}

func abs(v : Int) -> Int {
	if v < 0 {
		return -1 * v
	}
	return v
}

func findMissingNumber2(_ data : [Int], _ dataRange : Int) -> Int {
	let size = data.count
	var xorSum = 0
	// get the XOR of all the numbers from 1 to dataRange
	var i = 1 
	while  i <= dataRange {
		xorSum ^= i
		i += 1 
	}
	// loop through the array and get the XOR of elements
	i = 0 
	while i < size {
		xorSum ^= data[i]
		i += 1
	}
	return xorSum
}

func findPair(_ data : [Int], _ value : Int) -> Bool {
	let size = data.count
	var ret = false
	var i = 0 
	while i < size {
		var j = i + 1
		while j < size {
			if (data[i] + data[j]) == value {
				print("The pair is : \(data[i]) & \(data[j])")
				ret = true
			}
			j += 1
		}
		i += 1 
	}
	return ret
}

func findPair2(_ dataIn : [Int], _ value : Int) -> Bool {
	var data = dataIn.sorted(by : <) // Sort(data, size)
	let size = data.count
	var first = 0
	var second = size - 1
	var ret = false
	while first < second {
		let curr = data[first] + data[second]
		if curr == value {
			print("The pair is \(data[first]), \(data[second])")
			ret = true
		}
		if curr < value {
			first += 1
		} else {
			second -= 1
		}
	}
	return ret
}

func findPair3(_ data : [Int], _ value : Int) -> Bool {
	var s = Set<Int>()
	let size = data.count
	var ret = false
	var i = 0 
	while i < size {
		if s.contains(value - data[i]) {
			print("The pair is : \(data[i]) & \(value - data[i])")
			ret = true
		} else {
			s.insert(data[i])
		}
		i += 1
	}
	return ret
}

func minAbsSumPair(_ data : [Int]) {
	var sum : Int
	let size = data.count
	// Array should have at least two elements
	if size < 2 {
		print("InvalidInput")
	}
	// Initialization of values
	var minFirst = 0
	var minSecond = 1
	var minSum = abs(data[0] + data[1])
	var l = 0
	while l < size-1 {
		var r = l + 1
		while r < size {
			sum = abs(data[l] + data[r])
			if sum < minSum {
				minSum = sum
				minFirst = l
				minSecond = r
			}
			r += 1 
		}
		l += 1 
	}
	print(" The two elements with minimum sum are : \(data[minFirst]), \(data[minSecond])")
}

func minAbsSumPair2(_ dataIn : [Int]) {
	var sum : Int
	let size = dataIn.count
	// Array should have at least two elements
	if size < 2 {
		print("InvalidInput")
	}
	var data = dataIn.sorted(by : <) // Sort(data, size)
	print(data)
	// Initialization of values
	var minFirst = 0
	var minSecond = size - 1
	var minSum = abs(data[minFirst] + data[minSecond])
	var l = 0
	var r = (size - 1)
	while l < r {
		sum = (data[l] + data[r])
		if abs(sum) < minSum {
			minSum = abs(sum) /// just corrected......hemant
			minFirst = l
			minSecond = r
		}

		if sum < 0 {
			l += 1
		} else if sum > 0 {
			r -= 1
		} else {
			break
		}
	}
	print(" The two elements with minimum sum are : \(data[minFirst]), \(data[minSecond])")
}

func searchBitonicArrayMax(_ data : [Int]) -> (index : Int, flag : Bool) {
	let size = data.count
	var start = 0
	var end = size - 1
	var mid = (start + end) / 2
	var maximaFound = 0
	if size < 3 {
		print("InvalidInput")
		return (0, false)
	}
	while start <= end {
		mid = (start + end) / 2

		if data[mid-1] < data[mid] && data[mid+1] < data[mid] { //maxima
			maximaFound = 1
			break
		} else if data[mid-1] < data[mid] && data[mid] < data[mid+1] { // increasing
			start = mid + 1
		} else if data[mid-1] > data[mid] && data[mid] > data[mid+1] { // decreasing
			end = mid - 1
		} else {
			break
		}
	}
	if maximaFound == 0 {
		print("NoMaximaFound")
		return (0, false)
	}
	return (mid, true)
}

func searchBitonicArray(_ data : [Int], _ key : Int) -> Int {
	let size = data.count
	let ret = findMaxBitonicArray(data)
	let maxIndex = ret.index
	let k = binarysearch(data, 0, maxIndex, key, true)
	if k != -1 {
		return k
	} else {
		return binarysearch(data, maxIndex+1, size-1, key, false)
	}
}

func findMaxBitonicArray(_ data : [Int]) -> (index : Int, flag : Bool) {
	let size = data.count
	var start = 0
	var end = size - 1
	var mid = 0
	if size < 3 {
		print("InvalidInput")
		return (-1, false)
	}
	while start <= end {
		mid = (start + end) / 2
		if data[mid-1] < data[mid] && data[mid+1] < data[mid] /* maxima */ {
			return (mid, true)
		} else if data[mid-1] < data[mid] && data[mid] < data[mid+1] /* increasing */ {
			start = mid + 1
		} else if data[mid-1] > data[mid] && data[mid] > data[mid+1] /* decreasing */ {
			end = mid - 1
		} else {
			break
		}
	}
	print("error")
	return (-1, false)
}

func binarysearch(_ data : [Int], _ start : Int, _ end : Int,_  key : Int, _ isInc : Bool) -> Int {
	if end < start {
		return -1
	}
	let mid = (start + end) / 2
	if key == data[mid] {
		return mid
	}
	if isInc != false && key < data[mid] || isInc == false && key > data[mid] {
		return binarysearch(data, start, mid-1, key, isInc)
	}
	return binarysearch(data, mid+1, end, key, isInc)
}

func findKeyCount(_ data : [Int], _ key : Int) -> Int {
	var count = 0
	let size = data.count
	var i = 0 
	while i < size {
		if data[i] == key {
			count += 1
		}
		i += 1 
	}
	return count
}

func findKeyCount2(_ data : [Int], _ key : Int) -> Int {
	let size = data.count
	let firstIndex = findFirstIndex(data, 0, size-1, key)
	let lastIndex = findLastIndex(data, 0, size-1, key)
	return (lastIndex - firstIndex + 1)
}

func findFirstIndex(_ data : [Int], _ start : Int, _ end : Int, _ key : Int) -> Int {
	if end < start {
		return -1
	}

	let mid = (start + end) / 2
	if key == data[mid] && (mid == start || data[mid-1] != key) {
		return mid
	}

	if key <= data[mid] {
		return findFirstIndex(data, start, mid-1, key)
	}
	return findFirstIndex(data, mid+1, end, key)
}

func findLastIndex(_ data : [Int], _ start : Int, _ end : Int, _ key : Int) -> Int {
	if end < start {
		return -1
	}

	let mid = (start + end) / 2
	if key == data[mid] && (mid == end || data[mid+1] != key) {
		return mid
	}

	if key < data[mid] {
		return findLastIndex(data, start, mid-1, key)
	}
	return findLastIndex(data, mid+1, end, key)
}

func seperateEvenAndOdd(_ data : inout [Int]) {
	let size = data.count
	var left = 0
	var right = size - 1
	while left < right {
		if data[left]%2 == 0 {
			left += 1
		} else if data[right]%2 == 1 {
			right -= 1
		} else {
			data.swapAt(left, right) // swap
			left += 1
			right -= 1
		}
	}
}

func maxProfit(_ stocks : [Int]) {
	let size = stocks.count
	var buy = 0
	var sell = 0
	var curMin = 0
	var currProfit = 0
	var maxProfit = 0

	var i = 0 
	while i < size {
		if stocks[i] < stocks[curMin] {
			curMin = i
		}
		currProfit = stocks[i] - stocks[curMin]
		if currProfit > maxProfit {
			buy = curMin
			sell = i
			maxProfit = currProfit
		}
		i += 1
	}
	print("Purchase day is- \(buy) at price \(stocks[buy])")
	print("Sell day is- \(sell) at price \(stocks[sell])")
	print("Max Profit :: \(maxProfit)")
}

func getMedian(_ dataIn : [Int]) -> Int {
	let size = dataIn.count
	let data = dataIn.sorted(by : <)
	return data[size/2]
}

func findMedian(_ dataFirst : [Int], _ dataSecond : [Int]) -> Int {
	let sizeFirst = dataFirst.count
	let sizeSecond = dataSecond.count
	let medianIndex = ((sizeFirst + sizeSecond) + (sizeFirst+sizeSecond)%2) / 2 // cealing function.
	var i = 0
	var j = 0
	var count = 0
	while count < medianIndex-1 {
		if i < sizeFirst-1 && dataFirst[i] < dataSecond[j] {
			i += 1
		} else {
			j += 1
		}
		count += 1
	}
	if dataFirst[i] < dataSecond[j] {
		return dataFirst[i]
	}
	return dataSecond[j]
}

func binarysearch01(_ data : [Int]) -> Int {
	let size = data.count
	if size == 1 && data[0] == 1 {
		return -1
	}
	return binarysearch01Util(data, 0, size-1)
}

func binarysearch01Util(_ data : [Int], _ start : Int, _ end : Int) -> Int {
	if end < start {
		return -1
	}
	let mid = (start + end) / 2
	if 1 == data[mid] && 0 == data[mid-1] {
		return mid
	}
	if 0 == data[mid] {
		return binarysearch01Util(data, mid+1, end)
	}
	return binarysearch01Util(data, start, mid-1)
}

func binarysearchRotateArrayUtil(_ data : [Int], _ start : Int, _ end : Int, _ key : Int) -> Int {
	if end < start {
		return -1
	}
	let mid = (start + end) / 2
	if key == data[mid] {
		return mid
	}
	if data[mid] > data[start] {
		if data[start] <= key && key < data[mid] {
			return binarysearchRotateArrayUtil(data, start, mid-1, key)
		}
		return binarysearchRotateArrayUtil(data, mid+1, end, key)
	} else {
		if data[mid] < key && key <= data[end] {
			return binarysearchRotateArrayUtil(data, mid+1, end, key)
		}
		return binarysearchRotateArrayUtil(data, start, mid-1, key)
	}
}

func binarysearchRotateArray(_ data : [Int], _ key : Int) -> Int {
	let size = data.count
	return binarysearchRotateArrayUtil(data, 0, size-1, key)
}

func firstRepeated(_ data : [Int]) -> Int {
	let size = data.count
	var i = 0 
	while i < size {
		var j = i + 1
		while  j < size {
			if data[i] == data[j] {
				return data[i]
			}
			j += 1
		}
		i += 1
	}
	return 0
}

func checkPermutation(_ dataIn1 : [Int], _ dataIn2 : [Int]) -> Bool {
	let size1 = dataIn1.count
	let size2 = dataIn2.count
	if size1 != size2 {
		return false
	}

	let data1 = dataIn1.sorted(by : >)
	let data2 = dataIn2.sorted(by : >)
	var i = 0 
	while i < size1 {
		if data1[i] != data2[i] {
			return false
		}
		i += 1
	}
	return true
}

func search(_ data : [Int], _ key : Int) -> Bool {
	for value in data {
		if key == value {
			return true
		}
	}
	return false
}

func checkPermutation2(_ data1 : [Int], _ data2 : [Int]) -> Bool {
	let size1 = data1.count
	let size2 = data2.count
	if size1 != size2 {
		return false
	}

	var h = [Int:Int]()
	var i = 0 
	while i < size1 {
		h[data1[i],default:0] += 1
		h[data2[i],default:0] -= 1
		i += 1 
	}

	i = 0 
	while i < size1 {
		if h[data1[i]] != 0 {
			return false
		}
		i += 1
	}
	return true
}

func removeDuplicates(_ dataIn : [Int]) -> Int {
	let size = dataIn.count
	if size == 0 {
		return 0
	}

	var data = dataIn.sorted(by : <)
	var i = 1
	var j = 0
	while  i < size {
		if data[i] != data[j] {
			j += 1
			data[j] = data[i]
		}
		i += 1
	}
	return j + 1
}

		var first = [1, 3, 5, 7, 9, 7, 25, 21, 30]
		var second = [2, 4, 6, 8, 10, 12, 14, 8, 21, 23, 24]
		print(linearsearchUnsorted(first, 8))
		print(linearsearchUnsorted(second, 8))
		print(binarysearch(second, 18))
		print(binarysearch(second, 16))

		printRepeating(second)
		printRepeating(first)
		printRepeating2(second)
		printRepeating2(first)
		printRepeating3(second)
		printRepeating3(first)
		printRepeating4(second, 100)
		printRepeating4(first, 100)

		print(getMaxCount(first))
		print(getMaxCount(second))
		print(getMaxCount2(first))
		print(getMaxCount2(second))
		print(getMaxCount3(first,100))
		print(getMaxCount3(second,100))
	
		let third = [1, 3, 5, 7, 9, 7, 25, 21, 30]
		let forth = [1, 3, 3, 7, 3, 7, 2, 3, 3]
		print(getMajority(third))
		print(getMajority(forth))
		print()
		print(getMajority2(third))
		print(getMajority2(forth))
		print()
		print(getMajority3(third))
		print(getMajority3(forth))
	

		let fifth = [1, 3, 5, 7, 2, 4, 6, 10, 9]
		let sixth = [1, 3, 2, 5, 4, 7, 6, 8, 9]
		print(findMissingNumber(fifth))
		print(findMissingNumber(sixth))
		print()
		print(findMissingNumber2(fifth,10))
		print(findMissingNumber2(sixth,9))
		print()
		print(findPair(fifth, 7))
		print(findPair(sixth, 7))
		print()
		print(findPair2(fifth, 7))
		print(findPair2(sixth, 7))
		print()
		print(findPair3(fifth, 7))
		print(findPair3(sixth, 7))
		print()
		
		let seventh = [1, 3, 5, -7, 2, -4, 6, -10, -9]
		minAbsSumPair(seventh)
		minAbsSumPair2(seventh)
		print()

		let eigth = [1, 3, 5, 7, 4, 1, -1, -9]
		print(searchBitonicArrayMax(first))
		print(findMaxBitonicArray(first))
		print(searchBitonicArray(first, 6))
	
		let ninth = [1, 3, 5, 7, 2, 4, 6, 8, 9]
		let tenth = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		print(checkPermutation(ninth, tenth))
		print(checkPermutation2(ninth, tenth))
	
	
		let eleventh = [1, 3, 5, 7, 3, 4, 3, 8, 9]
		let twelth = [1, 2, 3, 3, 5, 5, 5, 6, 6]

		print(findKeyCount(eleventh, 3))
		print(findKeyCount(twelth, 3))
		print(findKeyCount(twelth, 5))
		print(findKeyCount(twelth, 6))
	
		var thirteen = [1, 3, 5, 7, 3, 4, 3, 8, 9]
		maxProfit(thirteen)
		seperateEvenAndOdd(&thirteen)
		print(thirteen)
		print(getMedian(thirteen))
		print(thirteen)
		let fourteen = [1, 2, 3, 3, 5, 5, 5, 6, 6]
		//sort(fourteen)
		print(findMedian(thirteen, fourteen))
	
		let fifteen = [0, 0, 1, 1, 1, 1, 1, 1, 1]
		print(binarysearch01(fifteen))

		let sixteen = [5, 5, 6, 6, 1, 2, 3, 3, 4]
		print(binarysearchRotateArray(sixteen, 4))
		print(binarysearchRotateArray(sixteen, 2))
		print(binarysearchRotateArray(sixteen, 5))
		print(binarysearchRotateArray(sixteen, 7))

		let seventeen = [1, 3, 5, 7,6,6, 3, 4, 3, 8, 9]
		print(firstRepeated(seventeen))