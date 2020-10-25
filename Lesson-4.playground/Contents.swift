import Foundation


enum Gender {
    case male, female
}

struct BirthDay {
    var day: Int
    var mounth : Int
    var year : Int
}

class User {
    var name: String = ""
    var gender: Gender
    var birthDay: BirthDay
    
    static var userCount = 0
    
    init(name: String, gender: Gender, birthDay: BirthDay) {
        self.name = name
        self.gender = gender
        self.birthDay = birthDay
        
        User.userCount += 1
    }
    
    deinit {
        User.userCount -= 1
    }
    
    static func countInfo() {
        print("----------------------")
        print("В базе -- \(self.userCount) пользователя.")
    }
    
    func howOldAreYou() {
        let age = 2020 - birthDay.year
        
        print("\(name) Возраст : \(age)")
    }
    
    
    func printInfo() {
        print("----------------------")
        print("Вот некоторые сведения о \(name): пол: \(gender), Дата рождения: \(birthDay.day).\(birthDay.mounth).\(birthDay.year)")
        
        print(howOldAreYou())
    }
    
}

class ProfileAboutMe: User {
    var hobbie : String
    var myFavoriteBook : String
    var myFavoriteFilm : String
    var myFavoriteMusic : String
    var myFavoriteFood: String

    init(name: String, gender: Gender, birthDay: BirthDay, hobbie: String, myFavoriteBook: String, myFavoriteFilm: String, myFavoriteMusic: String, myFavoriteFood: String) {
        self.hobbie = hobbie
        self.myFavoriteBook = myFavoriteBook
        self.myFavoriteFilm = myFavoriteFilm
        self.myFavoriteMusic = myFavoriteMusic
        self.myFavoriteFood = myFavoriteFood
        
        super.init(name: name, gender: gender, birthDay: birthDay)
    }
    
    override func printInfo() {
        super.printInfo()
        print("Немного информации о - \(name) Хобби: \(hobbie), Любимые книги: \(myFavoriteBook), Любимый фильм: \(myFavoriteFilm), Любимая музыка: \(myFavoriteMusic), Любимая еда: \(myFavoriteFood)")
    }
    
}

class ProfileForJobSearching : User {
    var education : String
    var speciality : String
    var experience : String
    
    init(name: String, gender: Gender, birthDay: BirthDay, education: String, speciality: String, experience: String) {
        self.education = education
        self.speciality = speciality
        self.experience = experience
        
        super.init(name: name, gender: gender, birthDay: birthDay)
    }
    
    func addExperience(newExperience: String) {
        self.experience = experience + "," + newExperience
    }
    
   override func  printInfo() {
        super.printInfo()
    
        print ("\(name) Обучается в : \(education), Специальность: \(speciality), Оыт: \(experience)")
        print("------------")
    
   }
}

var user1 = ProfileForJobSearching(name: "Мария", gender: .female, birthDay: .init(day: 12, mounth: 4, year: 1999), education: "Финансовая академия", speciality: "Финансы", experience: " Прохождение практики")
//user1.printInfo()
user1.addExperience(newExperience: "Практика - 'Нац.центре тестирования' - 2019-2020)")
user1.printInfo()

var user2 = ProfileAboutMe(name: "Александр", gender: .male, birthDay: .init(day: 1, mounth: 1, year: 1995), hobbie: "Бодибилдинг", myFavoriteBook: "Гарри Поттер", myFavoriteFilm: "Бригада", myFavoriteMusic: "В/Цой", myFavoriteFood: "Пирожки")
user2.printInfo()

var user3 = ProfileAboutMe(name: "Максим", gender: .male, birthDay: .init(day: 6, mounth: 11, year: 1991), hobbie: "Хоккей", myFavoriteBook: "Пушкин", myFavoriteFilm: "Форсаж", myFavoriteMusic: "Рэп", myFavoriteFood: "Манты")
user3.printInfo()

print(User.countInfo())
