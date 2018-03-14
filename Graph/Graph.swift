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

class Stack<T> {
	var stk = [T]()
	
	public init() {}

	public func push(_ value : T) {
		stk.append(value)
	}
	
	public func pop() -> T? {
		return stk.popLast()
	}
	
	public func top() -> T? {
		return stk.last
	}
	
	public func display() {
		print(stk)	
	}

	public var isEmpty: Bool {
		return stk.isEmpty
	}
	
	public var count : Int {
		return stk.count
	}
}


class Queue<T> {
	private var que = [T]()
	private var head : Int = 0

	public init() {}

	public func add(_ value : T) {
		que.append(value)
	}
	
	public var isEmpty: Bool {
    	return count == 0
  	}

  	public var count: Int {
    	return que.count - head
  	}

	public func remove() -> T? {
		guard head < que.count else { 
			return nil 
		}
		let element = que[head]
		head += 1

		// Minimum 50 elements need to be freed.
		// One forth of the of total elements need to be freed.
		if(head > 50 && head * 4 > count) {
			que.removeFirst(head)
			head = 0
			print("array size modified.")
		}
		
		return element
	}

	public func front() -> T? {
		guard head < que.count else { 
			return nil 
		}
		return que[head]
	}
}

class Graph{
	class Edge{
		var source      : Int
		var destination : Int
		var cost        : Int
		var next        : Edge?

		init(source : Int, destination : Int, cost : Int, next : Edge?){
			self.source = source
			self.destination = destination
			self.cost = cost
			self.next = next
		}
	}

	var count : Int
	var VertexList : [Edge?]

	public init(_ count : Int) {
		self.count = count
		self.VertexList = Array(repeating:nil,count:count)
	}
	
	public func addEdge(source : Int, destination : Int, cost : Int) {
		let edge = Edge(source:source, destination:destination, cost:cost, next:self.VertexList[source])
		self.VertexList[source] = edge
	}
	
	public func addEdgeUnweighted(source : Int, destination : Int) {
		self.addEdge(source : source, destination : destination, cost : 1)
	}
	
	public func AddBiEdge(source : Int, destination : Int, cost : Int) {
		self.addEdge(source : source, destination : destination, cost : cost)
		self.addEdge(source : destination, destination : source, cost : cost)
	}
	
	public func AddBiEdgeUnweghted(source : Int, destination : Int) {
		self.AddBiEdge(source : source, destination : destination, cost : 1)
	}
	
	public func display() {
		var i = 0
		while i < self.count {
			var ad = self.VertexList[i]
			if ad != nil  {
				print("Vertex \(i) is connected to : ")
				while ad != nil {
					print("[ \(ad!.destination), \(ad!.cost)]")
					ad = ad!.next
				}
				print()
			}
			i+=1
		}
	}

	public func dijkstra(source : Int) {
		let count = self.count
		var previous = Array(repeating : -1, count : count)
		var dist = Array(repeating : Int.max, count : count)
		let que = PQueue<Int,Edge>(isMinHeap: true)
	
		dist[source] = 0
		var edge : Edge = Edge(source : source, destination : source, cost : 0, next : nil)
		que.add(key : edge.cost, value : edge)
	
		while que.isEmpty == false {
			edge = que.remove()!// Pop from PQ
			if dist[edge.destination] < edge.cost {
				continue
			}
			dist[edge.destination] = edge.cost
			previous[edge.destination] = edge.source
			var list = self.VertexList[edge.destination]
			while let curr = list {
				if previous[curr.destination] == -1 {
					edge = Edge(source : curr.source, 
					destination : curr.destination, 
					cost : curr.cost + dist[curr.source], next : nil)
					que.add(key : curr.cost, value : edge)
				}
				list = curr.next
			}
		}
		// Printing result.
		var i = 0
		while i < count {
			if dist[i] == Int.max {
				print(" edge id  \(i) prev \(previous[i]) distance : Unreachable")
			} else {
				print(" edge id \(i) prev \(previous[i]) distance : \(dist[i])")
			}
			i+=1
		}
	}
	
	public func Prims() {
		let count = self.count
		var previous = Array(repeating : 0, count : count)
		var dist = Array(repeating : 0, count : count)
		let que = PQueue<Int,Edge>(isMinHeap : true)
		let source = 1
		var i = 0
		while i < count {
			previous[i] = -1
			dist[i] = Int.max
			i+=1
		}
	
		dist[source] = 0
		var edge = Edge(source : source, destination : source,  cost : 0, next : nil)
		que.add(key : edge.cost, value : edge)
	
		while que.isEmpty == false {
			edge = que.remove()! // Pop from PQ
			if dist[edge.destination] < edge.cost {
				continue
			}
			dist[edge.destination] = edge.cost
			previous[edge.destination] = edge.source
			var list = self.VertexList[edge.destination]
			while let curr = list {
				if previous[curr.destination] == -1 {
					edge =  Edge(source : curr.source, 
					destination : curr.destination, 
					cost : curr.cost, next : nil)
					que.add(key : curr.cost, value : edge)
				}
				list = curr.next
			}
		}
		// Printing result.
		i = 0
		while i < count {
			if dist[i] == Int.max {
				print(" edge id  \(i) prev \(previous[i]) distance : Unreachable")
			} else {
				print(" edge id \(i) prev \(previous[i]) distance : \(dist[i])")
			}
			i+=1
		}
	}
	
	public func topologicalSort() {
		print("Topological order of given graph is : ")
		let count =  self.count
		var stk = Stack<Int>()
		var visited = Array(repeating : 0, count : count)
		var i = 0
		while i < count {
			if visited[i] == 0 {
				visited[i] = 1
				 self.topologicalSortDFS(index : i, 
				 visited : &visited, stk : &stk)
			}
			i+=1
		}
		// printing the order.
		while stk.isEmpty == false {
			print(stk.pop()!)
		}
	}
	
	private func topologicalSortDFS(index : Int, visited : inout [Int], stk : inout Stack<Int>) {
		var list = self.VertexList[index]
		while let curr = list {
			if visited[curr.destination] == 0 {
				visited[curr.destination] = 1
				 self.topologicalSortDFS(index : curr.destination, 
				 visited : &visited, stk : &stk)
			}
			list = curr.next
		}
		stk.push(index)
	}
	
	
	public func pathExist(source : Int, destination : Int) -> Bool {
		let count = self.count
		var visited = Array(repeating : 0, count : count)
		visited[source] = 1
		self.dfsRec(index : source, visited : &visited)
		return visited[destination] != 0
	}
	
	public func dfs() {
		let count = self.count
		var visited = Array(repeating : 0, count : count)
		var i = 0 
		while i < count {
			if visited[i] == 0 {
				visited[i] = 1
				 self.dfsRec(index : i, visited : &visited)
			}
			i+=1 
		}
		print(visited)
	}
	
	public func dfsRec(index : Int, visited : inout [Int]) {
		var list = self.VertexList[index]
		while let curr = list {
			if visited[curr.destination] == 0 {
				//print(curr.destination)
				visited[curr.destination] = 1
				 self.dfsRec(index : curr.destination, 
				 visited : &visited)
			}
			list = curr.next
		}
	}
	
	public func dfsStack() {
		let count = self.count
		var visited = Array(repeating : 0, count : count)
		let stk = Stack<Int>()
		visited[1] = 1
		stk.push(1)
	
		while stk.count != 0 {
			let temp = stk.pop()
			var list = self.VertexList[temp!]
			while let curr = list {
				if visited[curr.destination] == 0 {
					visited[curr.destination] = 1
					stk.push(curr.destination)
				}
				list = curr.next
			}
		}
	}
	
	public func bfs() {
		let count = self.count
		var visited = Array(repeating : 0, count : count)
		var i = 0 
		while i < count {
			if visited[i] == 0 {
				 self.bfsQueue(index : i, visited : &visited)
			}
			i+=1
		}
	
	}
	
	public func bfsQueue(index : Int, visited : inout [Int]) {
		let que = Queue<Int>()
		visited[index] = 1
		que.add(index)
	
		while que.count != 0 {
			let temp = que.remove()
			var list = self.VertexList[temp!]
			while let curr = list {
				if visited[curr.destination] == 0 {
					visited[curr.destination] = 1
					que.add(curr.destination)
				}
				list = curr.next
			}
		}
	}
	public func isConnected() -> Bool {
		let count = self.count
		var visited = Array(repeating : 0, count : count)
		visited[0] = 1
		self.dfsRec(index : 0, visited : &visited)
		var i = 0 
		while i < count {
			if visited[i] == 0 {
				return false
			}
			i+=1
		}
		return true
	}
	
	public func shortestPath(source : Int) {
		let count = self.count
		var distance = Array(repeating : Int.max, count : count)
		var path = Array(repeating : 0, count : count)
		let que = Queue<Int>()
		que.add(source)
		distance[source] = 0
		path[source] = source
		while que.count != 0 {
			let currIndex = que.remove()!
			var list = self.VertexList[currIndex]
			while let curr = list {
				if distance[curr.destination] == Int.max {
					distance[curr.destination] = 
					distance[currIndex] + 1
					path[curr.destination] = currIndex
					que.add(curr.destination)
				}
				list = curr.next
			}
		}
		var i = 0 
		while i < count {
			print("\(path[i]) to \(i) weight \(distance[i])")
			i+=1 
		}
	}
	public func bellmanFordshortestPath(source : Int) {
		let count = self.count
		let Infinite = Int.max
		var distance = Array(repeating : Infinite, count : count)
		var path = Array(repeating : 0, count : count)
	
		distance[source] = 0
		path[source] = source
		var i = 0 
		while i < count-1 {
			var j = 0
			while j < count {
				var head = self.VertexList[j]
				//if we can reach source then its desitnations can also be reached thorugh it.
				while head != nil && distance[j] != Infinite{
					let curr = head!
					let newDistance = distance[j] + curr.cost
					if distance[curr.destination] > newDistance {
						distance[curr.destination] = newDistance
						path[curr.destination] = j
					}
					head = curr.next
				}
				j+=1
			}
			i+=1 
		}
		i = 0 
		while i < count {
			print("\(path[i]) to \(i) weight \(distance[i])")
			i+=1 
		}
	}	
}


func main() {
	let g = Graph(9)
	g.AddBiEdge(source:0, destination:2, cost:1)
	g.AddBiEdge(source:1, destination:2, cost:5)
	g.AddBiEdge(source:1, destination:3, cost:7)
	g.AddBiEdge(source:1, destination:4, cost:9)
	g.AddBiEdge(source:3, destination:2, cost:2)
	g.AddBiEdge(source:3, destination:5, cost:4)
	g.AddBiEdge(source:4, destination:5, cost:6)
	g.AddBiEdge(source:4, destination:6, cost:3)
	g.AddBiEdge(source:5, destination:7, cost:1)
	g.AddBiEdge(source:6, destination:7, cost:7)
	g.AddBiEdge(source:7, destination:8, cost:17)
	//g.display()
	g.dijkstra(source:1)
	g.Prims()
}
main()
/*
func main2() {
	let g = Graph(6)
	g.addEdge(source:5, destination:2, cost:1)
	g.addEdge(source:5, destination:0, cost:1)
	g.addEdge(source:4, destination:0, cost:1)
	g.addEdge(source:4, destination:1, cost:1)
	g.addEdge(source:2, destination:3, cost:1)
	g.addEdge(source:3, destination:1, cost:1)
	g.topologicalSort()
}

//main2()

*/
func main3() {
	let g = Graph(9)
	g.addEdge(source:0, destination:2, cost:1)
	g.AddBiEdge(source:1, destination:2, cost:5)
	g.addEdge(source:1, destination:3, cost:7)
	g.addEdge(source:1, destination:4, cost:9)
	g.addEdge(source:3, destination:2, cost:2)
	g.addEdge(source:3, destination:5, cost:4)
	g.addEdge(source:4, destination:5, cost:6)
	g.addEdge(source:4, destination:6, cost:3)
	g.addEdge(source:5, destination:7, cost:1)
	g.addEdge(source:6, destination:7, cost:7)
	g.addEdge(source:7, destination:8, cost:17)
	print(g.pathExist(source : 1, destination : 0))
	print(g.pathExist(source : 0, destination : 1))
	print(g.pathExist(source : 1, destination : 2))
	g.display()
	/*g.dfs()
	g.dfsStack()
	g.bfs()
	print(g.isConnected())
	g.shortestPath(source:1)*/
	g.bellmanFordshortestPath(source:1)
}

main3()
