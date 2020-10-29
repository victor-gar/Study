import Foundation

protocol fullNameOfObject {
    var fullName : String {get}
}
extension fullNameOfObject {
    var release : Int {return self as! Int}
}

class Car: fullNameOfObject {
    var brand: String
    var model: String
    var release: Int

    init(brand: String, model: String, release: Int) {
        self.brand = brand
        self.model = model
        self.release = release
    }
var fullName: String {
 return (brand + " ") + model
    }
}

let myCar = Car(brand: "Volkswagen", model: "polo", release: 2015)
print(myCar.fullName)
extension Car: CustomStringConvertible
{
    var description: String
    {
        return "Моя машина - \(fullName), Год выпуска:\(release)"
              
    }
}
print(myCar.description)




