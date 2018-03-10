func increment1(value : Int) {
	data = data + 1
}

func increment2(value : inout Int) {
	*data = *data + 1
}


var data : MyInt = 1
println("value before increment1() call :", data)
data.increment1()
println("value after increment1() call :", data)
data.increment2()
println("value after increment2() call :", data)

/*
value before increment1() call : 1
value after increment1() call : 1
value after increment2() call : 2
*/

