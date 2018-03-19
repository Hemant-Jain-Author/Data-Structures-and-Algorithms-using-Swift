func TowersOfHanoi(num : Int) {
	print("The sequence of moves involved in the Tower of Hanoi are :")
	TOHUtil(num : num, from :"A", to : "C", temp : "B")
}

func TOHUtil(num : Int, from : String, to : String, temp : String) {
	if num < 1 {
		return
	}

	TOHUtil(num : num-1, from : from, to : temp, temp : to)
	print("Move disk ", num, " from peg ", from, " to peg ", to)
	TOHUtil(num : num-1, from : temp, to : to, temp : from)
}

TowersOfHanoi(num : 3)
