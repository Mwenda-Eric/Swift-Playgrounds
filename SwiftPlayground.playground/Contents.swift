import UIKit
import Foundation

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

class Eric{
    static let myAge: Int = 99
    let myIdNumber: Int = 1111111111
    static let myFirstName: String = "Eric"
    var myLastName: String = "Mwenda"
    static let isAdult: Bool = true
    var salary: Double = 450000004343934.3454
    var mpesaBalance: Float = 343493849.004332382
}

var me: Eric = Eric()//Overall object to reference the non static variables.

var myAge = Eric.myAge
var myIdNumber = me.myIdNumber
var myFirstName = Eric.myFirstName
var myLastName = me.myLastName
var amIAnAdult: Bool = Eric.isAdult
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
        var myString: String = ""
        var myInt: Int = 0
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
            var splitStrings: [String] = originalString.components(separatedBy: separatorCharacter)
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
