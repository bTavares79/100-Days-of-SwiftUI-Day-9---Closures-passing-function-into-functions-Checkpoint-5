import UIKit

let luckyNumbers = [7,4,38,21,16,15,12,33,31,49]
var filteredNumbers = [Int]()

// This checks if the value is not divisable by 2 and returns the remaining values
filteredNumbers = luckyNumbers.filter { $0 % 2 != 0 }
print(filteredNumbers)


// Returns the array sorted from lowest number to highest number
filteredNumbers = filteredNumbers.sorted()
print(filteredNumbers)


// Map the filterd and sorted array to an array of strings with the text in the array element already
var stringArray = [String]()
stringArray = filteredNumbers.map {"\($0) is lucky number"}
print(stringArray)


// Print out each element to the console
for element in  stringArray {
    print(element)
}



// ==================================== From the Youtube Comments ============================
// Single line of code answer
luckyNumbers.filter { $0 % 2 != 0 }.sorted().map{print("\($0) is a lucky number.")}
