class Heap < T: Comparable > {
	var size: Int
	var arr: [T?]
	var isMin: Bool
	
	public init(arrInput: [T], isMin: Bool) {
		self.size = arrInput.count
		self.arr = Array()
		self.arr.append(nil) // dummy value
		self.arr = self.arr + arrInput
		self.isMin = isMin
		var i = self.size / 2
		while i > 0 {
			self.proclateDown(parent: i)
			i -= 1
		}
	}

	public init(isMin: Bool) {
		self.arr = Array()
		self.arr.append(nil) // dummy value
		self.size = 0
		self.isMin = isMin
	}

	private func comp(_ i: T, _ j: T) ->	 Bool { // always i < j in use
		if (self.isMin) {
			return i > j // min heap
		} else {
			return i < j // max heap
		}
	}
	private func proclateDown(parent: Int) {
		let lChild = 2 * parent
		let rChild = lChild + 1
		var small = -1
		if lChild <= self.size {
			small = lChild
		}
		if rChild <= self.size && self.comp(arr[lChild]!, arr[rChild]!) {
			small = rChild
		}
		if small != -1 && self.comp(arr[parent]!, arr[small]!) {
			self.arr.swapAt(parent, small)
			self.proclateDown(parent: small)
		}
	}

	private func proclateUp(child: Int) {
		let parent = child / 2
		if parent == 0 {
			return
		}
		if self.comp(arr[parent]!, arr[child]!) {
			self.arr.swapAt(child, parent)
			self.proclateUp(child: parent)
		}
	}

	public func add(value: T) {
		self.size += 1
		self.arr.append(value)
		self.proclateUp(child: self.size)
	}

	public func remove() ->	 T? {
		if self.isEmpty() {
			print("HeapEmptyException.")
			return nil
		}
		let value = self.arr[1]
		self.arr[1] = self.arr[self.size]
		self.size -= 1
		self.proclateDown(parent: 1)
		//self.arr = self.arr[0 : self.size+1]
		return value
	}

	public func display() {
		print("Printing Heap size :\(self.size) :: ")
		var i = 1
		while i <= self.size {
			print(self.arr[i]!, terminator: "")
			i += 1
		}
		print()
	}

	public func isEmpty() ->	 Bool {
		return (self.size == 0)
	}

	public func peek() ->	 T? {
		if self.isEmpty() {
			print("Heap empty exception.")
			return nil
		}
		return self.arr[1]
	}
}

func isMinHeap(_ arr: [Int]) ->	 Bool {
	let size = arr.count
	var i = 0
	while i <= (size - 2) / 2 {
		if 2 * i + 1 < size {
			if arr[i] > arr[2 * i + 1] {
				return false
			}
		}
		if 2 * i + 2 < size {
			if arr[i] > arr[2 * i + 2] {
				return false
			}
		}
		i += 1
	}
	return true
}

func isMaxHeap(_ arr: [Int]) ->	 Bool {
	let size = arr.count
	var i = 0
	while i <= (size - 2) / 2 {
		if 2 * i + 1 < size {
			if arr[i] < arr[2 * i + 1] {
				return false
			}
		}
		if 2 * i + 2 < size {
			if arr[i] < arr[2 * i + 2] {
				return false
			}
		}
		i += 1
	}
	return true
}

func heapSort(arrInput: inout[Int]) {
	let hp = Heap(arrInput: arrInput, isMin: true)
	let n = arrInput.count
	var i = 0
	while i < n {
		arrInput[i] = hp.remove()!
		i += 1
	}
}

var arr = [1, 9, 6, 7, 8, -1, 2, 4, 5, 3]
print(arr)
var hp = Heap<Int>(isMin: true)
var n = arr.count
var i = 0
while i < n {
	hp.add(value: arr[i])
	i += 1
}
i = 0
while i < n {
	print("\(hp.remove()!)", terminator: " ")
	i += 1
}
print()

arr = [1, 9, 6, 7, 8, -1, 2, 4, 5, 3]
n = arr.count
hp = Heap(arrInput: arr, isMin: true)
i = 0
while i < n {
	print(hp.remove()!, terminator: " ")
	i += 1
}

print()
arr = [1, 9, 6, 7, 8, -1, 2, 4, 5, 3]
heapSort(arrInput: &arr)
print(arr)
let bb = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(isMinHeap(bb))
let cc = [9, 8, 7, 6, 5, 4, 3, 2, 1]
print(isMaxHeap(cc))
print(isMaxHeap(bb))