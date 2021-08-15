import UIKit

let numArray = [6,2,10,16,14,99,87,64]

func binarySearch(searchValue: Int, array: [Int]) -> Bool {
    
    let array = array.sorted()
    
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {

        let middleIndex = ( leftIndex + rightIndex ) / 2
        let middleValue = array[middleIndex]
        
        if searchValue == middleValue {
            return true
        }
        
        if searchValue < middleValue {
            rightIndex = middleIndex - 1
        }
        
        if searchValue > middleValue {
            leftIndex = middleIndex + 1
        }
    }
    
    return false
}

binarySearch(searchValue: 5, array: numArray)

func alternativeBinarySearch(searchValue: Int, array: [Int]) -> Bool {
    
    var array = array.sorted()
    var leftIndex = 0
    var rightIndex = array.count - 1

    let middleIndex = ( leftIndex + rightIndex ) / 2
    let middleValue = array[middleIndex]
    
    if searchValue == middleValue {
        return true
    }
    
    if searchValue < array[leftIndex] || searchValue > array[rightIndex] {
        return false
    }
    
    if searchValue < middleValue {
        array = Array(array[leftIndex...middleIndex - 1])
        print(array)
        return alternativeBinarySearch(searchValue: searchValue, array: array)
    }
    
    if searchValue > middleValue {
        array = Array(array[middleIndex + 1 ... rightIndex])
        print(array)
        return alternativeBinarySearch(searchValue: searchValue, array: array)
    }
    
    return false

}

alternativeBinarySearch(searchValue: 5, array: numArray)
