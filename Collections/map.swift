var dict: [String:Int] = [:]

dict["Apple"] = 40
dict["Banana"] = 30
dict["Mango"] = 50
for (key, val) in dict {
	print("\(key) ->  \(val)")
}
if let val = dict["Apple"] {
	print("Apples price: \(val)")
} else {
	print("Apples are out of chart.")
}
 
dict["Apple"] = nil

if let val = dict["Apple"] {
	print("Apples price: \(val)")
} else {
	print("Apples are out of chart.")
}

/*

Banana ->  30
Mango ->  50
Apple ->  40
Apples price: 40
Apples are out of chart.

*/