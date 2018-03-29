
class Trie {
	class Node {
		var isLastChar : Bool = false
		var children: [Character:Node] = [:]
	}

	var root = Node()

func insert(_ s : String) {
	if s == "" {
		return
	}

	let str : [Character] = Array(s) /*s.lowercased() is other option.*/
	self.root = self.insertUtil(node : self.root, str : str, index : 0)
}

func insertUtil(node : Node?, str : [Character], index : Int) -> Node {
	var curr : Node
	if node == nil {
		curr = Node()
	} else {
		curr = node!
	}
	
	if str.count == index {
		curr.isLastChar = true
	} else {
		curr.children[str[index]] = 
		self.insertUtil(node : curr.children[str[index]], str : str, index : index+1)
	}
	return curr
}

func remove(_ s : String) {
	if s == "" {
		return
	}

	let str : [Character] = Array(s.lowercased())
	self.removeUtil(curr : self.root, str : str,  index : 0)
}

func removeUtil(curr : Node?, str : [Character], index : Int) {
	guard let curr = curr else {
		return
	}

	if str.count == index {
		if curr.isLastChar {
			curr.isLastChar = false
		}
		return
	}
	self.removeUtil(curr : curr.children[str[index]], str : str, index : index+1)
}

func find(_ s : String) -> Bool {
	if s == "" {
		return false
	}
	let str : [Character] = Array(s) /* s.lowercased() */
	return self.findUtil(curr : self.root, str : str, index : 0)
}

func findUtil(curr : Node?, str : [Character], index : Int) -> Bool {
	guard let curr = curr else {
		return false
	}
	if str.count == index {
		return curr.isLastChar
	}
	return self.findUtil(curr : curr.children[str[index]], str : str, index : index+1)
}
}



let t = Trie()
let a = "apple"
let b = "app"
let c = "appletree"
let d = "tree"
print (t)
t.insert(a)
t.insert(d)
print(t.find(a))
print(t.find(b))
print(t.find(c))
print(t.find(d))
t.remove(d)
print(t.find(a))
print(t.find(b))
print(t.find(c))
print(t.find(d))
