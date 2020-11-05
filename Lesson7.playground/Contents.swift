import Foundation
enum CreditCardOperationError: Error {
    
    case insufficientFunds (moneyNeeded: Double)
    
    case frozenBalance
}

struct thing {
    var price: Double
}


class CreditCardOperation {
    
    let limit: Double = -30000
    
    var balance: Double = 0
    
    var cardIsBlocked = false
    
    
    func buySomethig(thing: thing)throws {
        guard cardIsBlocked == false else{
            throw CreditCardOperationError.frozenBalance
        }
        
        guard thing.price <= (-limit + self.balance) else {
            
            if balance < 0 {
                throw CreditCardOperationError.insufficientFunds(moneyNeeded: thing.price + limit + balance)
            } else {
                throw CreditCardOperationError.insufficientFunds(moneyNeeded: thing.price + limit - balance)
            }
        }
       
        balance = self.balance - thing.price
    }
    
    
    func depositeMoney (someMoney: Double) {
        balance = self.balance + someMoney
    }
    
    
    func printBalance() {
        print ("Баланс -  \(balance) тг")
    }
    
    
    func changeCardState(cardIsBlocked: Bool) {
        switch cardIsBlocked {
        case true:
            self.cardIsBlocked = true
        case false:
            self.cardIsBlocked = false
        }
    }
}


extension CreditCardOperationError: CustomStringConvertible {
    var description: String {
        switch self {
        case .insufficientFunds(let moneyNeeded): return "На карте недостаточно денег для проведения этой операции. Ваш баланс: \(operation.balance) тг, не хватает: \(moneyNeeded) тг"
        case .frozenBalance: return "Ваш баланс по какой-то причине заморожен. За дополнительной информацией обращайтесь в Банк."
        }
    }
}



let operation = CreditCardOperation()
do {
    try operation.buySomethig(thing: .init(price: 890.7))
} catch let error as CreditCardOperationError {
    print(error.description)
}
operation.printBalance()
operation.depositeMoney(someMoney: 10000)
operation.printBalance()
do {
    try operation.buySomethig(thing: .init(price: 70000))
} catch let error as CreditCardOperationError {
    print(error.description)
}
operation.printBalance()
do {
    try operation.buySomethig(thing: .init(price: 39109.3))
} catch let error as CreditCardOperationError {
    print(error.description)
}
operation.printBalance()


operation.changeCardState(cardIsBlocked: true)


do {
    try operation.buySomethig(thing: .init(price: 90))
} catch let error as CreditCardOperationError {
    print(error.description)
}
