import Foundation;

func greater(_ value1 : Int, _ value2 : Int) -> Bool {
    return value1 > value2;
}

func InsertionSort(_ arr : inout [Int]) {
    let size : Int = arr.count;
    var temp : Int;
    var j : Int;
    var  i : Int = 1;
    while (i < size) {
        temp = arr[i];
        j = i;
        while (j > 0 && greater(arr[j - 1],temp)) {
            arr[j] = arr[j - 1];
            j -= 1;
        }
        arr[j] = temp;
        i += 1;
    }
}

var array : [Int] = [9, 1, 8, 2, 7, 3, 6, 4, 5];
InsertionSort( &array);
print(array)
