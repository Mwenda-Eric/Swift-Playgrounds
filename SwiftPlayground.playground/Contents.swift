//When writing import statements. It's advisable to name order them alphabetically.
//For easier traction when they become plenty.
import Foundation
import UIKit

//Variable Constant and Static

var myName = "Eric Mwenda"
let firstNumber = 55 //Let is used to ensure the variable is immutable.( Cannot mutate-change )
var secondNumber = 654 //Var can be assigned to any type of variable, is mutable.
let total = firstNumber + secondNumber

class Person{
    static let age = 99
    static let firstName = "Eric"
    var lastName = "Mwenda"
    var favoriteSong = "Banners - Where The Shadow Ends!"
    var favoriteMeal = "I eat anything"
    var ericsConscious = InnerPerson()
    
    class InnerPerson{
        static let innerThought = "My Inner Thought."
        var innerDecision = "My Inner Decision"
        var innerPasison: String = "Making Games"//Type inferencing used here.
    }
}

var eric = Person()
let ericsAge = Person.age
var firstName = Person.firstName
let favoriteSong = eric.favoriteSong
let favoriteMeal = Person().favoriteMeal

var myInnerThought: String = Person.InnerPerson.innerThought
var myInnerDecision: String = eric.ericsConscious.innerDecision

//Types --> Actual variable type that you are assigning.

/**
 Key Differences between Float and Double.
 In Swift, both Double and Float are used to represent decimal numbers, but there are some key differences between them:

 Precision: Double has a higher precision than Float. A Double can represent decimal numbers with up to 15-17 decimal digits of precision,
 while a Float can represent decimal numbers with up to 6-9 decimal digits of precision.
 This means that a Double can represent a larger range of decimal numbers with more accuracy.

 Size: Double requires more memory than Float. A Double uses 8 bytes of memory to store a value, while a Float uses 4 bytes.
 This means that if you have a large number of decimal numbers to store and memory is a concern, you may want to use Float instead of Double.

 Range: The range of values that can be represented by a Double is greater than the range of values that can be represented by a Float.
 A Double can represent values from approximately -1.8 x 10^308 to 1.8 x 10^308,
 while a Float can represent values from approximately -3.4 x 10^38 to 3.4 x 10^38.

 Performance: In general, operations on Float values are faster than operations on Double values,
 because Float requires less memory. However, the difference in performance is usually not significant
 unless you are performing a large number of operations.

 In general, if you need high precision and a large range of values, you should use Double.
 If memory is a concern and the precision is not critical, you should use Float.

 It's worth noting that, when working with decimal numbers,
 it's always a good practice to be explicit about the type you are using,
 because Double is the default type for decimal numbers in Swift.
 */

class Eric{
    static let myAge: Int = 99
    let myIdNumber: Int = 1111111111
    static let myFirstName: String = "Eric"
    var myLastName: String = "Mwenda"
    static let isAdult: Bool = true
    var salary: Double = 45003943334.3432354
    var mpesaBalance: Float = 343449.79123
}

var me: Eric = Eric()//Overall object to reference the non static variables.

var myAge = Eric.myAge
var myIdNumber = me.myIdNumber
var myFirstName = Eric.myFirstName
var myLastName = me.myLastName
var amIAnAdult: Bool = Eric.isAdult

/**
 When you print a float variable in Swift, it is formatted by default to display 1 decimal place.
 If you want to display more decimal places, you can use the String(format:) initializer
 and specify the number of decimal places you want to display,
 */
var mpesaBalanceAllDecimalPlaces: Float = 0.0
if let mpesaBalanceUnwrapped = Float(String(format: "%.9f", me.mpesaBalance)){
    mpesaBalanceAllDecimalPlaces = mpesaBalanceUnwrapped
}
print("Mpesa Balance 9 Decimal Places = \(String(format: "%.9f", mpesaBalanceAllDecimalPlaces))")
print(me.mpesaBalance)

var mySalary: Double = me.salary
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
    
    //Get and set property.
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
        return array[kthNumber - 1]//We are subtracting 1 because of zero indexing.
    }
    
    func returnKthSmallestNumberLibrary(array: [Int], kthNumber: Int) -> Int{
        return array.sorted(by: <)[kthNumber - 1]
    
        //var sortedArray = array.sorted(by: <)
        //return sortedArray[kthNumber]
    }
    
    func returnSortedArrayAscending(array: [Int]) -> [Int]{
        return array.sorted(by: <)
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
var sortedArray = algorithms.returnSortedArrayAscending(array: myArray)
var sumOfMyArray = Looping().getArraySum(array: myArray)
var sumOfNumbersTo7 = Looping().getSumOfNumbersUpTo(upperBound: 7)

var thirdSmallestNumber = algorithms.returnKthSmallestNumber(&myArray, 5)
var thirdSmallestNumberLibrary = algorithms.returnKthSmallestNumberLibrary(array: myArray, kthNumber: 6)
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
    
    //Swift switch cases have to be exhausive for all conditions. If not. Have a default.
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
    
    //Guard Statement. -> Basically cleaner if statement.
    internal func unwrapUsingGuardAndReturnMultiple(_ firstNumber: Int?, _ secondNumber: Int?) -> Int?{
        guard let number1 = firstNumber, let number2 = secondNumber else{ return nil }
        return number1 * number2
    }
    
    /**
     The 3N + 1 problem, also known as the Collatz Conjecture, is a mathematical problem that asks about the behavior of a simple iterative process applied to integers. The problem is defined as follows:

     Take any positive integer N.
     If N is even, divide it by 2.
     If N is odd, multiply it by 3 and add 1.
     Repeat steps 2 and 3 with the new value of N, until N becomes 1.
     The conjecture is that, no matter which positive integer is chosen, the sequence of numbers generated by this process will always eventually reach the number 1.

     The problem is still unresolved, it's not known whether the conjecture is true for all positive integers or not. It's been tested for many numbers, and it has been found to be true for all numbers tested so far. But no one has been able to prove or disprove it for all positive integers.
     */
    internal func return3NPlus1SumOf(number: Int?) -> Int?{
        var problemTotal = 0
        guard var numberUnwrapped = number else{ return nil }
        
        print("3N + 1 Math Collatz Conjecture Pattern of \(String(describing: number)) is :")
        
        while numberUnwrapped != 1{
            if(isNumberEven(numberUnwrapped)){
                numberUnwrapped = numberUnwrapped / 2
            }else{
                numberUnwrapped = (numberUnwrapped * 3) + 1
            }
            problemTotal += numberUnwrapped
            //print(numberUnwrapped)
        }
        
        return problemTotal
    }
    
    private func isNumberEven(number: Int) -> Bool{
        guard number % 2 == 0 else{ return false }
        return true
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

var myGradeUsingSwitch: Character = conditional.getGradeWithMarksSwitch(0)
myGradeUsingSwitch = conditional.getGradeWithMarksSwitch(40)
myGradeUsingSwitch = conditional.getGradeWithMarksSwitch(50)
myGradeUsingSwitch = conditional.getGradeWithMarksSwitch(60)
myGradeUsingSwitch = conditional.getGradeWithMarksSwitch(70)
myGradeUsingSwitch = conditional.getGradeWithMarksSwitch(343)

var optionalDoubleSum = conditional.unwrapOptionalDoublesAndReturnSum(432, 34)
var optionalIntSum: Int? = conditional.unwrapUsingGuardAndReturnMultiple(4, 10)

var collatzNumber = 3
var collatzConjectureSum = conditional.return3NPlus1SumOf(number: 43566)

//Enums and Switch Statement.

/**
 Enumerations and switch statement are powerful tools in Swift. Enumerations provide a way to define a set of related values, and switch statement provides a way to match a specific value and perform an action based on the match. When used together, they can make the code more readable and expressive, by allowing you to express complex conditions
 */
internal class EnumsAndSwitch{
    
    //You can do a multi line enum declaration separated by commas.
    //you can also assign a default value to the enum if you wanted to.
    internal enum WeatherSeason{
        case Spring
        case Summer
        case Autum
        case Winter
    }
    
    internal func checkWeatherSeason(currentSeason: WeatherSeason) -> WeatherSeason{
        switch currentSeason{
        case .Spring://You don't have to say WatherSeason.Spring coz the compiler already knows the enum.
            //You can also print the raw value of an assigned enum by using .rawValue on the enum.
            //return .Spring.rawValue
            print("Sunny, It's Spring Time")
            return .Spring
        case .Summer:
            print("It's Summer Time!")
            return .Summer
        case .Autum:
            print("It's Autum")
            return .Autum
        case .Winter:
            print("Cold, It's Winter.")
            return .Winter
        }
    }
    
    //Associating values with enum cases.
    internal enum Weather{
        case Sunny(temperature: Int)
        case Cloudy(cloudCover: Double)
        case Rainy(precipitation: String)
        case Snowy(snowDepth: Float)
    }
    
    internal func getTodaysWeatherDetails(todaysWeather: Weather) -> String{
        switch todaysWeather{
        case .Sunny(let temperature):
            return "It's Sunny Today with a Temperature of : \(temperature)"
            
        case .Cloudy(let cloudCover):
            return "It's Cloudy Today with a Cloud Cover of : \(cloudCover)"
            
        case .Rainy(let precipitation):
            return "It's Rainy Today with a Precipitation of : \(precipitation)"
            
        case .Snowy(let snowDepth):
            return "It's Snowy Today with a Snow Depth of : \(snowDepth)"
        }
    }
}

var currentSeason: EnumsAndSwitch.WeatherSeason = EnumsAndSwitch.WeatherSeason.Spring
var confirmedSeason = EnumsAndSwitch().checkWeatherSeason(currentSeason: currentSeason)

var todaysWeather = EnumsAndSwitch.Weather.Sunny(temperature: 27)
var todaysWeatherStatus: String = EnumsAndSwitch().getTodaysWeatherDetails(todaysWeather: todaysWeather)
print(todaysWeatherStatus)

/**
 In Swift, a protocol is a blueprint for a group of methods, properties, and other requirements that a class, struct, or enumeration must conform to. Protocols define a set of rules that a type must follow, but they don't provide any implementation for those rules.
 
 Protocols also can inherit from one another, protocol can inherit from one or more other protocols. This allows you to define a protocol in terms of other protocols, and can provide a way to reuse functionality across multiple protocols.
 */
//Swift Protocols - Basically interfaces from other languages.
//Naming conventions of protocols have suffixes "Delegate" and "DataSource"

internal protocol CarDataSource{
    /**
     A class, struct, or enumeration that conforms to this protocol must implement these requirements.
     Protocols can also have optional requirements, which are marked with the optional keyword, this means that conforming types are not required to implement these requirements.
     */
    
    //For variable properties you have to specify whether it's a {get or set}
    var carName: String { get set }
    var carPrice: Int { get set }
    var carState: String { get set }
    
    func drive()//These will change the car state to -> driving, stopped and parked.
    func stop()
    func park()
    func getDriversName() -> String
    
    func isCar4WheelDrive() -> Bool
    func isCarryingPassengers() -> Bool
}

class Car{
    private var manufacturer: String
    //public manufacturer setter and getter.
    internal var carManufacturer: String{
        get{
            return manufacturer
        }set{
            manufacturer = newValue
        }
    }
    
    init(manufacturer: String){
        self.manufacturer = manufacturer
    }
}

//In this case Audi inherits from car and should follow the protocol(interface) of CarDataSource.
class Audi: Car, CarDataSource{
    
    var carName: String
    var carPrice: Int
    var carState: String
    private var carStateEnum: CarState = CarState.Parked(status: "Parked")
    
    private enum CarState{
        case Parked(status: String)
        case Driving(status: String)
        case Stopped(status: String)
    }
    
    init(){
        self.carName = "Audi"
        self.carPrice = 5000000
        self.carState = "Parked"
        super.init(manufacturer: "AUDI Motors")
    }
    
    func drive(){
        carState = "Driving"
        carStateEnum = .Driving(status: carState)
    }
    
    func stop(){
        carState = "Stopped"
        carStateEnum = .Stopped(status: carState)
    }
    
    func park() {
        carState = "Parked"
        carStateEnum = .Parked(status: carState)
    }
    
    func getDriversName() -> String {
        return "Eric Mwenda"
    }
    
    func isCar4WheelDrive() -> Bool {
        return true
    }
    
    func isCarryingPassengers() -> Bool{
        return false
    }
    
    internal func getAllCarDetails() -> String{
        return "This car is \(carName) : Manufactured by \(carManufacturer) : Driver is \(getDriversName()) : Current Status is \(carStateEnum) | \(carState) : The car is 4 Wheel - \(isCar4WheelDrive()) : The car is carrying Passengers - \(isCarryingPassengers())"
    }
}

var myCar = Audi()
var myDriversName: String = myCar.getDriversName()
var myCarsManufacturer = myCar.carManufacturer//Accessing the parent class.
myCar.drive()
myCar.park()
myCar.carManufacturer = "Mercedes Benz"
print(myCar.getAllCarDetails())

//Weak And Strong Variables.
/**
 When we declare a variable in swift without specifying, it's by default a strong variable.
 'weak' -> may only be applied to class and class-bound protocol types not primitives-I guess.
                you should use weak when refernecing instances.
 'weak' -> may only be used on 'var' declarations
 */
internal class WeakAndStrongObjects{
    var outerPerson: String?
    
    internal class Person{
        var personName: String?
        weak var personsPet: Pet?
    }
    
    internal class Pet: Person{
        var petName: String?
        var petAge: Int?
        
        func initialize(petName: String, petAge: Int){
            self.petName = petName
            self.petAge = petAge
        }
        
        func feedPet(){
            guard let petsName = petName else{ return }
            print("\(petsName) is Feeding!")
        }
        
        func renamePet(_ newPetsName: String){
            petName = newPetsName
        }
        
        func getPetDetails() -> String{
            guard let petsName = petName, let petsAge = petAge, let ownerName = personName else{ return "Not all Details Set!" }
            return "This Pet Is Called '\(petsName)' : Which is '\(petsAge)' years old and the owner is '\(ownerName)'"
        }
    }
}

var person = WeakAndStrongObjects.Person()
person.personName = "Eric Mwenda"
var petHolder: String? = person.personName

var personsPet = WeakAndStrongObjects.Pet()
personsPet.personName = "Eric Mwenda"
personsPet.petName = "Cat"
var myCatsName = personsPet.petName
personsPet.petAge = 12
var myCatsAge = personsPet.petAge

personsPet.initialize(petName: "Catalissa", petAge:34)

var petDetails = personsPet.getPetDetails()
print(petDetails)

//Swift Closures - Basically Lambda Expressions.
//This is basically storing a funtion in a varible.
//This allows you to carry a function around the program as you would to a variable.
internal class Closure{
    
    func isNumberGreaterThanTenAndEven(_ number: Int) -> Bool{
        return number >= 10 && number % 2 == 0
    }
    
    //Writing the function as a closure.
    var isGreaterAndEvenLambda: (Int) -> Bool = { number in
        if number >= 10 && number % 2 == 0{
            return true
        }
        return false
    }
    
    var addTwoNumbers: (Int, Int) -> Int = {(firstNumber: Int, secondNumber: Int) -> Int in
        return firstNumber + secondNumber
    }
    
    //Closures can also be passed in as arguments in other functions.
    //Here's an example.
    /**
     the values of the parameters a and b in the closure passed to the sortArray function come from the elements of the array passed as the first argument to the function.

     The sortArray function takes two arguments, an array of integers array and a closure sort.
     The closure takes two integers as arguments, a and b and returns a boolean indicating whether a should be sorted before b or not.

     The sortArray function then calls the sorted(by:) method on the input array, passing the closure as an argument to it.

     When sorted(by:) method is called, it compares the elements in the array using the closure, in this case,
     the closure compares two integers passed to it (a and b) and returns true if a is less than b, false otherwise.
     This is how the array passed to the function is sorted.

     It's important to note that, the closure's parameters and return type are inferred from the function's signature,
     which is passed as an argument to the sortArray function.

     In the example, the closure is defined inline with the function call, but it can also be defined as a separate variable,
     this way it can be reused and passed to multiple functions.
     */
    func sortNumbers(_ array: [Int], _ sortLambda: (Int, Int) -> Bool ) -> [Int]{
        return array.sorted(by: sortLambda)
    }
    
    var sortDescending: (Int, Int) -> Bool = {a, b in
        return a > b
    }
    
    var sortAscending: (Int, Int) -> Bool = {(a: Int, b: Int) -> Bool in//you can just say 'a,b in'
        return a < b
    }
    
    var myArray = [4,454,3,54,34,23,5,3,5434,45,3,43]
    
    /**
     here's an example of a function called filterArray that takes an array of integers and a closure as parameters,
     and returns a new array containing only the elements that pass a certain test defined by the closure:
     */
    
    func filterArray(_ array:[Int], _ filter: (Int) -> Bool) -> [Int]{
        return array.filter(filter)
        //The filter(_:) method calls the closure for each element in the array, passing the element as a parameter to the closure.
        //If the closure returns true for an element, it's included in the filtered array, otherwise it's excluded.
    }
    
    /**
     The filter(_:) method calls the closure for each element in the array, passing the element as a parameter to the closure.
     If the closure returns true for an element, it's included in the filtered array, otherwise it's excluded.
     In this example, the closure checks if the element passed to it is even or not, by checking if the remainder of dividing the number by 2 is equal to 0.
     If it's true, the number is even and is included in the filtered array, otherwise it's excluded.

     This way, the filterArray function can be used to filter any array of integers based on a certain test defined by the closure passed as an argument.

     It's important to note that, in this example, the closure's parameters and return type are inferred from the function's signature,
     which is passed as an argument to the filterArray function.
     */
    var filterLambdaEven: (Int) -> Bool = { filterNumber in
        if filterNumber % 2 == 0{
            return true
        }
        return false
    }
    
    var filterLambdaOdd: (Int) -> Bool = { (filterNumber: Int) -> Bool in // Filter number comes from the array.filter()
        //the array.filter() function passes every number of the array to this function. then adds it to the new array if its odd.
        return filterNumber % 2 != 0
    }
    
}

let closure = Closure()
type(of: closure.isGreaterAndEvenLambda)
type(of: closure.addTwoNumbers)

let isGreaterAndEvenLambda: (Int) -> Bool = closure.isGreaterAndEvenLambda
var addFunction: (Int, Int) -> Int = Closure().addTwoNumbers
var lambdaSum: Int = addFunction(4344, 5453)

var isNumberGreaterThanTenAndEven = isGreaterAndEvenLambda(43)
isNumberGreaterThanTenAndEven = isGreaterAndEvenLambda(4)
isNumberGreaterThanTenAndEven = isGreaterAndEvenLambda(44)

var sortedAscending = closure.sortNumbers(closure.myArray, closure.sortAscending)
var sortedDescending = closure.sortNumbers(closure.myArray, closure.sortDescending)

var filteredArrayEven = closure.filterArray(closure.myArray, closure.filterLambdaEven)
var filteredArrayOdd = closure.filterArray(closure.myArray, closure.filterLambdaOdd)

//String Interpolation and string operation in swift.

private class Strings{
    internal var firstName: String
    internal var secondName: String
    internal var stringArray: [String]
    var stringPrinter: StringPrinter
    
    init(firstName: String, secondName: String){
        self.firstName = firstName
        self.secondName = secondName
        self.stringArray = [firstName, secondName]
        
        stringPrinter = StringPrinter(stringArray: stringArray)
    }
    
    internal class StringPrinter{
        private var stringArray: [String]
        
        init(stringArray: [String]){
            self.stringArray = stringArray
        }
        
        func PrintStrings(){
            for string in stringArray {
                print(string)
            }
        }
        
        //use String interpolation.
        func returnMyNames() -> String{
            return "My Name is '\(stringArray[0]) \(stringArray[1])'."
        }
    }
    
    internal class StringOperation{
        
        //String.count -> to return the number of characters in the string.
        func getNumberOfCharactersInTheString(string: String) -> Int{
            return string.count
        }
        
        //Substrings: You can use the substring(from:), substring(to:) and substring(with:) methods
        //to extract substrings from a string:
        func returnSubstringToCharacter(character: Character, myString: String) -> String{
            guard let index = myString.firstIndex(of: character) else {return "No Character Found."}
            
            let substring = myString[..<index]
            return String(substring)
        }
        
        //Comparison: You can use the ==, <, >, <=, and >= operators to compare strings for equality, like this:
        func compareTwoString(string1: String, string2: String) -> Bool{
            return string1 == string2
        }
        
        //Replacing: You can use the replacingOccurrences(of:with:) method
        //to replace occurrences of a substring with another substring,
        func replaceFirstStringWithSecond(firstString: String, secondString: String, sentence: String) -> String{
            var newString: String = sentence.replacingOccurrences(of: firstString, with: secondString)
            return newString
        }
        
        //Splitting: You can use the components(separatedBy:) method
        //to split a string into an array of substrings based on a separator
        func returnArraySeparatedBy(originalString: String, separatorCharacterSet: CharacterSet) -> [String]{
            var splitStrings: [String] = originalString.components(separatedBy: separatorCharacterSet)
            return splitStrings
        }

    }
    
    //EXTEND MORE ON SWIFT string operations.
    
}

private var printMyNames: () = Strings(firstName: "Gakenia", secondName: "Eric").stringPrinter.PrintStrings()
private var myIntro = Strings(firstName: "Eric", secondName: "Mwenda").stringPrinter.returnMyNames()

var substringToFirstQ = Strings.StringOperation()
    .returnSubstringToCharacter(character: "Q", myString: "I'm Eric WIth a Queen Her Name is Queen DM")
print(substringToFirstQ)

//Dictionaries and Arrays.

internal class DictionaryArrays{
    
    //Declare an int Array;
    //it's only made up of int values.
    var intAraay: [Int] = [43,543,4,544,34,45,4,45,34,54,3]
    
    //Decalare an Any Type Array.
    //This can comprise of various data types.
    /**
     t's important to note that, when working with arrays of type [Any], you need to be careful about the types of elements you are adding to the array,
     and you need to check the types before using them.
     This is because the array can store elements of any type, so you need to make sure that you are handling them correctly.

     Also, arrays of type [Any] are less type-safe than arrays of specific types.
     For example, if you have an array of type [Int],
     you can be sure that the array will only contain integers and you can perform integer-specific operations on its elements.
     On the other hand, with an array of type [Any], you need to check the type of each element before performing any operations on it.

     In general, it's recommended to use arrays of specific types instead of arrays of type [Any] whenever possible,
     because they are safer and more efficient. However, arrays of type [Any] can be useful in certain situations
     where you need to store elements of different types in the same array.
     */
    var anyArray: [Any] = [true, 1, "What The F", 343.44, [43,34,34], ["This", "is", "Cool"], "X", 43]

    
    //Dictionary; -> Contains a value and key. Very efficient when accessing elements.
    var artistSalesDictionary: [String: Int] = ["Ed Sheeran": 4334, "Shawn Mendes": 54344, "Taylor Swift": 34345]
    
    func printDictionaryValues(dictionary: [String: Int]){
        //Use for in loop to print. Output = (Key="Ed Sheeran", Value = 4334)
        for artistDictionary in dictionary{
            print(artistDictionary)
        }
        print()
        //specify key and value in the for loop declaration.
        for (artistName, artistSales) in dictionary{
            print("\(artistName) Has Sold : \(artistSales) Copies")
        }
    }
    
    func printAnyValueArray(anyValue: [Any]){
        for anyValue in anyArray{
            print(anyValue)
        }
    }
    
    func addAnyElementToArray(newElement: Any){
        anyArray.append(newElement)
    }
}

var dictionaryArrays: DictionaryArrays = DictionaryArrays()
print("Values of Any Array are:")
dictionaryArrays.printAnyValueArray(anyValue: dictionaryArrays.anyArray)
print("Values of Artists Dictionary are:")
dictionaryArrays.printDictionaryValues(dictionary: dictionaryArrays.artistSalesDictionary)
dictionaryArrays.addAnyElementToArray(newElement: "This is so damn Amazing. I have no idea. This looks like an ArrayList.")
dictionaryArrays.addAnyElementToArray(newElement: 43434)
dictionaryArrays.addAnyElementToArray(newElement: false)
dictionaryArrays.addAnyElementToArray(newElement: [1:"Eric", 2:"Mwenda", 3:"Gakenia"])
print("New Elements of Any Array Are:")
dictionaryArrays.printAnyValueArray(anyValue: dictionaryArrays.anyArray)

//Libraries and Frameworks -> External sources that we import to our application.
var myButton: UIButton = UIButton()//From UIKit.
//To Go to any definition of a function/class or framework you command and click.

//Naming conventions in swift.

/**
 camelCase -> First letter is small letter and any consecutive word forming starts with a capital letter.
    -used in variable names.
    -used in function names.
 
 snake_case -> Words are separated by an underscore. -> can be used in variable and function names too.
 
 PascalCase -> The First Letter is capital -> Consecutive word forming starts with a capital letter too.
    -used in Class Names.
    -used in Struct Names.
    -used in Protocl Names.
 
 Variable and constant names: Variable and constant names should start with a lowercase letter and use camel case
 (e.g. myVariable, myConstant)

 Function and method names: Function and method names should start with a lowercase letter and use camel case
 (e.g. myFunction(), myMethod()). For methods of a class, use the verbNoun format.

 Type names: Type names (e.g. structs, enums, classes) should start with a uppercase letter and use Pascal case
 (e.g. MyType, MyClass)

 Enum cases: Enum cases should start with a lowercase letter and use camel case
 (e.g. myCase, anotherCase)

 Boolean variable: Boolean variable should be named as a question or a statement,
 starting with is, has, should... (e.g. isValid, hasData)

 Properties and computed properties:
 Properties and computed properties should start with a lowercase letter and use camel case,
 and should avoid using prefixes like get or set (e.g. myProperty, myComputedProperty)

 Protocols: Protocol names should start with a uppercase letter and use Pascal case
 (e.g. MyProtocol, AnotherProtocol)

 Closures: Closure parameter names should be short, and start with a name that describes their role
 (e.g. data, error, completion)
 Closure names should start with a lowercase letter and use camel case
 (e.g. myClosure)
 Closure parameters names should be short, and start with a name that describes their role
 (e.g. data, error, completion)
 Closure parameter types should be explicit, and if possible, use the type inference
 Closure return type should be explicit, if the closure has a return statement,
 otherwise it could be ommitted or use Void

 Spacing: Swift code should use 4 spaces for indentation
 and there should be a space between the keyword and the opening parenthesis of a function or method
 (e.g. func myFunction())

 Comments: Comment should be added to the code to explain complex logic, algorithms,
 or to give an overview of the code.
 Comments should be written in a clear and concise language, and they should be aligned with the code they describe.
 */

//Type Aliases in Swift.
class TypeAlias{
    
    //For this closure we can use a type alias to represent the number returned as a Square type.
    typealias SquareNumber = Int
    typealias SquareClosure = (SquareNumber) -> SquareNumber//type alias for a closure.
    
    var mySquareClosure: (Int) -> SquareNumber = { number in
        return number * number
    }
    
    var doubleClosure: SquareClosure = { number in
        return number * 2
    }
    
    //Type aliases can come in handy in complex data structures such as dictionaries.
    //An Example that doesn't use type aliasing with a dictionary.
    var artistNameAndAge: [String : Int] = [:]//This is an empty dictionary literal.
    
    init(){
        artistNameAndAge = ["Ed Sheeran": 34, "Taylor Swift": 32, "Selena Gomez": 29, "Shawn Mendes": 27]
    }
    
    func printArtistData(artistNameAndAge: [String : Int]) -> Void{
        
        for (artistName, artistAge) in artistNameAndAge{
            print("\(artistName) is \(artistAge) years old.")
        }
    }
    
    //Using Type aliasing for the above.
    typealias ArtistData = [String : Int]
    func printArtistDataAlias(artistNameAndAge: ArtistData){
        for(artistName, artistAge) in artistNameAndAge{
            print("\(artistName) is \(artistAge) years old.")
        }
    }
    
    //Type aliases are normally put before the variables that define it.
    typealias CodeCheckAlias = (String, Int) -> Bool

    var checkCodeClosure: CodeCheckAlias = {(codeName:String, codeNumber: Int) in
        switch(codeName){
        case "WON"://if the case is won and code Number is even: return true.
            if(codeNumber % 2 == 0){
                return true
            }
            return false
        case "PROMO"://if the case is promo and code number is greater than 100 return true.
            return codeNumber > 1000
        default:
            return false
        }
    }
    
    
    func isCodeValid(codeName: String, codeNumber: Int) -> Bool{
        
        //use the values passed in as parameters to call the check code closure.
        return checkCodeClosure(codeName, codeNumber)
    }
    
}

var squareNumber = TypeAlias().mySquareClosure
type(of: squareNumber)
squareNumber(3443)
var doubleNumber: Int = TypeAlias().doubleClosure(45)

TypeAlias().printArtistData(artistNameAndAge: TypeAlias().artistNameAndAge)

var isCodeValid1: Bool = TypeAlias().isCodeValid(codeName: "MyCard", codeNumber: 4343)//false
var isCodeValid2: Bool = TypeAlias().isCodeValid(codeName: "WON", codeNumber: 4343)//false
var isCodeValid3: Bool = TypeAlias().isCodeValid(codeName: "WON", codeNumber: 4342)//true
var isCodeValid4: Bool = TypeAlias().isCodeValid(codeName: "PROMO", codeNumber: 4342)//true

//Swift Ternary Operator and return statement.
class TernaryAndReturn{
    
    func nthFibonacciSumRecursion(_ nthNumber: Int) -> Int{
        //base case.
        
        return nthNumber > 1 ? nthFibonacciSumRecursion(nthNumber - 2) + nthFibonacciSumRecursion(nthNumber - 1) : nthNumber
    }
}

var fibonacci = TernaryAndReturn().nthFibonacciSumRecursion(9)

//Some swift math functions.
class MathFunctions{
    
    /**
     Swift provides a set of built-in math functions that can be used to perform common mathematical operations,
     such as addition, subtraction, multiplication, and division. Here are some examples of math functions in Swift:

     + operator: This operator is used for addition. For example, 1 + 2 returns 3.

     - operator: This operator is used for subtraction. For example, 5 - 2 returns 3.

     * operator: This operator is used for multiplication. For example, 3 * 4 returns 12.

     / operator: This operator is used for division. For example, 8 / 2 returns 4.

     % operator: This operator is used for finding the remainder of a division.
     For example, 8 % 3 returns 2.
     
     These are just some examples of math functions in Swift, and there are many more functions available in the Swift standard library
     and in external libraries that can be used for more advanced mathematical operations.

     It's worth noting that, when working with floating-point numbers, you should be aware of the limitations of floating-point arithmetic,
     and you should consider using the Decimal type, which provides more precision than Float or Double
     */
    
    //pow() function: This function is used to find the power of a number.
    //For example, pow(2,3) returns 8.
    static func powerOfNumberBy(number: Double, power: Int) -> Double{
        return pow(number, Double(power))
    }
    
    //abs() function: This function is used to find the absolute value of a number.
    //For example, abs(-5) returns 5.
    static func absoluteValueOf(number: Int) -> Int{
        return abs(number)
    }
    
    //sqrt() function: This function is used to find the square root of a number.
    //For example, sqrt(16) returns 4.
    static func squareRootOf(number: Double) -> Double{
        return sqrt(number)
    }
    
    //max() function: This function is used to find the maximum value of two or more numbers.
    //For example, max(5, 10, 3) returns 10.
    static func largestNumberIn(_ firstNumber: Int, _ secondNumber: Int, _ thirdNumber: Int) -> Int{
        return max(firstNumber, secondNumber, thirdNumber)
    }
    
    //min() function: This function is used to find the minimum value of two or more numbers.
    //For example, min(5, 10, 3) returns 3.
    static func smallestNumberIn(_ firstNumber: Int, _ secondNumber: Int, _ thirdNumber: Int) -> Int{
        return min(firstNumber, secondNumber, thirdNumber)
    }
    
    //ceil() function: This function is used to round a decimal number up to the nearest whole number.
    //For example, ceil(3.14) returns 4.
    static func roundUpNumber(number: Double) -> Double{
        return ceil(Double(number))
    }
    
    //round() function: This function is used to round a decimal number to the nearest whole number.
    //For example, round(3.14) returns 3.
    static func roundToNearestWholeNumber(number: Double) -> Double{
        return round(number)
    }
    
    //floor() function: This function is used to round a decimal number down to the nearest whole number.
    //For example, floor(3.14) returns 3.
    static func roundDownNumber(number: Double) -> Double{
        return floor(number)
    }
}

var powerNumber = MathFunctions.powerOfNumberBy(number: 34, power: 5)
var powerConfirmation = 34*34*34*34*34

var maxNumber = MathFunctions.largestNumberIn(431, 5455, 54)
var roundDownNumber = MathFunctions.roundDownNumber(number: 4343.9)//4343
var roundUpNumber = MathFunctions.roundUpNumber(number: 4343.9)//4344
var roundToNearestWholeNumber = MathFunctions.roundToNearestWholeNumber(number: 4343.9)//4344
var squareRoot = MathFunctions.squareRootOf(number: 434.3447)//20.84093807869502

//Basic searching and sorting in swift.
class SearchingAndSorting{
    
    //Linear Search -> I'll use a closure for this.
    typealias LinearSearchAlias = (Int, [Int]) -> Bool
    private var isNumberPresentLinearSearchClosure: LinearSearchAlias = { (searchNumber: Int, numberArray: [Int]) in
        for number in numberArray{
            if number == searchNumber{
                return true
            }
        }
        return false
    }
    
    func isNumberPresent(numberToSearch: Int, numberArray: [Int]) -> Bool{
        return isNumberPresentLinearSearchClosure(numberToSearch, numberArray)
    }
    
    typealias SortArrayAlias = (inout [Int]) -> [Int]
    internal var sortArrayClosure: SortArrayAlias = {(numbersArray: inout [Int]) in
        for i in 0..<numbersArray.count{
            for j in 1..<numbersArray.count - i{
                if(numbersArray[j] < numbersArray[j - 1]){
                    var temp = numbersArray[j]
                    numbersArray[j] = numbersArray[j - 1]
                    numbersArray[j-1] = temp
                }
            }
        }
        return numbersArray
    }
    
    func mergeSort(array: inout [Int], leftIndex: inout Int, rightIndex: inout Int) -> [Int]{
        //The initial values of left and right index as they get in the function is 0 and array.count-1
        //print("Original Array Size is = \(array.count)")
        print("right index value = \(rightIndex) : Left Index Value = \(leftIndex) : Array Size = \(array.count)")
        guard array.count > 1 else {return array}
        
        if(leftIndex < rightIndex){
            //Find the Middle Pint.
            var middlePoint = leftIndex + (rightIndex - leftIndex) / 2
            var leftIndexRightHalf = middlePoint + 1
            
            //Sort the first and the Second halves recursively.
            mergeSort(array: &array, leftIndex: &leftIndex, rightIndex: &middlePoint)//This will be used to sort the first half.
            mergeSort(array: &array, leftIndex: &leftIndexRightHalf, rightIndex: &rightIndex)//to sort right half.
            
            //Now merge the 2 sorted halves.
            mergeArray(&array, &leftIndex, &middlePoint, &rightIndex)
        }
        //By this point the entire array has been sorted.
        //Complexity of this algorithm in all cases is (0(n log n))
        return array
    }
    
    func mergeArray(_ array: inout [Int], _ leftIndex: inout Int, _ middlePoint: inout Int, _ rightIndex: inout Int){
        //find the size of the 2 sub arrays to be merged.
        var leftHalfSize: Int = middlePoint - leftIndex + 1
        var rightHalfSize: Int = rightIndex - middlePoint
    
        //Create Temporary arrays to be filled for both halves.
        var leftHalfArray: [Int] = [Int]()
        leftHalfArray.reserveCapacity(leftHalfSize)//You can set this or not. -> In swift that is . But in C# YOU MUST!
        var rightHalfArray: [Int] = []
        rightHalfArray.reserveCapacity(rightHalfSize)
        print("AAAA")
        print("Left Half Capacity = \(leftHalfArray.count):\(leftHalfSize) Right Half Capacity = \(rightHalfArray.count):\(rightHalfSize)")
        
        //Copy the data into the empty temporary arrays.
        for i in 0..<leftHalfSize{
            leftHalfArray[i] = array[leftIndex + i]
        }
        for j in 0..<rightHalfSize{
            rightHalfArray[j] = array[middlePoint + 1 + j]
        }
        print("BBBB")
        //Merge the temporary arrays now.
        
        //initial indexes of the first and second temporary arrays.
        var leftIndex: Int = 0
        var rightIndex: Int = 0
        
        //initial index of the merged array.
        var mergedIndex: Int = 0
        
        while(leftIndex < leftHalfSize && rightIndex < rightHalfSize){
            
            if(leftHalfArray[leftIndex] <= rightHalfArray[rightIndex]){
                array[mergedIndex] = leftHalfArray[leftIndex]
                leftIndex += 1
            }else{
                array[mergedIndex] = rightHalfArray[rightIndex]
                rightIndex += 1
            }
            mergedIndex += 1
        }
        
        print("CCCC")
        
        //Copy remaining elements of LeftArray if Any exist
        while(leftIndex < leftHalfSize){
            array[mergedIndex] = leftHalfArray[leftIndex]
            leftIndex += 1
            mergedIndex += 1
        }
        print("DDDD")
        //Copy remaining elements of the rightArray if any exist.
        while(rightIndex < rightHalfSize){
            array[mergedIndex] = rightHalfArray[rightIndex]
            rightIndex += 1
            mergedIndex += 1
        }
        print("EEEE")
    }
    
    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        return merge(leftArray: leftArray, rightArray: rightArray)
    }

    func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedArray: [Int] = []

        while leftIndex < leftArray.count && rightIndex < rightArray.count {
            let leftElement = leftArray[leftIndex]
            let rightElement = rightArray[rightIndex]
            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
        while leftIndex < leftArray.count {
            orderedArray.append(leftArray[leftIndex])
            leftIndex += 1
        }
        while rightIndex < rightArray.count {
            orderedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }

        return orderedArray
    }
    
    // Insertion Sorting Algorithm
    func insertionSort(_ array: inout [Int]) {
        for i in 1..<array.count {
            let currentValue = array[i]
            var j = i - 1
            while j >= 0 && array[j] > currentValue {
                array[j + 1] = array[j]
                j -= 1
            }
            array[j + 1] = currentValue
        }
    }
    
    
}

var numberArray = [45454, 544,34,34,54,2,464,54656,35,4,3,655,45,4,344,65,4556]
//var isNumberPresent = SearchingAndSorting().isNumberPresent(numberToSearch: 545, numberArray: numberArray)//false

type(of: SearchingAndSorting().sortArrayClosure)
var initialLeftIndex = 0
var initialRightIndex = numberArray.count - 1

//var mergeSortedArray: [Int] = SearchingAndSorting().mergeSort(array: &numberArray, leftIndex: &initialLeftIndex , rightIndex: &initialRightIndex)
//print("Merge Sorted Number Array is : \(SearchingAndSorting().mergeSort(array: &numberArray, leftIndex: 0, rightIndex: numberArray.count-1))")
//print("Sorted Numbers Array is : \(SearchingAndSorting().sortArrayClosure(&numberArray))")

var arrayMergeSorted: [Int] = SearchingAndSorting().mergeSort(numberArray)
print(arrayMergeSorted)
