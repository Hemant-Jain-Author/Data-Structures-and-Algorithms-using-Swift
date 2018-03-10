func main() {
	var str = "my name is hemant jain"
	str = reverseWords(str)
	print(str)

	print(matchExp("*world?", "hello worldi"))

	var i = 1
	while i < 100 {
		print(isPrime(i))
		i += 1
	}
	print(isUniqueChar("aple"))
	print(isPalindrome("aplelpa"))
	print(isPalindrome("applppe"))
	print(isPalindrome("apllpa"))
	print(isPermutation("apllpa", "pllpaa"))
	print(isPermutation("apllpa", "apllpaa"))
	print(pow(2, 10))

	printAnagram("12345")
	print(shuffle("aaaabbbb"))
	print(strcmp("a", "b"))
	print(strcmp("b", "a"))
	print(strcmp("a", "a"))
	print(strcmp("ba", "baaa"))
	print(strcmp("bad", "bae"))
	print(strcmp("bad", "baa"))
}

func matchExpUtil(_ exp : String, _ str : String, _ i : Int, _ j : Int) -> Bool {
	if i == exp.count && j == str.count {
		return true
	}
	if (i == exp.count && j != str.count) || (i != exp.count && j == str.count) {
		return false
	}
	if exp[i] == "?" || exp[i] == str[j] {
		return matchExpUtil(exp, str, i+1, j+1)
	}
	if exp[i] == "*" {
		return matchExpUtil(exp, str, i+1, j) || matchExpUtil(exp, str, i, j+1) || matchExpUtil(exp, str, i+1, j+1)
	}
	return false
}

func matchExp(_ exp : String, _ str : String) -> Bool {
	return matchExpUtil(exp, str, 0, 0)
}

func match(_ source : String, _ pattern : String) -> Int {
	var iSource = 0
	var iPattern = 0
	var sourceLen = source.count
	var patternLen = pattern.count
	while iSource < sourceLen {
		if source[iSource] == pattern[iPattern] {
			iPattern += 1
		}
		if iPattern == patternLen {
			return 1
		}
		iSource += 1
	}
	return 0
}

func isPrime(_ n : Int) -> Bool {
	print(n)
	var answer = false
	if n > 1 {
		answer = true
	}
	var i = 2
	while i*i <= n {
		if n%i == 0 {
			answer = false
			break
		}
		i += 1
	}
	return answer
}

/*
func myAtoi(str : String) -> Int {
	value = 0
	size = str.count
	while i = 0; i < size; i += 1 {
		ch = str[i]
		ch2 = "0"[0]
		value = (value ,  3) + (value ,  1) + (Int)(ch-ch2)
	}
	return value
}
*/
func isUniqueChar(_ str : String) -> Bool {
	var mp = [Character, Bool]()
	for char in str {
		if mp[char] != false {
			print("Duplicate detected!")
			return false
		}
		mp[c] = true
	}
	print("No duplicate detected!")
	return true
}

func isPermutation(_ s1 : String, _ s2 : String) -> Bool {
	var count = [Character,Int]()
	if s2.count != s1.count {
		print(s1, "&", s2, "are not permutation")
		return false
	}
	for ch in s1  {
		if count[ch] == nil {
			count[ch] = 1
		} else {
			count[ch] += 1
		}
	}
	for ch in s2  {
		if count[ch] == nil || count[ch] == 0 {
		print("\(s1) & \(s2) are not permutation")
			return false
		} else {
			count[ch] -= 1
		}
	}
	print("\(s1) & \(s2) are permutation")
	return true
}

func isPalindrome(_ str : String) -> Bool {
	var i = 0
	var j = str.count - 1
	while i < j && str[i] == str[j] {
		i += 1
		j -= 1
	}
	if i < j {
		print("String is not a Palindrome")
		return false
	}
	print("String is a Palindrome")
	return true
}

func pow(_ x : Int, _ n : Int) -> Int {
	var value : Int
	if n == 0 {
		return 1
	} else if n%2 == 0 {
		value = pow(x, n/2)
		return (value * value)
	} else {
		value = pow(x, n/2)
		return x * value * value
	}
}

func strcmp(a : String, b : String) -> Int {
	var index = 0
	var len1 = a.count
	var len2 = b.count
	var minlen = len1
	if len1 > len2 {
		minlen = len2
	}

	while index < minlen && a[index] == b[index] {
		index += 1
	}

	if index == len1 && index == len2 {
		return 0
	} else if len1 == index {
		return -1
	} else if len2 == index {
		return 1
	}
	return (Int)(a[index]) - (Int)(b[index])
}

// func reverseString(a : String) -> String {
// 	var chars = []Int(a)
// 	reverseStringUtil(chars)
// 	return String(chars)
// }

func reverseString(a : String) {
	var lower = 0
	var upper = a.count - 1
	while lower < upper {
		a.swapAt(lower, upper)
		lower += 1
		upper -= 1
	}
}

func reverseStringRange(a : String, lower : Int, upper : Int) {
	while lower < upper {
		a.swapAt(lower, upper)
		lower += 1
		upper -= 1
	}
}

func reverseWords(_ str : String) -> String {
	var length = str.count
	var upper = -1
	var lower = 0
	var i = 0

	while i < length {
		if str[i] == " " {
			reverseStringRange(str, lower, upper)
			lower = i + 1
			upper = i
		} else {
			upper += 1
		}
		i += 1
	}
	reverseStringRange(str, lower, upper)
	reverseStringRange(str, 0, length-1)
	return str
}

func printAnagram(_ a : inout String) {
	let n = a.count
	printAnagramUtil(a, n, n)
}

func printAnagramUtil(_ a : inout [Int], _ max : Int, _ n : Int) {
	if max == 1 {
		print(a)
	}
	var i = -1
	while i < max-1 {
		if i != -1 {
			a.swapAt(i,max-1)
		}
		printAnagramUtil(a, max-1, n)
		if i != -1 {
			a.swapAt(i,max-1)
		}
		i += 1
	}
}

func shuffle(_ arr : inout String) -> String {
	var n = arr.count / 2
	var count = 0
	var k = 1
	var temp, temp2 : Int
	var i = 1
	while i < n {
		k = i
		temp = arr[i]
		while true {
			k = (2 * k) % (2*n - 1)
			temp2 = temp
			temp = arr[k]
			arr[k] = temp2
			
			count += 1
			if i == k {
				break
			}
		}
		if count == (2*n - 2) {
			break
		}
		i = i + 2
	}
	return arr
}

main()