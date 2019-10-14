import UIKit

// Question One

// Write a function named applyKTimes that takes an integer K and a closure and calls the closure K times. The closure will not take any parameters and will not have a return value.


// Your function here

func applyKTimes(_ k: Int, _ closure: () -> ()) {
    for _ in 1...k{
        // print("hello")
        closure()
    }
}

// applyKTimes(5)

// Uncomment out the following lines to check your solution

var myVal = 0
applyKTimes(5) {
    myVal += 1 // is this the closure?
}
assert(myVal == 5, "Expected myVal to be five, but was \(myVal)")

//
// Question Two

// Write a function called multiples(of:in) that takes in an array of Ints and returns all of the Ints that are a multiple of a given number n.  Use filter in your function.

// Answer:

func multiples(of n: Int, in numArray: [Int]) -> [Int] {
    return numArray.filter { (num) -> Bool in
        num % n == 0
    }
}

// Uncomment out the following lines to check your solution

let numbers = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]
let expectedOutputTwo = [3, 6, 9, 3, 12]
let outputTwo = multiples(of: 3, in: numbers)
assert(outputTwo == expectedOutputTwo, "Expected output to be \(expectedOutputTwo), but found \(outputTwo)")


// Question Three

// Write a function called largestValue(in:) that finds the largest Int in an array of Ints. Use reduce to solve this exercise.

// Answer:

func largestValue(in numbers: [Int]) -> Int {
    
    guard let first = numbers.first else { return -1} // to get the first value of the array, if the array is empty it will not continue and will return -1.
    
    // using trailing closure syntax to solve reduce excercise

    let result = numbers.reduce(first) { (preResult, currentValue) in // between these two curly brackets is the closure that we are providing the reduce function
        if preResult > currentValue {
            return preResult
        } else {
            return currentValue
        }
    }
    return result
}


// Uncomment out the following lines to check your solution

let moreNumbers = [4, 7, 1, 9, 6, 5, 6, 9]
let expectedOutputThree = 9
let outputThree = largestValue(in: moreNumbers)
assert(outputThree == expectedOutputThree, "Expected output to be \(expectedOutputThree), but found \(outputThree)")


// Question Four

// Write a function called sortedNamesByLastName(in:) that takes in an array of tuples of type (String, String) and returns an array of tuples sorted by last name.

// Answer:

func sortedNamesByLastName(in names: [(firstname: String, lastname: String)]) -> [(String, String)] {
    
    let orderedArray = names.sorted { $0.lastname < $1.lastname}
    return orderedArray
}

// Uncomment out the following lines to check your solution

let firstAndLastTuples = [
    ("Johann S.", "Bach"),
    ("Claudio", "Monteverdi"),
    ("Duke", "Ellington"),
    ("W. A.", "Mozart"),
    ("Nicolai","Rimsky-Korsakov"),
    ("Scott","Joplin"),
    ("Josquin","Des Prez")
]
let expectedOutputFour = [
    ("Johann S.", "Bach"),
    ("Josquin","Des Prez"),
    ("Duke", "Ellington"),
    ("Scott","Joplin"),
    ("Claudio", "Monteverdi"),
    ("W. A.", "Mozart"),
    ("Nicolai","Rimsky-Korsakov")
]

let outputFour = sortedNamesByLastName(in: firstAndLastTuples)
assert(outputFour.elementsEqual(expectedOutputFour, by: { $0 == $1 }), "Expected output to be \(expectedOutputFour), but found \(outputFour)")


// Question Five

// Write a function called sumOfSquaresOfOddNumbers(in:) that returns the sum of the squares of all the odd numbers from an array of Ints.  Use filter, map and reduce in your function.

// Answer:

func sumOfSquaresOfOddNumbers(in intArray: [Int]) -> Int {
    var sum = 0
    var array = intArray
    array = array.filter({$0 % 2 != 0})
    
    array = array.map({$0 * $0 })
    sum = array.reduce(0,+)
    
    return sum
    }
    
// Uncomment out the following lines to check your solution

let evenMoreNumbers = [1, 2, 3, 4, 5, 6]
let expectedOutputFive = 35 // Explanation: 1 + 9 + 25 -> 35
let outputFive = sumOfSquaresOfOddNumbers(in: evenMoreNumbers)
assert(outputFive == expectedOutputFive, "Expected output to be \(expectedOutputFive), but found \(outputFive)")

