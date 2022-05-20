import Foundation;

class Heap {
    private var size : Int; // Number of elements in Heap
    private var arr : [Int]; // The Heap array
    private var isMinHeap : Bool;

    init(_ isMin : Bool) {
        self.arr = [];
        self.size = 0;
        self.isMinHeap = isMin;
    }

    init(_ array : inout [Int], _ isMin : Bool) {
        self.size = array.count;
        self.arr = array;
        self.isMinHeap = isMin;

		// Build Heap operation over array
		var i : Int = (self.size / 2);
		while (i >= 0) {
			self.percolateDown(i);
			i -= 1;
		}
    }

    func compare(_ first : Int, _ second : Int) -> Bool {
        if (self.isMinHeap) {
            return (self.arr[first] > self.arr[second]);
        } else {
            return (self.arr[first] < self.arr[second]);
        }
    }

    // Other Methods.
    func percolateDown(_ parent : Int) {
        let lChild : Int = 2 * parent + 1;
        let rChild : Int = lChild + 1;
        var child : Int = -1;
        if (lChild < self.size) {
            child = lChild;
        }
        if (rChild < self.size && self.compare(lChild,rChild)) {
            child = rChild;
        }
        if (child != -1 && self.compare(parent,child)) {
            let temp : Int = self.arr[parent];
            self.arr[parent] = self.arr[child];
            self.arr[child] = temp;
            self.percolateDown(child);
        }
    }

    func percolateUp(_ child : Int) {
        let parent : Int = (child - 1) / 2;
        if (parent >= 0 && self.compare(parent,child)) {
            let temp : Int = self.arr[child];
            self.arr[child] = self.arr[parent];
            self.arr[parent] = temp;
            self.percolateUp(parent);
        }
    }

    func isEmpty() -> Bool
    {
        return (self.size == 0);
    }

    func length() -> Int
    {
        return self.size;
    }

    func peek() -> Int
    {
        if (self.isEmpty())
        {
            print("Heap empty exception.")
			return 0
        }
        return self.arr[0];
    }

    func add(_ value : Int) {
		self.size += 1
		self.arr.append(value)
        self.percolateUp(self.size - 1);
    }

    func remove() -> Int {
        if (self.isEmpty()) {
            print("Heap empty exception.")
			return 0
        }
        let value : Int = self.arr[0];
        self.arr[0] = self.arr[self.size - 1];
        self.size -= 1;
		self.arr.removeLast();
        self.percolateDown(0);
        return value;
    }

    func printHeap() {
        print("Heap : ",terminator: "");
		var i : Int = 0;
		while (i < self.size) {
			print(String(self.arr[i]), terminator: " ");
			i += 1;
		}
        print();
    }

    func delete(_ value : Int) -> Bool
    {
		var i : Int = 0;
		while (i < self.size) {
			if (self.arr[i] == value) {
				self.arr[i] = self.arr[self.size - 1];
				self.size -= 1;
				self.arr.removeLast();
				self.percolateUp(i);
				self.percolateDown(i);
				return true;
			}
			i += 1;
		}
        return false;
    }
}

func HeapSort(_ array : inout [Int], _ inc : Bool) {
    // Create max heap for increasing order sorting.
    let hp : Heap = Heap(&array, !inc);
    var i : Int = 0;
	while (i < array.count) {
		array[array.count - i - 1] = hp.remove();
		i += 1;
	}
}

let hp : Heap = Heap(true);
hp.add(1);
hp.add(6);
hp.add(5);
hp.add(7);
hp.add(3);
hp.add(4);
hp.add(2);
hp.printHeap();
while (!hp.isEmpty()) {    
	print(String(hp.remove()), terminator: " ");
}

var arr : [Int] = [1, 9, 6, 7, 8, -1, 2, 4, 5, 3];
HeapSort(&arr, true);
print(arr)
    
func IsMinHeap(_ arr : [Int]) -> Bool {
	let size = arr.count
	var i = 0
	while i <= (size-2)/2 {
		if 2*i+1 < size {
			if arr[i] > arr[2*i+1] {
				return false
			}
		}
		if 2*i+2 < size {
			if arr[i] > arr[2*i+2] {
				return false
			}
		}
		i+=1
	}
	return true
}

func IsMaxHeap(_ arr : [Int]) -> Bool {
	let size = arr.count
	var i = 0
	while i <= (size-2)/2 {
		if 2*i+1 < size {
			if arr[i] < arr[2*i+1] {
				return false
			}
		}
		if 2*i+2 < size {
			if arr[i] < arr[2*i+2] {
				return false
			}
		}
		i+=1
	}
	return true
}
let bb = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(IsMinHeap(bb))
let cc = [9, 8, 7, 6, 5, 4, 3, 2, 1]
print(IsMaxHeap(cc))
print(IsMaxHeap(bb))
