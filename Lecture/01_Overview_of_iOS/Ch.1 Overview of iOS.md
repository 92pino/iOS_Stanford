# Ch.1 Overview of iOS

## iOS 계층구조
![계층구조](/Lecture/01_Overview_of_iOS/images/1.png)

### Core OS
- 하드웨어와 가장 가까이 있는 최하위 계층
- C기반의 저수준의 API로 이루어져 있음
- 데이터처리, 네트워크, 파일 접근 등 ```시스템의 핵심 기능을 포함하는 기본적인 부분```들을 관리한다고 볼 수 있음.

### Core Service
- 하위 서비스들의 최상위에 있는 개체 지향 층
- 시스템의 핵심 기능을 관리한 Core OS에서 제공하지 않는 부가기능들을 포함
- 내부 데이터/위치/센서 등의 기능을 제공
- CoreMotion(기기센서),Accounts(계정관리),Foundation(데이터 관리) 등의 기능 제공

### Media
- 그래픽이나 오디오, 비디오 등 멀티미디어 기능을 제공
- C와 Objective-C가 혼합되어 있는 상태
- AvFoundation(미디어 재생관련),MediaPlayer(플레이어),Core Image(이미지 가공)등의 기능 포함

### Cocoa Touch
- 사용자에 가장 가까이 있는 최상위 계층
- 화면의 그래픽 UI 및 터치의 기능을 제공
- UIKit(UI구성, 터치), MapKit(지도),MessageUI(메세지, 이메일) 등의 기능 포함

## Xcode 사용법
- 프로젝트 생성시 필수 사항
    - 프로젝트명
    - 팀명
    - 기관명
    - 기관식별자(고유한 이름)
- Xcode Interface 구성 요소
    - 네비게이터 : 프로젝트를 탐색/디버깅/파일 목록 볼수 있음 (Command + 0)
    - 유틸리티창 : 우측 옵션 영역 (Option + Command + 0)
    - 디버거 / 콘솔창 : 디버깅 출력 등에 사용되는 인터페이스 (Command + Shift + y)
    - 시뮬레이터 : 기기를 연결하여 사용할수도 있지만 시뮬레이터를 통하여 디버깅 할수 있음(여러개의 시뮬레이터 오픈 가능)
    - 인터페이스빌더

## 집중력게임 기본로직 Source

- import :  (=include) 프레임워크를 불러오기 위한 명령어
- UIKit : 버튼, 슬라이드 등 UI와 관련된 iOS 프레임워크(최상단 코코아 터치 계층)

> 메서드에서 인자는 하나만 가지는 것도 가능하다
>
> ex) func flipCard(emoji: String, button: UIButton)<br>
> emoji라는 인자와 button이라는 인자 둘다 하나씩 지정하였는데 이는 내부인자와 외부 인자 모두 같은 인자를 사용한다는 것을 의미한다.

**초기화 방법**
- 초기값을 지정해주기
- init 사용하여 초기화시키기

- Outlet은 인스턴스 생성, Action은 메서드를 생성

### 프로퍼티 감시자
- didSet
    > - 속성의 변화를 감시하면서 값이 변경될때마다 계속 업데이트시킴
    > - UI와 인스턴스 변수의 싱크를 맞추기 위해 사용

### 옵셔널
- 설정된 것과 설정되지 않은 상태(존재 or 존재하지않냐)
- 만약 존재하지 않는 index를 선택하게 될 경우 nil이 출력
    > - nil = 설정되지 않은 옵셔널의 상태

> **ㅁ 주의**
>
> 옵셔널을 풀기 위해 강제로 !를 사용하는것은 좋지 않음
> guard let, if let을 사용하여 옵셔널 해제하는걸 지향

## 결과화면

<img src="/Lecture/01_Overview_of_iOS/images/3.gif" width = "250" alt="결과화면">