import UIKit

protocol Moveable {
    mutating func move(to point: CGPoint)
}

// Moveable 프로토콜을 채택한 클래스, Car
class Car: Moveable {
    // Car은 클래스이자 참조타입이므로 mutating이 필요없다.
    func move(to point: CGPoint) {...}
    func changeOil()
}
// Moveable 프로토콜을 채택한 구조체, Shape
struct Shape: Moveable {
    // Shape는 구조체이면서 값타입이므로 mutating을 명시해주어야한다.
    mutating func move(to point: CGPoint) {...}
    func draw()
}

// Car 인스턴스, prius
let prius: Car = Car()
// Shape 인스턴스, square
let square: Shape = Shape()

// prius를 참조하는 thingToMove
var thingToMove: Moveable = prius
thingToMove.move(to:...)    // prius의 move(to: )가 실행된다.
thingToMove.changeOil()     // thingToMove 인스턴스는 Moveable 타입이므로 Car에만 있는 메서드는 실행 불가, 프로토콜 내부에 있는 메서드만 실행 가능

// prius, square을 Moveable 타입 배열로 받을 수 있다.
// 둘다 Moveable 프로토콜을 준수하는 인스턴스이기 때문이다.
let thingsToMove: [Moveable] = [prius, square]

func slide(slider: Moveable) {
    let positionToSlideTo = ...
        slider.move(to: positionToSlideTo)
}
slide(prius)
slide(square)
