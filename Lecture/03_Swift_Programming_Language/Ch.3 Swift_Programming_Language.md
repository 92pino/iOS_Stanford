# Ch.3 Swift Programming Language - Part 1

## Range

- Float 같은 부동 소수점을 반복문으로 돌리기 위해서 stride 전역 함수를 사용하여 구현 가능

```swift
    for i in stride(from: 0.5, through: 15.25, by: 0.3) {
        // 0.5부터 시작해서 15.25까지 증가하는 조건을 0.3씩 증가하는것으로 하는 조건
    }
```

## Tuple

> 튜플이란?
>
> 기본적으로 메소드나 변수가 없는 소형 구조체, 값만 들어가있는 다른 언어의 구조체와 유사

- 튜플은 매우 가벼워서 한줄에 모든 것을 정의할 수 있다.
    - ex)
    ```swift
    let x: (String, Int, Double) = ("hello", 5, 0.85)
    let (word, number, value) = x
    print(word)     // hello
    print(number)   // 5
    print(value)    // 0.85
    ```
    - 요소의 이름을 유연하게 정할 수 있다. (구조체의 변수와 매우 비슷))
    ```swift
    let x: (w: String, i: Int, v: Double) = ("hello", 5, 0.85)
    print(x.w)  // hello
    print(x.i)  // 5
    print(x.v)  // 0.85
    let (wrd, num, val) = x
    ```
    - 함수에서 하나 이상의 값을 리턴할 때 유용
    ```swift
    func getSize() -> (weight: Double, height: Double) { return (250, 80) }

    let x = getSize()
    print("weight is \(x.weight)")              // 250
    print("height is \(getSize().height)")      // 80
    ```

## Computed Properties (계산 프로퍼티)
- 읽기, 쓰기 시 사전 정의한 get, set 대로 계산되는 프로퍼티
- 프로퍼티감시자(property Observer)와 혼용해서 사용할 수 없다.
- 저장프로퍼티와 달리 쓰기/읽기 시 마다 set, get 블럭 내용을 실행한다.
- get(읽기)와 달리 set(쓰기)는 필수 구현 요소가 아니다.
    - 읽기/쓰기 || 읽기 상태 구현 가능
    - get만 사용할 경우 get 명시 없이 바로 return <값>으로 구현 가능
    
    ```swift
    // 일반적인 프로퍼티
    var foo: Double
    
    // 계산 프로퍼티
    // foo를 요청할 때 마다 get 안에 있는 코드를 실행하고
    // foo의 값을 할당할 때 마다 set 안에 있는 코드가 실행
    var foo: Double {
      get{
        
      }
      set(newValue) {
        
      }
    }
}
    ```

## Access Control (접근 제어)
API 내에서 메소드오ㅓㅏ 변수에 특정 키워드를 써서 다른 그룹에서 접근 기준을 지정해주는 것

open > public > internal > filePrivate > private

- open
    - 외부의 사용자가 불러올 수 있을 뿐만 아니라 클래스의 서브 클래스를 만들거나 메소드를 오버라이드 하는 등 모든 것을 할 수 있다. ( 완전 개방상태 )
- public
    - 프레임워크 외부의 사용자가 불러올 수 있는 것
    - open과는 다르게 서브클래스를 만들거나(상속), 메소드 오버라이딩 불가능
- internal
    - 클래스나 구조체 전체의 접근을 제어할 수 있으며, default 접근제어이다.
    - 앱 내의 어떤 사람이던 어떤 객체나 코드이든 간에 그 메소드 혹은 변수에 접근할 수 있다는 것, 즉 앱 내에서 접근하는 데 제한이 없다는 것을 의미
    - 
- filePrivate
    - 파일 이내에서는 메서드, 프로퍼티에 대해 접근 및 할당 가능
    - 
- private
    - 다른 객체로부터 불러올 수 없다.
    - 해당 지정된 블록 내에서만 접근 가능하며 접근 비공개 상태이다.
- private(set)
    - private과 거의 유사하지만 변수만을 위한 것이다.
    - 다른 사람이 불러오고 접근할 수는 있지만, 할당할 수는 없다.
    - 지정된 내부에서만 할당 가능

## Extensions
- 확장을 통해서 변수와 함수를 다른 클래스에 추가할 수 있다.

## Optional
- Optional도 enum(열거형)이다.
- 옵셔널은 배열처럼 제네릭으로, 배열에 어떤 것도 들어갈 수 있듯이 옵셔널도 옵셔널 정수나 옵셔널 문자열이나 다른것들이 들어갈 수 있다.
- 옵셔널은 항상 nil로 시작한다.

```swift
// 옵셔널 코드 형태
enum Optional<T> {
    case none       // 설정되어 있지 않은 상태
    case some(<T>)  // 그 이외 데이터타입 'T'와 관련된 상태
}
```

- 옵셔널 체이닝
    - 옵셔널 체이닝은 수차례의 옵셔널 검사를 하며 값을 접근하는 방식
    ```swift
    let x: String? = ...
    let y = x?.foo()?.bar?.z

    // 동일한 방식을 switch로 풀어낼 경우
    switch x {
        case .none:
            y = nil
        case .some(let deta1):
            switch data1.foo() {
                case .none:
                    y = nil
                case .some(let data2):
                    switch data2.bar {
                        case .none: y = nil
                        case .some(let data3):
                            y = data3.z
                    }
            }
    }
    ```

## Enum
- enum은 다른 언어에 있는 열거형과 유사하다.
- 타입의 일종, struct, class와 같은 데이터 구조 타입중 하나
- 구조체와 같이 값 타입이라 전달할 때 복사된다.
- 구조체나 클래스와 비슷하게 메소드나 변수를 가질 수 있지만 저장 공간을 가지지 않는다.
    - enum의 저장 공간은 각각의 case에 있다.

    ㅁ break
    - switch 문 내에서 특정 분기 시 아무것도 실행하지 않고싶을때 break 사용
    ```swift
    var menuItem = FastFoodMenuItem.hamburger(patties: 2)
    switch menuItem {
        case .hamburger:
            break
        case .fries:
            print("fries")
        case .drink:
            print("drink")
        case .cookie:
            print("cookie")
    }
    ```

    ㅁ default
    - 만약 특정 케이스 이외의 케이스를 한번에 묶어 구분하려면 default:를 사용할 수 있다.
    var menuItem = FastFoodMenuItem.cookie
    switch menuItem {
        case .hamburger:
            break
        case .fries:
            print("fries")
        default:
            print("other")
    }
    ```
    
    ㅁ case let
    - 만약 case 내 정보에 따른 연동자료를 얻고 싶다면 case문 내에 let을 활용
    - let 지역변수 ==> 지역변수 이름은 enum을 선언할 때의 이름과 같지 않아도 된다.
    ```swift
    var menuItem = FastFoodMenuItem.drink("Coke", ounces: 32)
    switch menuItem {
        case .hamburger(let pattyCount):
            print("a burger with \(pattyCount) patties!")
        case .fries(let size):
            print("a \(size) order of fries!")
        case .drink(let brand, let ounces):
            print("a \(ounces)oz \(brand)")
        case .cookie:
            print("a cookie!")
    }
    ```

    ㅁ switch self
    - 변수 내에 있을 떄에 enum의 self를 변경할 수 있는데 ```self = 다른 경우```로 해주면 된다.
        - 이때, 값 타입인 enum 타입 내에서는 mutating 속성이 부여되어 있어야 내부 쓰기가 가능
    ```swift
    enum FastFoodMenuItem {
        ...
        func isIncludedInSpecialOrder(number: Int) -> Bool {
            switch self {
                case .hamburger(let pattyCount):
                    return pattyCount == number
                case .fries, .cookie:
                    return true
                case .drink(_, let ounces):
                    return ounces == 16
            }
        }

        mutating func switchToBeingACookie() {
            // enum객체의 self 변경
            /*
                num타입은 값 타입인데 값 타입은 복제되면서 전달이 이루어지는데 쓰기할 때 복제가 일어난다.
                그렇게되면 쓰기가 실행되기 전까지는 복제가 생기지 않는다.
                그러면 어떤 함수가 쓰기를 실행하는지 알아야하기 때문에 mutating을 사용하여 내부 쓰기 가능하게 만들어준다.
             */
            self = .cookie
        }
    }
    ```


// 내용 복습
Swift에서 앱을 만드는데 사용되는 자료구조
- class
    - 객체 지향 디자인을 지원
    - 기능과 데이터 모두에게 단일 상속을 지닌다.
    - 참조타입으로써 힙(Heap)내에 존재한다.
    - 클래스가 힙 내에 존재하는데 언제 사라질까?
        - ARC(자동 참조 횟수)
            - 힙 내의 참조 타입에 포인터를 만들 때 마다 Swift는 어딘가에 있는 카운터에 1을 더한다.
            - 그래서 매번 그 포인터가 가리키는 것이 없어지거나 더 이상 가리키지 않게 되었을 때 옵셔널처럼 nil이 설정된다.
            - 그 이후 카운트가 1 줄어들게 되고 카운트가 0이 되었을 때 즉시 힙에서 그것을 꺼낸다.
            - 가바지 컬렉터와는 다르게 더이상 가리키는 포인터가 없는 즉시 삭제하는 방식

            ㅁ Strong
            - 평범한 참조 횟수 계산 방식
            - 참조카운팅의 기본 설정값
            - 어떤 포인터가 strong이라면 가리키고 있는 한 힙 내에 포인터를 계속 유지

            ㅁ Weak
            - 옵셔널 포인터로 참조타입을 기리킨다.
            - 힙 내의 어떤것을 가리키고 있지만 흥미가 있어야만 사용되는 것
            - 모든 strong 포인터가 없어졌을 때 nil 로 설정된다. == 옵셔널 타입으로 되어야 함.
            - 몇몇 부분에서만 자주 사용이 된다.
                1. @IBOutlet
                2. delegation(위임)

            ㅁ unowned
            - 참조하지 않는다는 의미
            - 만약 힙 내부의 어떤 것을 가리키고 있을 때 strong 포인터로 인식하지 않는 것이고 힙에서 사라졌을 때 접근하지 않는 것
            - 매우 위험한 참조카운팅 방식
            - 참조순환(메모리 사이클)을 방지하기 위해 사용
                > 메모리 사이클
                > - 힙 내부에 있는 어떤 것이 힙 내부의 다른 어떤 것을 가리키고 그게 다시 가리키는 것을 말한다.
                > - 서로 가리키면서 힙 내에서 유지되지만 아무도 관심 없는 것들
                > - 서로를 제외하고는 아무도 가리키지 않는 것
                > - 아무도 접근하지 않는데 아무 이유 없이 힙 내에 존재하게 되는 상태
            - 클로저를 사용하면 캡쳐링 등의 참조순환 문제가 발생할 수 있는데 이를 방지하기 위해 사용하곤 한다.
- struct
    - 값 타입
    - 복제되고 데이터의 상속 없음
    - 구조체의 종류
        - 배열, 딕셔너리, 문자열, 문자, 정수형, Double, UInt32 ...
    - 값 타입이므로 내부적으로 변경되어야 하는 여지가 있을 때 mutating 예약어 사용
- enum
    - 값 타입
    - 분리된 값
    - 기능 상속을 가질 수 있음
        - 기능 상속은 프로토콜을 통해 이루어진다.
- protocol
