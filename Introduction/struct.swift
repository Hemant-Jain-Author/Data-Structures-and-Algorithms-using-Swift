struct student {
	var rollNo : Int = 0
	var name : String = ""
}

func main() {
	let stud = student(rollNo : 1, name : "johny") 
	print(stud) 
	print("Student name ::",stud.name) // Accessing inner fields.

	print(student(rollNo : 2, name : "Ann")) // Named initialization.
	print(student()) // Default initialization
}

main()

/*
{1 johny}
Student name :: johny
Student name :: johny
{2 Ann}
{2 Ann}
{0 Alice}
*/