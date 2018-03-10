func NQueens(n : Int) {
	var Q = [Int](repeating: 0, count : n )
	NQueensUtil(Q : &Q, k : 0, n : 8)
}

func NQueensUtil(Q :inout [Int], k : Int, n : Int) {
	if k == n {
		print(Q)
		return
	}
	var i = 0
	while i < n {
		Q[k] = i
		if Feasible(Q:Q, k:k) {
			NQueensUtil(Q:&Q, k:k+1, n:n)
		}
		i+=1
	}
}

func Feasible(Q : [Int], k : Int) -> Bool {
	var i = 0;
	while i < k {
		if Q[k] == Q[i] || abs(Q[i]-Q[k]) == abs(i-k) {
			return false
		}
		i+=1
	}
	return true
}

NQueens(n:8)
