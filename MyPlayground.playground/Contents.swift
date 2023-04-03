import UIKit

var greeting = "Hello, playground"

var i : Int
i = 3

if i>3 { print("3이상")}
else if i == 3 { print("3입니다")}

var list = [String]()

list.append("a")
list.append("b")
list.insert("f", at: 1)
list.append(contentsOf: ["c","d"])
print(list)

var person: (name: String, age: Int, weight: Double) = ("Song", 26, 60.5)
print("이름 : \(person.name), 나이 : \(person.age), 몸무게 = \(person.weight)")
//또는
print("이름 : \(person.0), 나이 : \(person.1), 몸무게 = \(person.2)")

person.0 = "Kim"
person.1 = 27
person.weight = 70

print("이름 : \(person.0), 나이 : \(person.1), 몸무게 = \(person.2)")

print(Int("aaa"))

let optInt = Int("123")
if (optInt != nil) {
    if(optInt == 123) {
        print("optInt == 123")
    }
    else {
    print("optInt != 123")
    }
}

func printHellowithName(n1 name: String, msg2 welcomeMsg: String) -> Void {
    print("\(name)님, \(welcomeMsg)")
}

printHellowithName( n1 : "Song", msg2 : "안녕하세요")

func sampleFunc(_ name : String) -> Void {
    print(name)
    return
}
sampleFunc("hello")

func Example( n1 name : String, msg1 Message : String, a1 age : Int = 20) -> Void {
    print("\(name),\(age) : \(Message)")
}
Example(n1 : "Song", msg1: "Hello")
func sayHelloFriends(from me: String, to friendNames: String...) -> String{
    var result : String = ""
    for friendName in friendNames {
        result += "Hello \(friendName)!"
    }
    result += "I'm \(me)."
    return result
}

print(sayHelloFriends( from : "Song", to : "sim", "jung", "lee"))


func sayHi( name : String, completion : () -> Void) {
    print("SayHi! \(name)")
    //sleep(2)
    completion()
}



sayHi(name: "Song") { () -> () in
    print("2초가 지났습니다.")
}

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    print(runningTotal)
    func incrementer() -> Int {
        runningTotal += amount
        print(runningTotal)
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30


outer: for i in 1...5 {
    inner: for j in 1...9 {
        if(j==3){ break outer}
        print("\(i) * \(j) = \(i*j)")
    }
   
}

var dict1 = ["height": 165, "age" : 100]

for (key, value) in dict1 {
    print("현재 데이터는 \(key) : \(value)입니다.")
}
func Example() {
    var num : Int = 0
    print("num check #1 = \(num)")

    let closure = { [num] in
        print("num check #3 = \(num)")
        //num = 2 - 이러면 오류 / Const기 때문
    }
    num = 20
    print("num check #2 = \(num)")
    closure()
}

Example()

var tpl1 : (Int, Int) = (100, 200)

var (a ,b) = tpl1


print(type(of: a))

var person2 : (name : String, age: Int, weight : Double) = ("Song", 26, 11)

var (gg, gg2, gg3) = person2

print(type(of: gg), type(of: gg2), type(of: gg3))

print(gg,gg2,gg3)


func funrep( name : inout String) {
    name = "Change"
    
    
}

var outname = "outname"
funrep(name: &outname)
print(outname)


var optemp : String? = "string"

print(optemp!)

struct Resolution {
    var width = 0
    var height = 0

    func desc() -> String {
        return "Resolution 구조체"
    }
}

class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    var resolution : Resolution = Resolution()

    func desc() -> String {
        return "VideoMode 클래스"
    }
}

let vMode = VideoMode()
print("vMode 인스턴스의 width 값은 \(vMode.resolution.width)")


var newCap = [String : String]()
newCap["JP"] = "Tokyo"
newCap.updateValue("Seoul", forKey: "KR")
print(newCap)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema 인스턴스의 width : \(cinema.width)")
print("hd 인스턴스의 width : \(hd.width)")

let video = VideoMode()
video.name = "Original Video Instance"
print("video 인스턴스의 name : \(video.name)")

let dvd = video
dvd.name = "DVD Video Instance"
print("video 인스턴스의 name : \(video.name)")

print(dvd === video)


struct fiexedlength {
    var startV : Int
    
    let length : Int
}

struct flexiblelength {
    let startV : Int
    
    var length : Int
}

var rangeOffFiexed = fiexedlength(startV: 0, length: 3)
rangeOffFiexed.startV = 4

var rangeOffFlexible = flexiblelength(startV: 0, length: 3)
rangeOffFlexible.length = 5


let constantOfInstance = fiexedlength(startV: 3, length: 4)
//constantOfInstance.startV = 0 let 오류

var variableOfInstance = fiexedlength(startV: 3, length: 4)
variableOfInstance.startV = 0
//variableOfInstance.length = 3 let 오류

class onCreate {
    init() {
        print("OnCreate!")
    }
}

class LazyTest {
    var base = 0
    lazy var late = onCreate()
    init() {
        print("LazyTest")
    }
}

let ls = LazyTest()
ls.late


struct Position {
    
    var x : Double = 0.0
    var y : Double = 0.0
    
}

struct Size1 {
    
    var width : Double = 0.0
    var height : Double = 0.0
    
}

struct Rect {
    
    var origin = Position()
    
    var size = Size1()
    
    var center1 : Position {
        get{
            let centerx = self.origin.x + (self.size.width / 2)
            let centery = self.origin.y + (self.size.height / 2)
            return Position(x: centerx, y: centery)
        }
        set(newCenter){
            self.origin.x = newCenter.x - (size.width / 2)
            self.origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Position(x: 0.0, y: 0.0), size: Size1(width: 10.0, height: 10.0))
print("square.centerx : \(square.center1.x), square.centery : \(square.center1.y)")

square.center1 = Position(x: 20.0, y: 20.0)
print("squard.originx : \(square.origin.x), squard.originy : \(square.origin.y)")


struct Job {
    var income : Int = 0 {
        willSet(newIncome) {
            print("이번 달 월급은 \(newIncome)원입니다.")
        }
        didSet{
            if income > oldValue {
                print("축하합니다. 월급이 \(income - oldValue)원 증가하셨네요.")
            }
            else if income == oldValue {
                print("저번달과 월급이 같네요")
            }
            else {
                print("힙내세요. 월급이 \(oldValue - income)원 삭감되었네요.")
            }
        }
    }
}

var job = Job(income : 1000000)
job.income = 2000000

job.income = 1500000


struct Foo {
    //타입 저장 프로퍼티
    static var sFoo = "구조체 타입 프로퍼티값"
    
    //타입 연산 프로퍼티
    static var cFoo : Int {
        return 1
    }
}

class Boo {
    //타입 저장 프로퍼티
    static var sFoo = "클래스 타입 프로퍼티값"
    
    //타입 연산 프로퍼티
    static var cFoo : Int {
        return 10
    }
    
    //재정의 가능 타입연산 프로퍼티
    class var oFoo : Int {
        return 100
    }
}

print(Foo.sFoo)


Foo.sFoo = "새로운 값"
print(Foo.sFoo)


print(Boo.sFoo)

print(Boo.cFoo)

var NF = Foo()
//print(NF.cFoo)

struct Resolution2 {
    
    var width = 0
    var height = 0
    
    func desc() -> String {
        let desc = "해상도 가로: \(self.width), 세로: \(self.height)"
        return desc
    }
    
}

class VideoMode2 {
    var resolution2 = Resolution2()
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    
    func desc() -> String {
        if self.name != nil {
            let desc = "\(self.name!)의 프레임 비율 : \(self.frameRate)"
            return desc
        }
        else {
            let desc = "프레임 비율 : \(self.frameRate)"
            return desc
        }
    }
}

class Counter {
    
    var count = 0
    
    func increment() {
        
        self.count += 1;
    }
    
    func incrementBy(amount : Int) {
        
        self.count += amount
    }
    
    func reset() {
        
        self.count = 0
    }
}

let counter = Counter()
print(counter.count)

counter.increment()
print(counter.count)

counter.incrementBy(amount: 5)
print(counter.count)

counter.reset()
print(counter.count)

struct sCounter {
    var count = 0
    
    mutating func increment() {
        
        count += 1
    }
    
    mutating func incrementBy(amount : Int) {
        
        count += amount
    }
    
    mutating func reset() {
        
        count = 0
    }
}
var scounter = sCounter()
print(scounter.count)

scounter.increment()
print(scounter.count)

scounter.incrementBy(amount: 5)
print(scounter.count)

scounter.reset()
print(counter.count)

class A {
    var name = "Class A"
    
    var description : String {
        return "This class name is \(self.name)"
    }
    
    func foo() {
        print("\(self.name)'s method foo is called")
    }
}

class B : A {
    var prop = "Class B"
    
    func boo() -> String{
        return "Class B prop = \(self.prop)"
    }
}

let bb = B()
bb.prop
bb.boo()

bb.name
bb.foo()

bb.name = "Change"
bb.foo()


class Vehicle{
    var currentspeed = 0.0
    
    var description : String {
        return "시간당 \(self.currentspeed)의 속도로 이동하고 있습니다."
    }
    
    func MakeNoise() {
        
    }
}

let baseVehicle = Vehicle()
baseVehicle.description

class Bicycle : Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentspeed = 20.0
print("자전거 : \(bicycle.description)")

class Tandem : Bicycle {
    var passenger = 0
}

let tandem = Tandem()

tandem.hasBasket = true
tandem.passenger = 2
tandem.currentspeed = 14.0

print("tandem : \(tandem.description)")


class Car : Vehicle {
    
    var gear = 0
    var engineLevel = 0
    
    override var currentspeed: Double{
        
        get {
            return Double(self.engineLevel * 50)
        }
        set {
            
        }
    }
    
    override var description: String{
        get {
            return "Car : engineLevel = \(self.engineLevel), so currentSpeed= \(self.currentspeed)"
        }
        set {
            print("New Value is \(newValue)")
            
        }
    }
    
   
}

let c = Car()
c.engineLevel = 5
c.currentspeed
c.description = "New Class Car"
print(c.description)

class AutomaticCar : Car{
    override var currentspeed : Double {
        didSet{
            self.gear = Int(currentspeed / 10.0) + 1
        }
    }
}

class Bike : Vehicle {
    override func MakeNoise() {
        print("빠라바라바라밤")
    }
}

let bk = Bike()
bk.MakeNoise()

class Test2 {
    func Say() {
        print("Say Hi")
    }
}
class Test3 : Test2 {
    override func Say() {
        print("Say Hello")
    }
    func SuperSay() {
        super.Say()
    }
}
var tt = Test3()
tt.Say()
tt.SuperSay()

var tt2 : Test2 = Test3()
print(type(of: tt2))
tt2 = Test2()
print(type(of: tt2))
tt2 = Test3()
print(type(of: tt2))


class Vehicle2 {
    var currentSpeed = 0.0
    
    func accelerate() {
        self.currentSpeed += 1
    }
}

class Car2 : Vehicle2 {
    var gear : Int {
        return Int(self.currentSpeed / 20) + 1
    }
    
    func wiper() {
        
    }
}

class SUV2 : Car2 {
        var fourWheel = false
}


let trans : Vehicle2 = Car2()


var allCar : AnyObject = Car2()
allCar = SUV2()

func move(param : AnyObject) ->AnyObject {
    return param
}

move(param: Car2())
move(param: Vehicle2())

var list12 = [AnyObject]()
list12.append(Vehicle2())
list12.append(Car2())
list12.append(SUV2())

let obj : AnyObject = SUV2()

if let SUV = obj as? SUV2 {
    print("\(SUV) 캐스팅 성공")
}


var value : Any = "Sample String"
value = 3
value = false
value = {() in print("함수 실행")}
value = [1,3,5,7,9]

func name(param:Any) {
    print("\(param)")
}

name(param: 3)
name(param: false)
name(param: [1,2,3,4,5])
name(param: {() in print(">>>")})

var lst = [Any]()
lst.append(3)
lst.append(false)
lst.append([1,3,4,6,7])
lst.append({() in print(">>>")})


struct Resolution3 {
    var width = 0
    var height = 0
    
    init(width : Int) {
        self.width = width
    }
}

class VideoMode3 {
    var resolution = Resolution3(width : 2048)
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    
    init(name : String) {
        self.name = name
    }
    
    init(interlaced : Bool) {
        self.interlaced = interlaced
    }
    
    init(interlaced : Bool , frameRate : Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
    
    init(name : String, interlaced : Bool, frameRate : Double) {
        self.name = name
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
}

let resolution3 = Resolution3(width: 2048)
let videomode3 = VideoMode3(interlaced: true, frameRate: 40.0)

let nameVM = VideoMode3(name: "홍길동")
let simpleVM = VideoMode3(interlaced: true)
let doubleVM = VideoMode3(interlaced: true, frameRate: 40.0)
let tripleVM = VideoMode3(name: "홀길동", interlaced: true, frameRate: 40.0)

class Base {

    var baseValue : Double
    
    init(inputValue : Double) {
        self.baseValue = inputValue
    }
}

class ExBase : Base {
    override init(inputValue : Double) {
        super.init(inputValue: inputValue)
        
    }
}

let eb = ExBase(inputValue: 10.0)

print(eb.baseValue)

struct Human {
    var name : String?
    var man : Bool = true
}

struct Company {
    var ceo : Human?
    var companyname : String?
    func getCEO() -> Human? {
        return self.ceo
    }
    
}

var startup : Company? = Company(ceo: Human(name: "대표", man: true), companyname: "회사")

if let company = startup {
    if let human = company.ceo {
        if let name = human.name {
            print("대표이사의 이름은 \(name) 입니다.")
        }
    }
}

let name2 = startup?.getCEO()?.name
if name2 != nil {
    print("대표이사의 이름은 \(name2!) 입니다.")
}

enum Direction {
    case North
    case South
    case East, West
}

var temptest = Direction.East
Direction.North
Direction.South
Direction.West
print(temptest)
temptest = .North

enum HTTPCode : Int {
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
}

HTTPCode.OK.rawValue
HTTPCode.NOT_MODIFY.rawValue
HTTPCode.INCORRECT_PAGE.rawValue
HTTPCode.SERVER_ERROR.rawValue

enum ImageFormat{
    case JPEG
    case PNG(Bool)
    case GIF(Int, Bool)
}

var newImage = ImageFormat.PNG(true)
newImage = .GIF(256, false)
print(newImage)


extension Double {
    var km : Double {return self * 1_000.0}
    var m : Double { return self}
    var cm : Double {return self / 100.0}
    var mm : Double{ return self / 1_000.0}
    var description1 : String {
        return "\(self)km는 \(self.km)m, \(self)cm는 \(self.cm)m, \(self)mm는 \(self.mm)m입니다."
    }
}

2.km
5.5.cm
125.mm
7.0.description
print(7.0.description1)


extension Int {
    func repetitions(task : () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    
    mutating func square1() {
        self = self * self
    }
}

let d = 3
3.repetitions() {
    print("Hello")
}

//d.square1()
//3,square1()
var ll = 3
ll.square1()
print(ll)


protocol SamplePropProtocol {
    var name : String { get set }
    var description : String { get }
}

struct PropertyProtocolImp1 : SamplePropProtocol {
    var name = "홍길동"
    var description: String {
        return "Name : \(self.name)"
    }
}

protocol SampleMethodProtocol {
    mutating func execute(cmd : String)
    func showPort(p : Int) -> String
}

struct Process : SampleMethodProtocol {
    
    var paramCommand : String?
    
    mutating func execute(cmd: String) {
        self.paramCommand = cmd
        
        if cmd == "start" {
            print("실행합니다.")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p)"
    }
}


struct Process2 : SampleMethodProtocol {
    
    
    
    func execute(cmd: String) {
      
        
        if cmd == "start" {
            print("실행합니다.")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p)"
    }
}

protocol SomeInitProtocol {
    init()
    init(cmd : String)
}


struct StructInit : SomeInitProtocol {
    var cmd : String
    
    init(){
        self.cmd = "start"
    }
    init(cmd : String) {
        self.cmd = cmd
    }
}

class ClassInit : SomeInitProtocol {
    var cmd : String
    
    required init() {
        self.cmd = "start"
        
    }
    
    required init(cmd: String) {
        self.cmd = cmd
    }
}

protocol Init {
    init()
}

class Parent {
    init() {
        
    }
}

class Child : Parent, Init {
    required override init() {
        
    }
}


protocol Wheel {
    func spin()
    func hold()
}

class Bicycle2 : Wheel {
    var moveState = false
    
    func spin() {
        self.pedal()
    }
    func hold() {
        self.pullBreak()
    }
    func pedal() {
        self.moveState = true
    }
    func pullBreak() {
        self.moveState = false
    }
}

let testTrans = Bicycle2()
testTrans.moveState
testTrans.pedal()
testTrans.pullBreak()
testTrans.spin()
testTrans.hold()

let testTrans2 :Wheel = Bicycle2()
testTrans2.spin()
testTrans2.hold()


protocol FuelPumpDelegate : class {
    func lackFuel()
    func fullFuel()
}

class FuelPump {
    var maxGage : Double = 100.0
    weak var delegate : FuelPumpDelegate? = nil
    
    var fuelGage : Double {
        didSet {
            if oldValue < 10 {
                self.delegate?.lackFuel()
            }
            else if oldValue == self.maxGage {
                self.delegate?.fullFuel()
            }
        }
    }
    
    init(fuelGage : Double = 0) {
        self.fuelGage = fuelGage
    }
    
    func startPump() {
        while (true) {
            if (self.fuelGage > 0) {
                self.jetFuel()
            }
            else {
                break
            }
        }
    }
    
    func jetFuel() {
        self.fuelGage -= 1
    }
}

class Car3 : FuelPumpDelegate {
    
    
    var fuelPump = FuelPump(fuelGage: 100)
    
    init() {
        self.fuelPump.delegate = self
    }
    func lackFuel() {
        print("연료 보충 중단")
    }
    
    func fullFuel() {
        print("연료 보충")
    }
    
    func start() {
        func start() {
            fuelPump.startPump()
        }
    }
}

class Man {
    var name : String?
    
    init(name : String = "홍길동") {
        self.name = name
    }
}

protocol Job12 {
    func doWork()
}

extension Man : Job12 {
    func doWork() {
        print("\(self.name!)님이 일합니다.")
    }
}

let mm = Man(name: "개발자")
mm.doWork()

protocol A3 {
    func doA()
}

protocol B3 {
    func doB()
}

protocol C3 : A3, B3 {
    func doC()
}

class ABC3 : C3 {
    
    func doC() {
        
    }
    
    func doA() {
        
    }
    
    func doB() {
        
    }
}


class copytest {
    var num = 0;
    
    func getnum(a : Int) -> Void {
        self.num = a
    }
}

func iscopy(aa : copytest) -> Void {
    aa.getnum(a: 5)
}
var ct = copytest()
print(ct.num)
iscopy(aa: ct)


print(ct.num)


print(video.frameRate)

dvd.frameRate = 5.5
print(dvd.frameRate)
print(video.frameRate)





//testTrans2.pedal()

class AB : A3, B3 {
    func doA() {
        
    }
    func doB() {
        
    }
    deinit {
        print("bye")
    }
}
class C : A3 {
    func doA() {
        
    }
}

var ipl : A3 & B3
ipl = AB()

ipl.doB()

var tem2 : AB? = AB()
tem2!.doA()

tem2 = nil

