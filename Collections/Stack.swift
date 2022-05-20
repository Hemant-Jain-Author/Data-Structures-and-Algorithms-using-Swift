var stk : [Int] = [Int]()

stk.append(1)
stk.append(2)
stk.append(3)

print("Stack :", stk)
print("Size :", stk.count)
print("IsEmpty :", stk.isEmpty)
print("Top :", stk.last!)

var temp : Int;
while !stk.isEmpty {
	temp = stk.removeLast()
	print(temp)
}

/* 
Stack : [1, 2, 3]
Size : 3
IsEmpty : false
Top : 3
3
2
1
 */
