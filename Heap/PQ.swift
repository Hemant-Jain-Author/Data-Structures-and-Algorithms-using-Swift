class PQueue<K : Comparable, V> {
	struct Element {
		var key : K
		var value : V
	}
	var elements : Array<Element?>
	var count : Int
	var isMinHeap : Bool

	public init(isMinHeap : Bool) {
		self.elements = Array()
		self.elements.append(nil) // dummmy first element
		self.count = 0
		self.isMinHeap = isMinHeap
	}
	
	private func comp(_ i : K, _ j : K) ->Bool { // always i < j in use
		if( self.isMinHeap ) {
			return i > j // min heap
		} else {
			return i < j // max heap
		}
			

	}

	private func proclateDown(position : Int) {
		let lChild = 2 * position
		let rChild = lChild + 1
		var small = -1
	
		if lChild <= self.count {
			small = lChild
		}
	
		if rChild <= self.count && self.comp(self.elements[lChild]!.key, self.elements[rChild]!.key) {
			small = rChild
		}
	
		if small != -1 && self.comp(self.elements[position]!.key, self.elements[small]!.key) {
			self.elements.swapAt(position, small)
			self.proclateDown(position : small)
		}
	}
	
	private func proclateUp(position : Int) {
		let parent = position / 2
		if parent == 0 {
			return
		}
	
		if self.comp(self.elements[parent]!.key, self.elements[position]!.key) {
			self.elements.swapAt(position, parent)
			self.proclateUp(position : parent)
		}
	}
	
	public func add(key : K, value : V) {
		let item = Element(key : key, value : value)
		self.elements.append(item)
		self.count+=1
		self.proclateUp(position : self.count)
	}
	
	public func remove() -> V? {
		if self.isEmpty {
			print("Heap Empty Error.")
			return nil
		}
		let value = self.elements[1]!.value
		self.elements[1] = self.elements[self.count]
		self.elements.removeLast()
		self.count-=1
		self.proclateDown(position:1)
		return value
	}
	
	public func display() {
		let n = self.count
		var i = 1
		while i <= n {
			print(self.elements[i]!.value, terminator:" ")
			i+=1
		}
		print()
	}
	
	public var isEmpty : Bool {
		return (self.count == 0)
	}
	
	public func peek() -> V? {
		if self.isEmpty {
			return nil
		}
		return self.elements[1]!.value
	}
}

var a = [1, 9, 6, 7, 8, -1, 2, 4, 5, 3]
var pq = PQueue<Int,Int>(isMinHeap: true)
for val in a {
	pq.add(key : val, value : val)
}

while let value = pq.remove() {
	print(value,terminator:" ")
}

var b = ["apple", "banana", "mango", "grapes", "pears", "lemmon"]
var pq2 = PQueue<String,String>(isMinHeap: false)
for val in b {
	pq2.add(key : val, value : val)
}

while let value = pq2.remove() {
	print(value,terminator:" ")
}

