class Counter<T: Hashable > {
	private var dict: [T:Int] = [:]

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

let mp = Counter<String>()
mp.add("a")
mp.add("b")
mp.add("a")
print(mp.find("a"))
print(mp.find("b"))
print(mp.find("c"))
print(mp.get("a"))
print(mp.get("b"))
print(mp.get("c"))
mp.remove("b")
print(mp.find("b"))
print(mp.get("b"))

/*
true
true
false
2 true
1 true
0 false
*/
