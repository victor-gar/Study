import Foundation

struct Servic {
    var name: String
    var volume: Int
}

extension Servic: CustomStringConvertible {
    var description : String {
        return "Название: \(name), Объем: \(volume)"
    }
}


struct queue <T> {
    private var elements: [T] = []
    
    public var isEmpty: Bool {
        return elements.count == 0
    }
    
    mutating func enqueue(element: T) {
        elements.append(element)
    }
    mutating func dequeue()->T {
        return elements.removeLast()
    }
    
    public var head: T? {
        if isEmpty {
            print("Элементы не найдены. Массив пуст.")
            return nil
        } else {
            print("Последний элемент \(elements.last!)")
            return elements.last
        }
    }
    
    public var front: T? {
        if isEmpty {
            print("Элементы не найдены. Массив пуст.")
            return nil
        } else {
            print("Первый элемент \(elements.first!)")
            return elements.first
        }
    }
    
    func printMyQueue() {
        print(elements)
    }
}

extension queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

var car = queue<Servic>()
car.enqueue(element: .init(name: "Alice", volume: 4))

car.printMyQueue()
car.head
car.front

let carServic = car.myFilter(predicate: {$0.volume == 5})
print(carServic)

class Cars{
     
    var name: String
    init (name: String){
         
        self.name = name
    }
}
class AutoRoom{   
     
    var cars: [Cars] = [Cars]()
     
    init(){
         
        cars.append(Cars(name: "Vaz"))
        cars.append(Cars(name: "BMW"))
        cars.append(Cars(name: "Audi"))
    }
     
    subscript(index: Int) -> Cars{
         
        get{
            return cars[index]
        }
        set(newValue){
            cars[index] = newValue
        }
    }
}
 
var myAutoroom: AutoRoom = AutoRoom()
var firstcars: Cars = myAutoroom[0]
print(firstcars.name)
 
myAutoroom[2] = Cars(name: "Lambo")
print(myAutoroom[2].name)
