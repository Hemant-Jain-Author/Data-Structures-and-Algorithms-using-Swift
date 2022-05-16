import Foundation;

func printArray(_ arr : inout [Int], _ n : Int)
{
	var i : Int = 0;
	while (i < n)
	{
		print(String(arr[i]) + " ",terminator: "");
		i += 1;
	}
	print();
}
func swap(_ arr : inout [Int], _ i : Int, _ j : Int)
{
	let temp : Int = arr[i];
	arr[i] = arr[j];
	arr[j] = temp;
}
func permutation(_ arr : inout [Int], _ i : Int, _ length : Int)
{
	if (length == i)
	{
		Permutations.printArray( &arr,length);
		return;
	}
	var j : Int = i;
	while (j < length)
	{
		Permutations.swap( &arr,i,j);
		Permutations.permutation( &arr,i + 1,length);
		Permutations.swap( &arr,i,j);
		j += 1;
	}
	return;
}
// 	1 2 3 4 
// 	1 2 4 3 
// 	.....
// 	4 1 3 2 
// 	4 1 2 3
func isValid(_ arr : inout [Int], _ n : Int) -> Bool
{
	var j : Int = 1;
	while (j < n)
	{
		if (abs(arr[j] - arr[j - 1]) < 2)
		{
			return false;
		}
		j += 1;
	}
	return true;
}
func permutation2(_ arr : inout [Int], _ i : Int, _ length : Int)
{
	if (length == i)
	{
		if (Permutations.isValid( &arr,length))
		{Permutations.printArray( &arr,length);
		}
		return;
	}

	var j : Int = i;
	while (j < length)
	{
		Permutations.swap( &arr,i,j);
		Permutations.permutation2( &arr,i + 1,length);
		Permutations.swap( &arr,i,j);
		j += 1;
	}
	return;
}
func isValid2(_ arr : inout [Int], _ i : Int) -> Bool
{
	if (i < 1 || abs(arr[i] - arr[i - 1]) >= 2)
	{
		return true;
	}
	return false;
}
func permutation3(_ arr : inout [Int], _ i : Int, _ length : Int)
{
	if (length == i)
	{
		Permutations.printArray( &arr,length);
		return;
	}
	var j : Int = i;
	while (j < length)
	{
		Permutations.swap( &arr,i,j);
		if (Permutations.isValid2( &arr,i))
		{Permutations.permutation3( &arr,i + 1,length);
		}
		Permutations.swap( &arr,i,j);
		j += 1;
	}
	return;
}
	
// Testing code

var arr : [Int] = [1, 2, 3, 4];
Permutations.permutation( &arr,0,4);
print();
Permutations.permutation2( &arr,0,4);
print();
Permutations.permutation3( &arr,0,4);

