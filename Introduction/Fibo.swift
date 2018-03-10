func fibonacci(n : Int) -> Int {
	if n <= 1 {
		return n
	}
	return fibonacci(n : n-1) + fibonacci(n : n-2)
}

func fibonacci2(n : Int) -> Int {
	var first = 0
	var second = 1
	var temp = 0

	if n == 0 {
		return first
	} else if n == 1 {
		return second
	}

	var i = 2
	while i <= n {
		temp = first + second
		first = second
		second = temp
		i+=1
	}
	return temp
}
import Foundation
let start = Date()
print("\(fibonacci(n:30))")
let end = Date()
let timeElapsed: Double = end.timeIntervalSince(start)
print(timeElapsed)

let startTime = NSDate()
print("\(fibonacci2(n:30))")
let endTime = NSDate()
let timeInterval: Double = endTime.timeIntervalSince(startTime as Date)
print("time = \(timeInterval) / sec")