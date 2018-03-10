class Counter<T: Hashable > {
	var dict: [T:Int] = [:]

	public var isEmpty : Bool {
		return dict.count == 0
	}

	public func add(_ key : T) {
		guard let val = dict[key] else {
			dict[key] = 1
			return
		}
		dict[key] = val + 1
	}
	
	public func find(_ key : T) -> Bool {
		let keyExists = dict[key] != nil
		return keyExists
	}
	
	public func get(_ key : T) -> (value:Int, flag:Bool) {
		guard let val = dict[key] else {
			return (0, false)
		}
		return (val, true)
	}
	
	public func remove(_ key : T) {
		guard let val = dict[key] else {
			return
		}
		if(val == 1) {
			dict[key] = nil
		} else {
			dict[key] = val - 1
		}
	}
}


func isAnagram(_ str1 : String, _ str2 : String) -> Bool {
	let size1 = str1.count
	let size2 = str2.count
	if size1 != size2 {
		return false
	}
	let cm = Counter<Character>()
	for ch in str1 {
		cm.add(ch)
	}
	for ch in str2 {
		cm.remove(ch)
	}
	return cm.isEmpty
}

func removeDuplicate(_ str : String) -> String {
	let input = str
	var hs = Set<Character>()

	var output = ""
	for ch in input {
		if hs.contains(ch) == false {
			output.append(ch)
			hs.insert(ch)
		}
	}
	return output
}


func findMissing(arr : [Int], start : Int, end : Int) -> (value:Int, flag:Bool) {
	var hs = Set<Int>()
	for i in arr {
		hs.insert(i)
	}
	var curr = start
	while curr <= end  {
		if hs.contains(curr) == false {
			return (curr, true)
		}
		curr += 1
	}
	return (0, false)
}

func printRepeating(_ arr : [Int]) {
	var hs = Set<Int>()
	print("Repeating elements are :: ")
	for val in arr {
		if hs.contains(val) {
			print(val, terminator:" ")
		} else {
			hs.insert(val)
		}
	}
}

func printFirstRepeating(_ arr : [Int]) {
	let size = arr.count
	let hs = Counter<Int>()
	var i = 0
	while i < size {
		hs.add(arr[i])
		i += 1
	}
	i = 0
	while i < size {
		hs.remove(arr[i])
		if hs.find(arr[i]) {
			print("First Repeating number is : ") 
			print(arr[i])
			return
		}
		i += 1
	}
}

func hornerHash(key  : [Int], tableSize : Int) -> Int {
	let size = key.count
	var h = 0
	var i = 0
	while i < size {
		h = (32*h + key[i]) % tableSize
		i += 1
	}
	return h
}

let var1 = "hello"
let var2 = "elloh"
let var3 = "world"

print("isAnagram : \(isAnagram(var1, var2))")
print("isAnagram : \(isAnagram(var1, var3))")

print(removeDuplicate(var1))

let arr = [1, 2, 3, 5, 6, 7, 9, 8, 10]
print("Missing number is :: ")
print(findMissing(arr:arr, start:1, end:10))

let arr1 = [1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 1]
printRepeating(arr1)

printFirstRepeating(arr1)