# Ch.4 Swift Programming Language - Part 2

## Concentration class를 struct로 변경
- Concentration은 ViewController에 참조되는 포인터가 아닌 하나의 모델이 된다.
- 클래스에서 구조체로 변경 이유
    - 구조체는 값 복사 타입(값타입)이므로 Heap에 존재하지 않고 구조체를 전달 시 계속해서 그 값을 복사한다.
    - 값이 계속 복사되며 매번 전체를 복사해야하기 때문에 비효율적이라고 생각할 수도 있다.
    - 스위프트는 영리해서 struct일 지라도 해당 내용이 변경되었을 때만 값을 복제한다. ==> Copy and Write

    - 구조체는 쓰기 시 복제하는 차이점이 있다.
    - 클래스는 Heap 영역이 존재하기 때문에 포인터만 전달하면 된다.
    - 구조체로 바꾸면서 mutating 을 사용해야한다.

## Protocol
- 별도의 구현이 없는 메소드와 변수의 리스트이면서 하나의 일급타입
- API에서 원하는 것을 불러오는 방식으로 작동
- 블라인드 커뮤니케이션 구조에서 매우 효과적이다.
    - View - Controller
- 서로 다른 타입끼리 기능을 공유하는데 유리
- 특정 유사한 기능을 공유하면서도 동일한 클래스로부터 상속받을 필요가 없도록 만들어준다.
- 다중 상속을 제공
- 프로토콜은 모드가 없다. 구현방식이 아닌 순수한 선언이기 때문이다.
- 만약 특정 프로토콜이 구조체가 아닌 클래스만 받는 프로토콜이라면, 프로토콜 뒤에 ```:class```를 표시해 주어야 한다.
    - class를 선언해 두면 굳이 mutating을 표시할 필요가 없다.
        - ==> 참조 타입인 class에 mutating을 넣을 필요가 없기 때문
- 클래스나 구조체를 이용해서 프로토콜을 구현할 때 init을 구현해줘야 한다.
    - 클래스로 프로토콜을 구현하려면 required 예약어를 붙여줘야 한다.
    - ==> 서브클래스에서는 더이상 이 프로토콜을 구현하지 않았는데도 사람들은 프로토콜이 서브클래스에서도 가능한 것으로 착각할 수 있기 때문이다.
- extension에 프로토콜을 채택하여 사용할 수 있다.

### 프로토콜 선언 방식
    1. 클래스, 열거형이나 구조체 선언과 같은 선언 방식
        - 리턴 값을 가지는 메소드와 변수의 리스트
    2. 클래스나 구조체나 열거형이 프로토콜의 메소드와 변수를 구현하는 것
    3. 클래스나 구조체, 열거형 등의 구조 내부에 구성

    ```swift
    // 프로토콜 선언 예시
    // someProtocol : 프로토콜의 이름
    // InheritedProtocol1,2 : SomeProtocol이 상속받는 다른 프로토콜들로 몇개든 상속받을수 있다.
    // SomeProtocol을 구현하기 위해서는 InheritedProtocol1, 2 모두 충족시켜야한다.
    protocol SomeProtocol: InheritedProtocol1, InheritedProtocol2 {
        var someProperty: Int { get set }
        func aMethod(arg1: Double, anotherArgument: String) -> SomeType
        mutating func changeIt()
        init(arg: Type)
    }
    ```

```swift
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
```