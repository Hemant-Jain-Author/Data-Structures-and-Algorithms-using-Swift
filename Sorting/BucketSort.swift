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

var data = [23, 24, 22, 21, 26, 25, 27, 28, 21, 21]
bucketSort(&data, 20, 30)
print(data)
