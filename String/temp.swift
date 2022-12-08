
func TopDownFunction(_ dp : inout [Int], _ ways : inout [Int], _ target : Int) -> Int {
    // Base Case
    if (target == 0) {
        return 0;
    }
    if (dp[target] != INVALID) {
        return dp[target];
    }

    // Recursion
    var i : Int = 0;
    while (i < ways.count) {
        dp[target] = min(dp[target],self.TopDownFunction( &dp, &ways,target - ways[i]) + cost);
        i += 1;
    }
    return dp[target];
}

func TopDownFunction(_ ways : inout [Int], _ target : Int) -> Int {
    let dp : [Int] = Array(repeating: INVALID, count: target);
    // fill dp[] with INVALID value
    return self.TopDownFunction( &dp, &ways,target);
}

func BottomUpFunction(_ ways : inout [Int], _ target : Int) -> Int {
    let dp : [Int] = Array(repeating: INVALID, count: target);
    // fill dp[] array with value INVALID
    dp[0] = 0; // Base value.
    var i : Int = 1;
    while (i <= target) {
        var j : Int = 0;
        while (j < ways.count) {
            // For all fusible ways.
            dp[i] = min(dp[i],dp[i - ways[j]] + cost);
            j += 1;
        }
        i += 1;
    }
    return dp[target];
}






func TopDownFunction(_ dp : inout [Int], _ ways : inout [Int], _ target : Int) -> Int {
    // Base Case
    if (target == 0) {
        return 0;
    }
    if (dp[target] != 0) {
        return dp[target];
    }

    // Recursion
    var i : Int = 0;
    while (i < ways.count && ways[i] <= i) {
        // For all fusible ways.
        dp[target] += self.TopDownFunction( &dp, &ways,target - ways[i]);
        i += 1;
    }
    return dp[target];
}

func TopDownFunction(_ ways : inout [Int], _ target : Int) -> Int {
    let dp : [Int] = Array(repeating: 0, count: target);
    return self.TopDownFunction( &dp, &ways,target);
}

func BottomUpFunction(_ ways : inout [Int], _ target : Int) -> Int {
    let dp : [Int] = Array(repeating: 0, count: target);
    var i : Int = 1;
    while (i <= target) {
        var j : Int = 0;
        while (j < ways.count && ways[i] <= i) {
            // For all fusible ways.
            dp[i] += dp[i - ways[j]];
            j += 1;
        }
        i += 1;
    }
    return dp[target];
}




func TopDownFunction(_ costs : inout [Int]) -> Int {
    let n : Int = costs.count;
    let dp : [[Int]] = Array(repeating: Array(repeating: INVALID, count: n), count: n);
    return self.TopDownFunction( &dp, &costs,0,n - 1);
}

func TopDownFunction(_ dp : inout [[Int]], _ costs : inout [Int], _ i : Int, _ j : Int) -> Int {
    // Base Case
    if (i == j) {
        return 0;
    }
    if (dp[i][j] != self.INVALID) {
        return dp[i][j];
    }

    // Recursion
    var k : Int = i;
    while (k < j) {
        dp[i][j] = self.min(dp[i][j],self.TopDownFunction( &dp, &costs,i,k) + costs[k] + self.TopDownFunction( &dp, &costs,k + 1,j));
        k += 1;
    }
    return dp[i][j];
}


func BottomUpFunction(_ costs : inout [Int]) -> Int {
    let n : Int = costs.count;
    let dp : [[Int]] = Array(repeating: Array(repeating: INVALID, count: n), count: n);
    //  fill array element with value INVALID
    var l : Int = 1;
    while (l < n) { // l is length of range.
        var i : Int = 1,j = i + l;
        while (j < n) {
            var k : Int = i;
            while (k < j) {
                dp[i][j] = self.min(dp[i][j],dp[i][k] + costs[k] + dp[k + 1][j]);
                k += 1;
            }
            i += 1;
            j += 1;
        }
        l += 1;
    }
    return dp[1][n - 1];
}

var i : Int = 0;
while (i < self.n) {
    var j : Int = 0;
    while (j < i) {
        // incremental found pattern of sub-problem.
        j += 1;
    }
    i += 1;
}

var l : Int = 1;
while (l < self.n) { // Range.
    var i : Int = 0,j = i + l;
    while (j < self.n){
        // incremental calculation of sub-problem 
        // with increasing range.
        i += 1;
        j += 1;
    }
    l += 1;
}


var i : Int = 1;
while (i <= self.m) { // First string index.
    var j : Int = 1;
    while (j <= self.n) { // Second string index.
        // Comparison of two strings.
        j += 1;
    }
    i += 1;
}



func BottomUpFunction(_ costs : inout [Int]) -> Int {
    let n : Int = costs.count;
    let dp : [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: n);
    // Initialization of 0th state of various types.
    dp[0][1] = // Initialization value
    dp[0][0] = // Initialization value
    var i : Int = 1;
    while (i < n) {
        dp[i][1] = // Max values based on previous states.
        dp[i][0] = // Max values based on previous states.
        i += 1;
    }
    return self.max(dp[n - 1][1],dp[n - 1][0]);
}


