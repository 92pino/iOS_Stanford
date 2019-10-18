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