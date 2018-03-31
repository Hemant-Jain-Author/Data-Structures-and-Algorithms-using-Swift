class Heap {
	var size : Int
	var arr : [Int]
	var isMin : Bool

	public init(arrInput : [Int], isMin : Bool) {
		self.size = arrInput.count
		self.arr = [1]
		self.arr.append(contentsOf : arrInput)
		self.isMin = isMin
		var i = (self.size / 2)
		while i > 0 {
			self.proclateDown(parent : i)
			i-=1
		}
	}
	
	public init(isMin : Bool) {
		self.arr = [1]
		self.size = 0
		self.isMin = isMin
	}
	
	private func proclateDown(parent : Int) {
		let lChild = 2 * parent
		let rChild = lChild + 1
		var small = -1
		if lChild <= self.size {
			small = lChild
		}
		if rChild <= self.size && self.comp(lChild, rChild) {
			small = rChild
		}
		if small != -1 && self.comp(parent, small) {
			self.arr.swapAt(parent, small)
			self.proclateDown(parent : small)
		}
	}
	

	private func comp(_ i : Int, _ j : Int) -> Bool { // always i < j in use
		if self.isMin == true {
			return self.arr[i] > self.arr[j] // swaps while min heap
		}
		return self.arr[i] < self.arr[j] // swap while max heap.
	}
	
	private func proclateUp(child : Int) {
		let parent = child / 2
		if parent == 0 {
			return
		}
		if self.comp(parent, child) {
			self.arr.swapAt(child, parent)
			self.proclateUp(child : parent)
		}
	}
	
	public func add(value : Int) {
		self.size+=1
		self.arr.append(value)
		self.proclateUp(child : self.size)
	}
	
	public func remove() -> Int {
		if self.isEmpty {
			print("HeapEmptyException.")
			return 0
		}
		let value = self.arr[1]
		self.arr[1] = self.arr[self.size]
		self.size-=1
		self.proclateDown(parent : 1)
		//self.arr = self.arr[0 : self.size+1]
		return value
	}
	
	public func Print() {
		print("Printing Heap size :\(self.size) :: ")
		var i = 1
		while i <= self.size {
			print(self.arr[i],terminator:"")
			i+=1
		}
		print()
	}

	public var isEmpty : Bool {
		return self.size == 0
	}

	public func count() -> Int {
		return self.size
	}	
	public func peek() -> Int {
		if self.isEmpty {
			print("Heap empty exception.")
			return 0
		}
		return self.arr[1]
	}
}

class MedianHeap{
	var minHeap : Heap
	var maxHeap : Heap

	public init() {
		minHeap = Heap(isMin:true)
		maxHeap = Heap(isMin:false)
	}
	
	public func insert(value : Int) {
		if maxHeap.isEmpty {
			self.maxHeap.add(value:value)
		} else {
			let top = self.maxHeap.peek()
			if top >= value {
				self.maxHeap.add(value:value)
			} else {
				self.minHeap.add(value:value)
			}
		}
		// size balancing
		if self.maxHeap.count() > self.minHeap.count()+1 {
			let value = self.maxHeap.remove()
			self.minHeap.add(value:value)
		}
	
		if self.minHeap.count() > self.maxHeap.count()+1 {
			let value = self.minHeap.remove()
			self.maxHeap.add(value:value)
		}
	}
	
	public func getMedian() -> Int {
		if self.maxHeap.count() == 0 && self.minHeap.count() == 0 {
			print("HeapEmptyException")
			return 0
		}
	
		if self.maxHeap.count() == self.minHeap.count() {
			let val1 = self.maxHeap.peek()
			let val2 = self.minHeap.peek()
			return (val1 + val2) / 2
		} else if self.maxHeap.count() > self.minHeap.count() {
			let val1 = self.maxHeap.peek()
			return val1
		} else {
			let val2 = self.minHeap.peek()
			return val2
		}
	}	
}

// Testing code
var arr = [1, 9, 2, 8, 3, 7, 4, 6, 5, 1, 9, 2, 8, 3, 7, 4, 6, 5, 10, 10]
var hp = MedianHeap()

for value in arr {
	hp.insert(value:value)
	print("Median after insertion of \(value) is  \(hp.getMedian())")
}