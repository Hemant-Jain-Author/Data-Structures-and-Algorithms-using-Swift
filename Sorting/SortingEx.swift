import Foundation;

func partition01(_ arr : inout [Int], _ size : Int) {
    var left : Int = 0;
    var right : Int = size - 1;
    while (left < right) {
        while (arr[left] == 0) {
            left += 1;
        }
        while (arr[right] == 1) {
            right -= 1;
        }
        if (left < right) {
            arr.swapAt(left,right);
        }
    }
}

func partition012_(_ arr : inout [Int], _ size : Int) {
    var zero : Int = 0;
    var one : Int = 0;
    var two : Int = 0;
    var  i : Int = 0;
    while (i < size) {
        if (arr[i] == 0) {
            zero += 1;
        } else if (arr[i] == 1) {
            one += 1;
        } else {
            two += 1;
        }
        i += 1;
    }

    var index : Int = 0;
    while (zero > 0) {
        arr[index] = 0;
        index += 1
        zero -= 1;
    }

    while (one > 0) {
        arr[index] = 1;
        index += 1
        one -= 1;
    }

    while (two > 0) {
        arr[index] = 2;
        index += 1
        two -= 1;
    }
}

func partition012(_ arr : inout [Int], _ size : Int) {
    var left : Int = 0;
    var right : Int = size - 1;
    var i : Int = 0;
    while (i <= right) {
        if (arr[i] == 0) {
            arr.swapAt(i,left);
            i += 1;
            left += 1;
        } else if (arr[i] == 2) {
            arr.swapAt(i,right);
            right -= 1;
        } else {
            i += 1;
        }
    }
}
// Testing code
func main1() {
    var arr : [Int] = [0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1];
    partition01( &arr,arr.count);
    print(arr);
    var arr2 : [Int] = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1];
    partition012( &arr2,arr2.count);
    print(arr2);
    var arr3 : [Int] = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1];
    partition012_( &arr3,arr3.count);
    print(arr3);
}
// 	[ 0 0 0 0 0 0 1 1 1 1 1 1 ]
// 	[ 0 0 0 0 0 1 1 1 1 1 2 2 ]

func rangePartition(_ arr : inout [Int], _ size : Int, _ lower : Int, _ higher : Int) {
    var start : Int = 0;
    var end : Int = size - 1;
    var i : Int = 0;
    while (i <= end) {
        if (arr[i] < lower) {
            arr.swapAt(i,start);
            i += 1;
            start += 1;
        } else if (arr[i] > higher) {
            arr.swapAt(i,end);
            end -= 1;
        } else {
            i += 1;
        }
    }
}

// Testing code
func main2() {
    var arr : [Int] = [1, 2, 3, 4, 18, 5, 17, 6, 16, 7, 15, 8, 14, 9, 13, 10, 12, 11];
    rangePartition( &arr,arr.count,9,12);
    print(arr);
}
// 	[ 1 2 3 4 5 6 7 8 10 12 9 11 14 13 15 16 17 18 ]

func minSwaps(_ arr : inout [Int], _ size : Int, _ val : Int) -> Int {
    var swapCount : Int = 0;
    var first : Int = 0;
    var second : Int = size - 1;
    while (first < second) {
        if (arr[first] <= val) {
            first += 1;
        } else if (arr[second] > val) {
            second -= 1;
        } else {
            arr.swapAt(first, second);
            swapCount += 1;
        }
    }
    return swapCount;
}

// Testing code
func main3() {
    var array : [Int] = [1, 2, 3, 4, 18, 5, 17, 6, 16, 7, 15, 8, 14, 9, 13, 10, 12, 11];
    print("minSwaps " + String(minSwaps( &array,array.count,10)));
}
// minSwaps 3

func separateEvenAndOdd(_ data : inout [Int], _ size : Int) {
    var left : Int = 0;
    var right : Int = size - 1;
    var aux : [Int] = Array(repeating: 0, count: size);
    var  i : Int = 0;
    while (i < size) {
        if (data[i] % 2 == 0) {
            aux[left] = data[i];
            left += 1;
        } else if (data[i] % 2 == 1) {
            aux[right] = data[i];
            right -= 1;
        }
        i += 1;
    }
    i = 0;
    while (i < size) {
        data[i] = aux[i];
        i += 1;
    }
}

func separateEvenAndOdd2(_ data : inout [Int], _ size : Int) {
    var left : Int = 0;
    var right : Int = size - 1;
    while (left < right) {
        if (data[left] % 2 == 0) {
            left += 1;
        } else if (data[right] % 2 == 1) {
            right -= 1;
        } else {
            data.swapAt(left,right);
            left += 1;
            right -= 1;
        }
    }
}

// Testing code
func main4() {
    var array : [Int] = [9, 1, 8, 2, 7, 3, 6, 4, 5];
    separateEvenAndOdd( &array,array.count);
    print(array);
    var array2 : [Int] = [9, 1, 8, 2, 7, 3, 6, 4, 5];
    separateEvenAndOdd2( &array2,array2.count);
    print(array2);
}
// [ 4 6 8 2 7 3 1 9 5 ]

func absGreater(_ value1 : Int, _ value2 : Int, _ ref : Int) -> Bool {
    return (abs(value1 - ref) > abs(value2 - ref));
}

func absBubbleSort(_ arr : inout [Int], _ size : Int, _ ref : Int) {
    var  i : Int = 0;
    while (i < (size - 1)) {
        var j : Int = 0;
        while (j < (size - i - 1)) {
            if (absGreater(arr[j],arr[j + 1],ref)) {
                arr.swapAt(j,j + 1);
            }
            j += 1;
        }
        i += 1;
    }
}

// Testing code
func main5() {
    var array : [Int] = [9, 1, 8, 2, 7, 3, 6, 4, 5];
    let ref : Int = 5;
    absBubbleSort( &array,array.count,ref);
    print(array);
}
// 	[ 5 6 4 7 3 8 2 9 1 ]

func eqGreater(_ value1 : Int, _ value2 : Int, _ A : Int) -> Bool {
    return (A * value1 * value1) > (A * value2 * value2);
}

func arrayReduction(_ arr : inout [Int], _ size : Int) {
    arr = arr.sorted(by: <);
    var count : Int = 1;
    var reduction : Int = arr[0];
    var  i : Int = 0;
    while (i < size) {
        if (arr[i] - reduction > 0) {
            reduction = arr[i];
            count += 1;
            print(size - i);
        }
        i += 1;
    }
    print("Total number of reductions: " + String(count));
}

// Testing code
func main6() {
    var arr : [Int] = [5, 1, 1, 1, 2, 3, 5];
    arrayReduction( &arr,arr.count);
}
// Total number of reductions: 4

func sortByOrder(_ arr : inout [Int], _ size : Int, _ arr2 : inout [Int], _ size2 : Int) {
    var ht :  [Int:Int] =  [Int:Int]();
    var value : Int;
    var  i : Int = 0;
    while (i < size) {
        if (ht.keys.contains(arr[i])) {
            value = ht[arr[i]]!;
            ht[arr[i]] = value + 1;
        } else {
            ht[arr[i]] = 1;
        }
        i += 1;
    }
    
    var j : Int = 0;
    while (j < size2) {
        if (ht.keys.contains(arr2[j])) {
            value = ht[arr2[j]]!;
            var k : Int = 0;
            while (k < value) {
                print(String(arr2[j]) + " ",terminator: "");
                k += 1;
            }
            ht[arr2[j]] = nil;
        }
        j += 1;
    }
    
    i = 0;
    while (i < size) {
        if (ht.keys.contains(arr[i])) {
            value = ht[arr[i]]!;
            var k : Int = 0;
            while (k < value) {
                print(String(arr[i]) + " ",terminator: "");
                k += 1;
            }
            ht[arr[i]] = nil;
        }
        i += 1;
    }
}

// Testing code
func main7() {
    var arr : [Int] = [2, 1, 2, 5, 7, 1, 9, 3, 6, 8, 8];
    var arr2 : [Int] = [2, 1, 8, 3];
    sortByOrder( &arr,arr.count, &arr2,arr2.count);
    print();
}
// 	2 2 1 1 8 8 3 5 7 9 6

func merge(_ arr1 : inout [Int], _ size1 : Int, _ arr2 : inout [Int], _ size2 : Int) {
    var index : Int = 0;
    var temp : Int;
    while (index < size1) {
        if (arr1[index] <= arr2[0]) {
            index += 1;
        } else {
            // always first element of arr2 is compared.
            temp = arr1[index];
            arr1[index] = arr2[0];
            arr2[0] = temp;

            index += 1;

            var i : Int = 0;
            // After swap arr2 may be unsorted.
            // Insertion of the element in proper sorted position.
            while (i < (size2 - 1)) {
                if (arr2[i] < arr2[i + 1]) {
                    break;
                }
                arr2.swapAt(i, i+1)
                i += 1;
            }
        }
    }
}

// Testing code.
func main8() {
    var arr1 : [Int] = [1, 5, 9, 10, 15, 20];
    var arr2 : [Int] = [2, 3, 8, 13];
    merge( &arr1,arr1.count, &arr2,arr2.count);
    print(arr1);
    print(arr2);
}
// 	[ 1 2 3 5 8 9 ]
// 	[ 10 13 15 20 ]

func checkReverse(_ arr : inout [Int], _ size : Int) -> Bool {
    var start : Int = -1;
    var stop : Int = -1;
    var  i : Int = 0;
    while (i < (size - 1)) {
        if (arr[i] > arr[i + 1]) {
            start = i;
            break;
        }
        i += 1;
    }
    
    if (start == -1) {
        return true;
    }
    
    i = start;
    while (i < (size - 1)) {
        if (arr[i] < arr[i + 1]) {
            stop = i;
            break;
        }
        i += 1;
    }
    
    if (stop == -1) {
        return true;
    }

    // increasing property
    // after reversal the sub array should fit in the array.
    if (arr[start - 1] > arr[stop] || arr[stop + 1] < arr[start]) {
        return false;
    }

    i = stop + 1;
    while (i < size - 1) {
        if (arr[i] > arr[i + 1]) {
            return false;
        }
        i += 1;
    }
    return true;
}

func main9() {
    var arr1 : [Int] = [1, 2, 6, 5, 4, 7];
    print(checkReverse( &arr1,arr1.count));
}
// true

func unionIntersectionSorted(_ arr1 : inout [Int], _ size1 : Int, _ arr2 : inout [Int], _ size2 : Int) {
    var first : Int = 0;
    var second : Int = 0;
    var unionArr : [Int] = [Int]();
    var interArr : [Int] = [Int]();
    while (first < size1 && second < size2) {
        if (arr1[first] == arr2[second]) {
            unionArr.append(arr1[first]);
            interArr.append(arr1[first]);
            first += 1;
            second += 1;
        } else if (arr1[first] < arr2[second]) {
            unionArr.append(arr1[first]);
            first += 1;
        } else {
            unionArr.append(arr2[second]);
            second += 1;
        }
    }

    while (first < size1) {
        unionArr.append(arr1[first]);
        first += 1;
    }

    while (second < size2) {
        unionArr.append(arr2[second]);
        second += 1;
    }

    print("Union: ", unionArr);
    print("Intersection: ", interArr);
}

func unionIntersectionUnsorted(_ arr1 : inout [Int], _ size1 : Int, _ arr2 : inout [Int], _ size2 : Int) {
    arr1 = arr1.sorted(by: <);
    arr2 = arr2.sorted(by: <);
    unionIntersectionSorted( &arr1,size1, &arr2,size2);
}

func main10() {
    var arr1 : [Int] = [1, 11, 2, 3, 14, 5, 6, 8, 9];
    var arr2 : [Int] = [2, 4, 5, 12, 7, 8, 13, 10];
    unionIntersectionUnsorted( &arr1,arr1.count, &arr2,arr2.count);
}

/* 
Union:  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
Intersection:  [2, 5, 8]
 */
main1();
main2();
main3();
main4();
main5();
main6();
main7();
main8();
main9();
main10();