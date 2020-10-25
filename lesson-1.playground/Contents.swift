import Foundation
//1 Заданиеx2-5x+9=05
let a:Double=1
let b:Double=(2)
let c:Double=(-5)
let d:Double=(b*b)-(4*a*c)//Дискриминант
if d<0
{
    let x1:Double=(-b+(sqrt(d)))/2*a
}
else
{
    let x2:Double=(-b-(sqrt(d)))/2*a
}

//2 Задание - Даны катеты прямоугольного треугольника. Найти площадь, перимметр и гипотенузу треугольника.
let a1:Double=3
let b1:Double=4
let c1:Double=sqrt(a1*a1+b1*b1)//Гипотенуза
let p:Double=a1+c1+b1 //Периметр
let s = a1*b1/2 //Площадь

//3 Задание
let vklad=10000
let proc=5
let vkladitog=vklad+(vklad*proc)/100*5




