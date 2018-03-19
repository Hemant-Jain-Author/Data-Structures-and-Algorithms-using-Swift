func fun1(n: Int) -> Int {
	var m = 0
	var i : Int = 0 
	while i < n { 
		m += 1
		i+=1
	}
	return m
}

func fun2(n : Int) -> Int {
	var m = 0
	var i : Int = 0 
	while i < n { 
		var j : Int = 0
		while j < n{
			m += 1
			j+=1 
		}
		i+=1
	}
	return m
}

func fun3(n : Int) -> Int {
	var m = 0
	var i : Int = 0 
	while i < n {
		var j : Int = 0 
		while j < i {
			m += 1
			j += 1
		}
		i += 1
	}
	return m
}

func fun4(n : Int) -> Int {
	var m = 0
	var i = 1
	while i < n {
		m += 1
		i = i * 2
	}
	return m
}

func fun5(n : Int) -> Int {
	var m = 0
	var i = n
	while i > 0 {
		m += 1
		i = i / 2
	}
	return m
}

func fun6(n : Int) -> Int {
	var m = 0
	var i : Int = 0 
	while i < n { 
		var j : Int = 0
		while j < n {
			var k = 0
			while k < n{
				m += 1
				k += 1
			}
			j+=1
		}
		i+=1
	}
	return m
}

func fun7(n : Int) -> Int {
	var m = 0
	var i : Int = 0 
	while i < n { 
		var j : Int = 0
		while j < n {
			m += 1
			j+=1
		}
		i+=1
	}
	i = 0 
	while i < n { 
		var k = 0
		while k < n {
			m += 1
			k += 1
		}
		i+=1
	}
	return m
}
import Foundation
func fun8(n : Int) -> Int {
	var m = 0
	var i : Int = 0 
	while i < n { 
		let sq = sqrt(Double(n))
		var j : Int = 0
		while j < Int(sq) {
			m += 1
			j += 1
		}
		i+=1
	}

	return m
}

func fun9(n : Int) -> Int {
	var m = 0
	var i = n
	while i > 0 {
		var j : Int = 0 
		while j < i {  
			m += 1
			j+=1
		}
		i /= 2
	}
	return m
}

func fun10(n : Int) -> Int {
	var m = 0
	var i : Int = 0 
	while i < n { 
		var j = i
		while j > 0 {
			m += 1
			j -= 1
		}
		i+=1
	}
	return m
}

func fun11(n : Int) -> Int {
	var m = 0
	var i : Int = 0 
	while i < n { 
		var j = i
		while j < n {
			var k = j + 1
			while k < n {
				m += 1
				k += 1
			}
			j+=1
		}
		i+=1
	}
	return m
}

func fun12(n : Int) -> Int {
	var j = 0
	var m = 0
	var i : Int = 0 
	while i < n { 
		while j < n {
			m += 1
			j+=1
		}
		i+=1
	}
	return m
}

func fun13(n : Int) -> Int {
	var m = 0
	var i = 1
	while i <= n {
		var j : Int = 0
		while j <= i {
			m += 1
			j+=1
		}
		i *= 2
	}
	return m
}

print("N = 100, Number of instructions O(n):: \(fun1(n:100))")
print("N = 100, Number of instructions O(n^2):: \(fun2(n:100))")
print("N = 100, Number of instructions O(n^2):: \(fun3(n:100))")
print("N = 100, Number of instructions O(log(n)):: \(fun4(n:100))")
print("N = 100, Number of instructions O(log(n)):: \(fun5(n:100))")
print("N = 100, Number of instructions O(n^3):: \(fun6(n:100))")
print("N = 100, Number of instructions O(n^2):: \(fun7(n:100))")
print("N = 100, Number of instructions O(n^(3/2)):: \(fun8(n:100))")
print("N = 100, Number of instructions O(log(n)):: \(fun9(n:100))")
print("N = 100, Number of instructions O(n^2):: \(fun10(n:100))")
print("N = 100, Number of instructions O(n^3):: \(fun11(n:100))")
print("N = 100, Number of instructions O(n):: \(fun12(n:100))")
print("N = 100, Number of instructions O(n):: \(fun13(n:100))")

/*
N = 100, Number of instructions O(n):: 100
N = 100, Number of instructions O(n^2):: 10000
N = 100, Number of instructions O(n^2):: 4950
N = 100, Number of instructions O(log(n)):: 7
N = 100, Number of instructions O(log(n)):: 7
N = 100, Number of instructions O(n^3):: 1000000
N = 100, Number of instructions O(n^2):: 20000
N = 100, Number of instructions O(n^(3/2)):: 1000
N = 100, Number of instructions O(log(n)):: 197
N = 100, Number of instructions O(n^2):: 4950
N = 100, Number of instructions O(n^3):: 166650
N = 100, Number of instructions O(n):: 100
N = 100, Number of instructions O(n):: 134
*/
