import Foundation;

class Heap < T: Comparable > {
    private var size : Int; // Number of elements in Heap
    private var arr : [T?]; // The Heap array
    private var isMinHeap : Bool;

    init(_ isMin : Bool) {
        self.arr = [];
        self.size = 0;
        self.isMinHeap = isMin;
    }

    init(_ array : inout [T], _ isMin : Bool) {
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

    func comp(_ first : T, _ second : T) -> Bool {
        if (self.isMinHeap) {
            return first > second;
        } else {
            return first < second;
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

        if (rChild < self.size && self.comp(arr[lChild]!, arr[rChild]!)) {
            child = rChild;
        }

        if (child != -1 && self.comp(arr[parent]!, arr[child]!)) {
            self.arr.swapAt(parent, child)
			self.percolateDown(child);
        }
    }

    func percolateUp(_ child : Int) {
        let parent : Int = (child - 1) / 2;
        if (parent >= 0 && self.comp(arr[parent]!, arr[child]!)) {
			self.arr.swapAt(child, parent)
            self.percolateUp(parent);
        }
    }

    public var isEmpty : Bool {
        return (self.size == 0);
    }

    public var length : Int {
        return self.size;
    }

    func peek() -> T? {
        if (self.isEmpty) {
            print("Heap empty exception.");
			return nil
        }
        return self.arr[0];
    }

    func add(_ value : T) {
		self.size += 1
		self.arr.append(value)
        self.percolateUp(self.size - 1);
    }

    func remove() -> T? {
        if (self.isEmpty) {
            print("Heap empty exception.")
			return nil;
        }
        let value = self.arr[0];
        self.arr[0] = self.arr[self.size - 1];
        self.size -= 1;
		self.arr.removeLast();
        self.percolateDown(0);
        return value;
    }

    func display() {
        print("Heap : ",terminator: "");
		var i : Int = 0;
		while (i < self.size) {
			print(self.arr[i]!, terminator: " ");
			i += 1;
		}
        print();
    }

    func delete(_ value : T) -> Bool {
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

func main() {
    let pq = Heap<Int>(true);
    pq.add(1);
    pq.add(6);
    pq.add(5);
    pq.add(7);
    pq.add(3);
    pq.add(4);
    pq.add(2);
    pq.display();
    while (!pq.isEmpty) {    
        print(pq.remove()!, terminator: " ");
    }
    print()
}


main()


