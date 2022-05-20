var que : [Int] = [Int]()

que.append(1)
que.append(2)
que.append(3)

print("Queue :", que)
print("Size :", que.count)
print("IsEmpty :", que.isEmpty)
print("First :", que.first!)

var temp : Int;
while !que.isEmpty {
	temp = que.removeFirst()
	print(temp)
}

/* 
Queue : [1, 2, 3]
Size : 3
IsEmpty : false
First : 1
1
2
3
 */
