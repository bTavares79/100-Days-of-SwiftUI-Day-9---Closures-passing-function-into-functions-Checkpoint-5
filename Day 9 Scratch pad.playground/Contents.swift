import UIKit


// ================================================ How to create and use closures ========================================
func greetUser() {
    print("Hi there!")
}

greetUser()

// When copying a function you have to remove the ()
var greetCopy = greetUser
greetCopy()


// How to declare a closure
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello("Taylor")


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
print(team)
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne"{
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

// On an array you can call the sorted method and pass it a function to choose how to sort the array
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)



let captainFirstTeam2 = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Suzanne"{
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})

print(captainFirstTeam2)



// ============================================= How to use trailing closures and shorthand syntax ===============================
let sorted = team.sorted { a, b in
    if a == "Suzanne"{
        return true
    } else if b == "Suzanne" {
        return false
    }
    return a < b
}

// Even more shorthand
let sorted1 = team.sorted {
    if $0 == "Suzanne"{
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

print(sorted1)


// Single line of code to reverse sort the array
let reverseSort = team.sorted{ $0 > $1}
print(reverseSort)



let tOnly = team.filter { $0.hasPrefix("T")}
print(tOnly)


// Return all the values from the array in upper case
let uppercaseTeam = team.map { $0.uppercased()}
print(uppercaseTeam)


// ========================================= How to accept functions as parameters ===============================
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

// This is the function that is passed into the function above to generate a randon array
func generateNumbers() -> Int {
    Int.random(in: 1...20)
}

// This is how you call the function that accepts a function as a parameter
let newRolls = makeArray(size: 50, using: generateNumbers)
print(newRolls)


// Example of multiple trailing closures
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start the first work")
    first()
    print("About to start the second work")
    second()
    print("About to start the third work")
    third()
    print("Done")
}


// Calling this is a little differnt than before with a single closure
doImportantWork{
    print("This is the first work")
} second: {
        print("This is the second work")
} third: {
    print("This is the third work")
}
