import Foundation;

func greater(_ value1 : Int, _ value2 : Int) -> Bool {
    return value1 > value2;
}

func SelectionSort(_ arr : inout [Int]) {
    // sorted array created in reverse order.
    let size : Int = arr.count;
    var j : Int;
    var mx : Int;
    var i : Int = 0;
    while (i < size - 1) {
        mx = 0;
        j = 1;
        while (j < size - i) {
            if (arr[j] > arr[mx]) {
                mx = j;
            }
            j += 1;
        }
        arr.swapAt(size-1-i, mx)
        i += 1;
    }
}

func SelectionSort2(_ arr : inout [Int]) {
    // sorted array created in forward direction
    let size : Int = arr.count;
    var j : Int;
    var mn : Int;
    var i : Int = 0;
    while (i < size - 1) {
        mn = i;
        j = i + 1;
        while (j < size) {
            if (arr[j] < arr[mn]) {
                mn = j;
            }
            j += 1;
        }
        arr.swapAt(i, mn)
        i += 1;
    }
}

var array : [Int] = [9, 1, 8, 2, 7, 3, 6, 4, 5];
SelectionSort(&array);
print(array);
print();
var array2 : [Int] = [9, 1, 8, 2, 7, 3, 6, 4, 5];
SelectionSort2(&array2);
print(array2);