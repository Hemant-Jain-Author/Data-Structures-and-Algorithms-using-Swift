import Foundation;

func print(_ Q : inout [Int], _ n : Int)
{
	var i : Int = 0;
	while (i < n)
	{
		print(" " + String(Q[i]),terminator: "");
		i += 1;
	}

	print(" ");
}

func feasible(_ Q : inout [Int], _ k : Int) -> Bool
{
	var i : Int = 0;
	while (i < k)
	{
		if (Q[k] == Q[i] || abs(Q[i] - Q[k]) == abs(i - k))
		{
			return false;
		}
		i += 1;
	}
	return true;
}
func nQueens(_ Q : inout [Int], _ k : Int, _ n : Int)
{
	if (k == n)
	{
		NQueen.print( &Q,n);
		return;
	}

	var i : Int = 0;
	while (i < n)
	{
		Q[k] = i;
		if (NQueen.feasible( &Q,k))
		{
			NQueen.nQueens( &Q,k + 1,n);
		}
		i += 1;
	}
}

var Q : [Int] = Array(repeating: 0, count: 8);
NQueen.nQueens( &Q,0,8);
