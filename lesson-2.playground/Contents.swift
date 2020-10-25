//Задание 1
import Foundation
let a = 1
if (a%2==0)
{
print("Число -",a," четное")
}
else
{
print("Число -", a," нечетное")
}
//Задание 2
func b(value: Int)
{
    let b1 = value
    let b2 = b1%3
    _ = b2 == 0 ? print("true"): print("false")
}
b(value: 10
)
//Задание 3
var array = [Int]()
var x = 0
while x<100 {
array.append(x+1)
x+=1
//print(x)
}

//Задание 4
for element in array where (element % 2 == 0) || (element % 3 == 0)
{
  array.remove(at: (array.index(of:element)!))
 print(element)
}
//Задание 5
func fibonacci (n: Int) -> (Decimal) {
    if (n<3) {
        return 1
    } else {
        var z1 : Decimal = 1, z2 : Decimal = 1, z:Decimal
        for _ in 3...n {
            z = z1+z2
            z1 = z2
            z2 = z
        }
        return z2
    }
}

var fibArray = [Decimal]()
fibArray.append(0)
var n  = 100
for i in 1...n {
    fibArray.append(fibonacci(n: i))
}
print(fibArray)


//Задние 6
func Prime (num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
func PrimeArray () -> [Int] {
    var results = [Int]()
    var i = 2
    while results.count < 100 {
        if Prime(num: i) {
            results.append(i)
        }
        i += 1
    }
    
    return results
}
print (PrimeArray())

