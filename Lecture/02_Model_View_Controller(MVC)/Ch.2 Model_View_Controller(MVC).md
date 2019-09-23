# Ch.2 Model_View_Controller(MVC)

## Design Pattern 이란?
다양한 개발환경에서도 비슷한 문제들이 발생할 수 있는데, 이 비슷한 문제들을 해결하는 정형화된 해결책을 의미.<br>
디자인 패턴을 적용하면 코드의 가독성, 효율성, 디버깅, 협업 등이 간편해진다.

**디자인 패턴 종류**
- 생성 패턴 : Singleton
- 구조 패턴 : MVC, MVVM, Facade, Decorator, Adapter
- 행동 패턴 : Observer

## MVC (Model-View-Controller)

> MVC 구조 (Model - View - Controller)는 프로그램을 짜는 대표적인 디자인 패턴 중 하나
![MVC](/Lecture/02_Model_View_Controller(MVC)/images/1.png)

- Model 
    - '무엇'에 해당하는 UI와는 독립적인 객체들로 앱의 비즈니스 로직과 데이터를 관장하는 영역
    
- View
    - 컨트롤러의 '하인', 유저에게 데이터를 보여주거나, 유저 인터렉션(UI)를 담당하는 영역

- Controller
    - '어떻게'에 해당, Model과 View간의 동작을 관리 이때 Controller에서 View나 Model과 자유롭게 소통하지만 반대로 View나 Model은 자신을 제어하는 Controller가 누군지 모름.
    - 모델의 정보를 해석하고 구성해서 뷰에게 주는 것

### 서로의 관계

- Model - Controller
    - 컨트롤러는 모델에 직접적으로 접근하여 자유롭게 소통할수 있지만, Model은 컨트롤러에 Notification, KVO(Key Value Observing) 방식을 통해 모델의 변화를 알림.

- Controller - View
    - 컨트롤러는 뷰에 대해 Outlet을 이용하여 직접적으로 접근할수 있다.
    - 반대로 View는 Controller에게 구조적으로 미리 정해진 방식으로 행위에 대한 delegate, data source를 할수 있다.

- Model - View
    - Model은 UI와 독립적이며 UI에 의존하는 뷰와 통신하는 건 불가능
    - 뷰가 일반적인 객체들이기 때문 (ex : 버튼이 해당 객체가 무엇인지 모름)

## 구조체(Struct)와 클래스(Class)의 차이
스위프트에서는 구조체와 클래스는 거의 똑같다. 하지만 중요한 차이점이 2가지가 있다.
1. 구조체는 상속성이 없다. vs 클래스는 상속성이 있다.
    - 상속성이 있다면 상속받는 것과 그것을 어떻게 받아야 할지 고려해야한다.
2. 구조체는 값타잆 vs 클래스는 참조 타입
    - 값 타입 : 인자로 보내거나 배열에 넣거나 다른 변수에 할당해도 값이 ```복사```된다.
    - 참조 타입 :  힙에 자료형이 담겨 있고 그 자료형에 포인터를 쓸 수 있다. 그걸 여러군데에서 사용한다면 실제로 그 자료형을 보내는 게 아닌 그 자료형을 가리키는 포인터를 보내는 것

> 구조체는 모든 멤버변수를 초기화할 수 있는 공짜 이니셜라이저가 존재한다 vs 클래스는 공짜 이니셜라이저가 존재하지 않는다.
> - 구조체 : 받는 공짜 이니셜라이저는 모든 변수를 초기화한다.
> - 공짜 이니셜라이저 : 모든 변수들이 초기화되면 인수가 없는 init을 자동으로 생성

## 결과 화면

<img src="/Lecture/02_Model_View_Controller(MVC)/images/2.gif" width = "250" alt="결과화면">