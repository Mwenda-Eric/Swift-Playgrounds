import UIKit
import Foundation

//Variable Constant and Static

var myName = "Eric Mwenda"
let firstNumber = 55 //Let is used to ensure the variable is immutable.( Cannot mutate-change )
var secondNumber = 654 //Var can be assigned to any type of variable, is mutable.
let total = firstNumber + secondNumber

class Person{
    static let age = 24
    static let firstName = "Eric"
    var lastName = "Mwenda"
    var favoriteSong = "Banners - Where The Shadow Ends!"
    var favoriteMeal = "I eat anything"
    var ericsConscious = InnerPerson()
    
    class InnerPerson{
        static let innerCrush = "Special Case"
        var innerLove = "Chest Pweins"
        var innerPasison: String = "Making Games"//Type inferencing used here.
    }
}

var eric = Person()
let ericsAge = Person.age
var firstName = Person.firstName
let favoriteSong = eric.favoriteSong
let favoriteMeal = Person().favoriteMeal

var ericsCrush = Person.InnerPerson.innerCrush
var ericsLove = eric.ericsConscious.innerLove
ericsCrush = "Her"

//Types --> Actual variable type that you are assigning.

class Eric{
    static let myAge: Int = 99
    let myIdNumber: Int = 1111111111
    static let myFirstName: String = "Eric"
    var myLastName: String = "Mwenda"
    static let isAdult: Bool = true
    var dreamSalary: Double = 450000004343934.3454
    var mpesaBalance: Float = 00.00
}

var me: Eric = Eric()//Overall object to reference the non static variables.

var myAge = Eric.myAge
var myIdNumber = me.myIdNumber
var myFirstName = Eric.myFirstName
var myLastName = me.myLastName
var amIAnAdult: Bool = Eric.isAdult
var myDreamSalary: Double = me.dreamSalary
var myMpesaBalance: Float = me.mpesaBalance

var myFirstAndLastNames = myFirstName + " " + myLastName

//var everythingAboutMe: String = "Hi My First Name is " + Eric.myFirstName + " My last name is " + Eric().myLastName + ". I am " + Eric.myAge + " years old. It's " + Eric.isAdult + " I'm an adult so my ID Number is " + Eric().myIdNumber + " My dream salary is " + me.dreamSalary + ", but unfortunately my current account balance is " + Eric().mpesaBalance + "."

var aboutMe: String = "My Name is \(Eric.myFirstName) \(Eric().myLastName)"

//Functions and Parameters.
let myTwoNames: String = "Eric Mwenda"
printParameterString(whatToPrint: myName)

func printParameterString(whatToPrint: String){
    print(whatToPrint)
}

class MathOperations{
    var firstNumber: Float = 0
    var secondNumber: Float = 0
    
    func setFirstNumber(newFirstNumberValue: Float){
        firstNumber = newFirstNumberValue
    }
    
    func setSecondNumber(newSecondNumberValue: Float){
        secondNumber = newSecondNumberValue
    }
    
    func addNumbers(firstNo: Float, secondNo: Float) -> Float{
        return firstNo + secondNo
    }
    
    func multiplyNumbers(firstNo: Float, secondNo: Float) -> Float{
        return firstNo * secondNo
    }
    
    func divideFirstNumberBySecondNumber(firstNo: Float, secondNo: Float) -> Float{
        if(!isFirstNumberGreater(firstNumber: firstNo, secondNumber: secondNo)){
            let errorMessage = "Cannot Divide: First Number is less than Second Number."
            printParameterString(whatToPrint: errorMessage)
            return 0
        }
        return firstNo / secondNo
    }
    
    func isFirstNumberGreater(firstNumber: Float, secondNumber: Float) -> Bool{
        if (firstNumber > secondNumber){
            return true
        }
        return false
    }
    
    func isIntegerNumberEven(number: Int) -> Bool{
        return number % 2 == 0
    }
    
    //Apparently you can't use Modulus in a floating point number is swift.
    //You should use truncatingRemainder instead.
    func isFloatingPointNumberEven(number: Float) -> Bool{
        let remainder = number.truncatingRemainder(dividingBy: 2)
        let intNumber = Int(number)//We'll just have to type cast because in swift you cant check if float /double is even.
        if(remainder == 0){
            return true
        }
        return false
    }
}//end class MathOperations.

var math = MathOperations()
var firstNum = math.firstNumber
math.setFirstNumber(newFirstNumberValue: 5454)
var newFirstNum = math.firstNumber
math.setSecondNumber(newSecondNumberValue: 543.5)
var newSecondNum = math.secondNumber

math.isFirstNumberGreater(firstNumber: math.firstNumber, secondNumber: math.secondNumber)
var division = math.divideFirstNumberBySecondNumber(firstNo: newFirstNum, secondNo: newSecondNum)

math.setSecondNumber(newSecondNumberValue: 543.52)
var secNo = math.secondNumber
var isSecondNumberEven = math.isFloatingPointNumberEven(number: 543.52)

var isNumberEven = math.isIntegerNumberEven(number: 5454)

//Classes and Structs.
// A major difference between a class and a struct is that a class is a reference type while a
// Struct is a value type.

class RecordLabel{
    var labelName: String
    var countryLocation: String
    private var numberOfRegisteredArtists: Int = 0
    var annualRevenue: Double = 0
    
    var registeredArtists: Int{
        get{
            return numberOfRegisteredArtists
        }
        set{
            numberOfRegisteredArtists = newValue
        }
    }
    
    //Constructor.
    init(labelName: String, countryLocation: String){
        self.labelName = labelName
        self.countryLocation = countryLocation
        increaseRegisteredArtists()
    }
    
    internal func increaseRegisteredArtists(){
        self.numberOfRegisteredArtists += 1
    }
    
    internal func getRecordLabelName() -> String{
        return self.labelName
    }
    internal func getLabelAnnualRevenue() -> Double{
        return self.annualRevenue
    }
}

class MusicArtist: RecordLabel{
    internal var artistName: String
    internal let artistCountry: String
    var artistAge: Int = 0
    var musicCopiesSold: Int = 0
    var numberOfSubscribers: Int = 0
    var recordLabel: RecordLabel? = nil
    
    private var numberOfMusicStreams: Int = 0//Private property of streams that shouldn't be modified outside.
    var monthlyStreams: Int{//public property that can modify the prive streams with a getter and setter.
        get{
            return numberOfMusicStreams
        }
        set{
            numberOfMusicStreams = newValue//New value is a keyword.
        }
    }
    
    init(artistName: String, artistCountry: String){
        self.artistName = artistName
        self.artistCountry = artistCountry
        super.init(labelName: "", countryLocation: "")
    }
    
    internal func hasSoldCopiesMoreThan(musicCopiesSold: Int) -> Bool{
        if(self.musicCopiesSold > musicCopiesSold){
            return true
        }
        return false
    }
}

struct Artist{
    internal var artistName: String
    internal var artistCountry: String
    internal var artistAge: Int
    
    init(artistName: String, artistCountry: String, artistAge: Int){
        self.artistName = artistName
        self.artistCountry = artistCountry
        self.artistAge = artistAge
    }
}

var sonyMusic: RecordLabel = RecordLabel(labelName: "Sony", countryLocation: "United States")
var universalMusic = RecordLabel(labelName: "Universal Music Group", countryLocation: "Dutch")


var taylorSwift: MusicArtist = MusicArtist(artistName: "Taylor Swift", artistCountry: "United States")
taylorSwift.recordLabel = sonyMusic
taylorSwift.artistAge = 33
taylorSwift.monthlyStreams = 43000000
taylorSwift.musicCopiesSold = 1500000

var taylorsMonthlyStreams = taylorSwift.monthlyStreams
var taylorsRecordLabel: String = taylorSwift.getRecordLabelName()
var hasTaylorSoldMoreThanAMillion = taylorSwift.hasSoldCopiesMoreThan(musicCopiesSold: 1000000)
taylorSwift.getLabelAnnualRevenue()
//print("\(taylorSwift.artistName) is \(taylorSwift.artistAge) Years Old. She is from \(taylorSwift.artistCountry). Her Record Label is \(taylorSwift.recordLabel?.labelName)")

var selenaGomez: MusicArtist = MusicArtist(artistName: "Selena Gomez", artistCountry: "United States")
selenaGomez.recordLabel = universalMusic
selenaGomez.artistAge = 30

var sonyRecordLabel: String = sonyMusic.getRecordLabelName()
var numberOfArtistsRegisteredUnderSony = sonyMusic.registeredArtists
var numberOfArtistsRegisteredUnderUniversal = universalMusic.registeredArtists

//print("\(selenaGomez.artistName) is \(selenaGomez.artistAge) Years Old. She is from \(selenaGomez.artistCountry). Her Record Label is \(selenaGomez.recordLabel?.labelName)")
var selenaRecordLabelName = selenaGomez.recordLabel?.labelName
print(selenaRecordLabelName as Any)

var taylorSwiftClone: MusicArtist = taylorSwift
var taylorSwiftCloneName = taylorSwiftClone.artistName
var taylorSwiftCloneRecordLabelName = taylorSwiftClone.recordLabel?.labelName

taylorSwiftClone.artistName = "Taylor Swift Clone"
var originalTaylorsName = taylorSwift.artistName

var brunoMars: Artist = Artist(artistName: "Bruno Mars", artistCountry: "United States", artistAge: 37)
brunoMars.artistName = "Original Bruno Mars"
brunoMars.artistCountry = "Original USA"
brunoMars.artistAge = 38

var brunoMarsClone: Artist = brunoMars
brunoMarsClone.artistName = "Clone Bruno Mars"
brunoMarsClone.artistCountry = "Clone USA"
brunoMarsClone.artistAge = 39

brunoMars.artistName
brunoMarsClone.artistName

brunoMars.artistCountry
brunoMarsClone.artistCountry

brunoMars.artistAge
brunoMarsClone.artistAge

//Looping
class Looping{
    /**
     For an iterative loop. the syntax uses "..." and "..<" ".." -> Is used when you want to include the last number in the upper bound. (<=)
        "..<" -> is used when you dont want to include the last number in the upper bound. (<)
     */
    func getSumOfNumbersUpTo(upperBound: Int) -> Int{
        var sum = 0
        for i in 0...upperBound{
            sum += i
        }
        return sum
    }
    
    func getArraySum(array: [Int]) -> Int{
        var total = 0
        for number in array{
            total += number
        }
        return total
    }
    
    //In this function the _ before the variable name means that you don't need to explicitly name the parameter when calling the function.
    //Using [Int] -> This is by default a let constant declared in the parameter  and won't let you modify it by eg reassigning array indexes.
    //This is because in swift when you pass a parameter to a function, it receives a copy of the original value.
    //To counter this, you can use the inout keyword before the array type definition.
    //inout - This will allow the function to modify the original value of the parameter.
    //When you use inout, you must use '&' when calling the function to pass in the original value.
    func returnKthSmallestNumber(_ array: inout [Int],_ kthNumber:Int) -> Int{
        //Do A bubble Sort to the Array.
        for i in 0..<array.count{
            for j in 1..<array.count - i{//Note we're looping through to i
                if(array[j] < array[j-1]){
                    var temp = array[j]
                    array[j] = array[j-1]
                    array[j-1] = temp
                }
            }
        }//End array sorting.
        return array[kthNumber]
    }
    
    func returnKthSmallestNumberLibrary(array: [Int], kthNumber: Int) -> Int{
        return array.sorted(by: <)[kthNumber]
        //var sortedArray = array.sorted(by: <)
        //return sortedArray[kthNumber]
    }
    
    //The stride() function can be used to specify ranges and iteration by when looping.
    //It has two variations in which are stride(from: to: by:) and stride(from: through: by:)
    //When printing in reverse order the by: parameter has to be negative.
    //by: Represents the step size between the two interval numbers.
    //Difference between to: and through: is to:(..<) through:(...)
    //to: - the last number in the range is not included.
    //through: - the last number in the range is included.
    func printEvenNumbersInDescending(_ lowerBound: Int, _ upperBound: Int){
        for i in stride(from: upperBound, to: lowerBound, by: -2){
            print(i)
        }
    }
    
    func printOddNumbersAscending(lowerBound: inout Int, upperBound: Int){
        if(lowerBound % 2 == 0){//If the first number is even, add 1 to it to make it odd.
            lowerBound += 1
        }
        for i in stride(from: lowerBound, through: upperBound, by: 2){
            print(i)
        }
    }
    
    //while loop.
    func printRangeOfNumbers(_ lowerBound: Int, _ upperBound: Int){
        var i = lowerBound
        while i <= upperBound{
            print(i)
            i += 1
        }
    }
    
    //Do-while loop
    func setNewPassword(newPassword: String){
        var isSuccessful = false;
        let oldPassword = "OldPassword"
        repeat{
            print("Enter new Password")
            var newPassword = readLine()!//The ! means readline() shouldn't return nil. The user has to enter something.
            if(newPassword == oldPassword){//Old and new password are the same.
                print("Old password cannot be the same with new password.")
                isSuccessful = false
            }else{
                isSuccessful = true
                print("Successfully Changed Password to \(newPassword)")
            }
        }while !isSuccessful
    }
    
    //For-Each Loop
}

var algorithms = Looping()
var myArray = [43,435,245,2,545,2,54,2,32,54,63,2,4]
var sumOfMyArray = Looping().getArraySum(array: myArray)
var sumOfNumbersTo7 = Looping().getSumOfNumbersUpTo(upperBound: 7)

var thirdSmallestNumber = algorithms.returnKthSmallestNumber(&myArray, 3)
var thirdSmallestNumberLibrary = algorithms.returnKthSmallestNumberLibrary(array: myArray, kthNumber: 3)
//algorithms.printEvenNumbersInDescending(0, 10)
//algorithms.printRangeOfNumbers(43, 55)
var lowerBound = 2
//algorithms.printOddNumbersAscending(lowerBound: &lowerBound, upperBound: 13)
//You cant use 2 here in the lower bound since it's a literal and is immutable - for inout parameter in the function the incoming type has to be mutable.
//algorithms.setNewPassword(newPassword: "OldPassword")

class OptionalsAndUnwrapping{
    //Optional - represents an object that can be nil. Completely different to the type that is declared.
    func returnOptionalSum(_ firstNumber: Int?, _ secondNumber: Int?) -> Int?{
        var sum: Int? = nil
        type(of: sum)//This is a generic that can check what type of the parameter is.
        //var total = firstNumber + secondNumber // You can't do this coz they are now 'OptioanlInts' not 'Int'
        
        //To make that calculation you have to do unwrapping of the optional values.
        if let value = firstNumber{
            //Means that firstNumber has a value inside.
            if let value2 = secondNumber{
                sum = value + value2
            }
        }
        return sum
    }
}

var optional = OptionalsAndUnwrapping()
var sum = optional.returnOptionalSum(434, 43432)
if let sum = optional.returnOptionalSum(2, 7){//Unwrap the sum value. //sume here is declared as a local variable.
    print("Local Unwrapped sum is \(sum)")
}
print("Unwrapped Sum = \(optional.returnOptionalSum(5454, 432))")
print("Type of sum is -> \(type(of: sum))")

//CONDITIONALS.
class Conditionals{
    var number: Int
    
    init(){
        self.number = 0
    }
    
    func isNumberEven(_ number: Int) -> Bool{
        return number % 2 == 0
    }
    
    func checkWaterStateAtTemperature(_ waterTemperature: Int) -> String{
        if(waterTemperature < 0){
            return "Frozen"
        }else if(waterTemperature >= 100){
            return "Gaseous"
        }else{
            return "Liquid"
        }
    }
    
    func getGradeWithMarks(_ marks: Int) -> Character{
        if(marks > 0 && marks < 40){
            return "E"
        }else if(marks >= 40 && marks < 50){
            return "D"
        }else if(marks >= 50 && marks < 60){
            return "C"
        }else if(marks >= 60 && marks < 70){
            return "B"
        }else if(marks >= 70 && marks <= 100){
            return "A"
        }else{
            return "X"
        }
    }
    
    internal func getGradeWithMarksSwitch(_ marks: Int) -> Character{
        switch marks{
        case 0..<40:
            return "E"
        case 40..<50:
            return "D"
        case 50..<60:
            return "C"
        case 60..<70:
            return "B"
        case 70...100:
            return "A"
        default:
            return "X"
        }
    }
    
    internal func unwrapOptionalDoublesAndReturnSum(_ firstNumber: Double?, _ secondNumber: Double?) -> Double{
        if let value1 = firstNumber, let value2 = secondNumber{//Note the second let is separated by multi clause ,
            return value1 + value2
        }
        return 0
    }
}

var conditional = Conditionals()
var isThisNumberEven: Bool = conditional.isNumberEven(543)
isThisNumberEven = conditional.isNumberEven(234)

var waterState: String = conditional.checkWaterStateAtTemperature(583)
waterState = conditional.checkWaterStateAtTemperature(4)
waterState = conditional.checkWaterStateAtTemperature(-44)
waterState = conditional.checkWaterStateAtTemperature(0)

var myGrade: Character = conditional.getGradeWithMarks(66)
myGrade = conditional.getGradeWithMarks(40)
myGrade = conditional.getGradeWithMarks(10)
myGrade = conditional.getGradeWithMarks(58)
myGrade = conditional.getGradeWithMarks(72)

var myGradeUsingSwitch = conditional.getGradeWithMarksSwitch(0)
myGradeUsingSwitch = conditional.getGradeWithMarksSwitch(40)
myGradeUsingSwitch = conditional.getGradeWithMarksSwitch(50)
myGradeUsingSwitch = conditional.getGradeWithMarksSwitch(60)
myGradeUsingSwitch = conditional.getGradeWithMarksSwitch(70)
myGradeUsingSwitch = conditional.getGradeWithMarksSwitch(343)

var optionalDoubleSum = conditional.unwrapOptionalDoublesAndReturnSum(432, 34)
