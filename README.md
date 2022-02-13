# 숫자야구 프로젝트 저장소
> 프로젝트 기간 2022.02.08 ~ 2022.02.11 </br>
팀원 : [@Lingo](https://github.com/llingo) [@Red](https://github.com/cherrishRed) / 리뷰어 : [@HJEHA](https://github.com/HJEHA)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [순서도](#순서도)
- [키워드](#키워드)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [STEP 2](#step-2)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [그라운드 룰](#그라운드-룰)
    + [활동 시간](#활동-시간)
    + [코딩 컨벤션](#코딩-컨벤션)


## 프로젝트 소개

야곰과 즐기는 숫자야구 게임

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## 순서도

<img width="3207" alt="숫자게임 Flow Chart" src="https://user-images.githubusercontent.com/94151993/153160269-c1a967df-0782-4a59-b44a-d342010fab20.png">

## 키워드

- `네이밍` `함수 분리`
- `map` `filter` `compactMap` `split` 
- `zip` `enumerated`
- `split vs components`
- `Optional` `Set` `Tuple`
- `Sequence Protocol`
- `inout`

## STEP 1

### 고민한점

- 네이밍
- if, for문 중첩된 들여쓰기
- 클로저 함수에서 후행 클로저로 줄일 때, 파라미터 리턴 키워드를 어디까지 생략하는 것이 좋은지?
- zip함수를 사용과 인덱스 사용에 성능 차이가 있을까?


### 배운개념

**네이밍**

Swift에서는 줄임말이나 관용적인 표현을 지양하는 것이 좋으며 복수형으로 변수를 네이밍하는 것이 Array, List를 붙이는 것보다 좋다.

**zip 함수**

`zip()` 는 두 개의 `Sequence Protocol` 을 준수한 데이터를 매개변수로 받아
각 데이터의 값을 튜플의 쌍으로 된 `Zip2Sequence (Sequence)` 객체로 반환해주는 함수이다. 만약, 매개변수로 받은 두 데이터의 길이가 다를 시 짧은 쪽을 기준으로 `Sequence`가 생성된다. `Sequence Protocol`은 `Collection Type` 들이 가지고 있는 상위 프로토콜로 한번에 하나씩 순서를 밟아 실행할 수 있는 리스트 규약이다.

```swift 
let number1 = [1, 2, 3]
let number2 = [4, 5, 6]
let zipNumber = zip(number1, number2) // Zip2Sequence 객체로 반환이 되고

print(Array(zipNumber)) // [(1, 4), (2, 5), (3, 6)] 으로 튜플의 형태로 나오게 됩니다.
```

**joined(separator:) 함수**

```swift
// values = [1, 2, 3] 일때,
func convertSetToString(of values: Set<Int>) -> String {
    let result: [String] = values.map { (number: Int) -> String in
        return "\(number)"
    }
    // map 함수의 결과로 result는 ["1", "2", "3"]이 되고

    return result.joined(separator: " ") // joined의 결과로 "1 2 3" 이 반환됩니다.
}
```

위 예제 코드에서 `joined(separator:)` 는 `map()`의 결과로 반환된 [String] 배열을 separator 을 기준으로 합쳐주는 역할을 하는 메소드이다.

공식 문서를 참고하면 separator는 `Sequence 프로토콜`을 채택하고 있기 때문에 `Sequence 프로토콜`을 채택하고 있는 값이라면 사용이 가능하다. 다만, separator 는 `Element`와 같은 타입이어야 한다.

**In-Out 키워드에 대해**

`inout`은 함수에서 직접 파라미터 값에 접근할 수 있도록 해주는 기능이다.
(스위프트에서 파라미터는 상수로 받기 때문에 변경할 수 없지만 `inout` 키워드를 사용하면 가능하다. )


**stride 함수**

`stride(from, to, by)`는 `from`에서부터 `to` 까지 `by`의 값을 반복 연산한 결과를 `Sequence`로 반환하는 함수이다.

**Set 자료형의 intersection 함수**

`intersection`은 Set 타입에 사용할 수 있는 메서드로 Set 간의 교집합을 새로운 Set 타입으로 반환해주는 메서드이다.

**함수 확장성에 대한 고민**

함수를 구현할 때 확장성을 생각해서 구현해야한다. 파라미터 기본값을 사용하는 것도 좋은 방법이다.


## [STEP 2]

### 고민한점

- 이중 들여쓰기를 사용하지 않고 반복문을 제어하는 것
- increase 함수의 재사용성
- 클로저 내부에서 인자의 네이밍을 어떻게 해야할 지
- `readLine()` 관해
    - 기존에는 `readLine()` 에서 엔터키를 눌렀을 때 `nil` 이 반환되어 옵셔널 바인딩이 필요하다고 알고 있었는데 엔터키를 눌렀을 때 빈 문자열이 반환되어 강제 언래핑을 해도 오류가 없었다.

### 배운개념

**디버깅 능력**

문제가 발생했을 땐 의심되는 코드에 breakpoint를 걸어서 확인하는 디버깅 습관을 가지자

**enumerated 함수**

`enumerated()` 함수는 (n, x)의 시퀸스 쌍을 리턴해주는 메서드이다. 여기서 n은 0부터 시작하는 연속적 숫자 이며, x 는 시퀸스의 요소를 나타낸다. n이 0부터 시작하는 연속되는 숫자를 나타내기 때문에 배열에서 사용하였을 때 인덱스와 배열의 값을 튜플로 만들어서 리턴해주는 효과를 나타낼 수 있다.

**allSatisfy 함수**

`allSatisfy()` 함수는 요소가 조건을 만족하는지를 검사해 모든 값이 true 일 때 true를 하나라도 false 이면 false를 리턴해 주는 함수이다. `filter()` 와 비슷하지만 리턴값이 Bool 이라는 차이점이 있다.

**compactMap 함수**

`compactMap()` 함수는 원소를 변환된 결과가 `nil`이 아닌 것들을 배열에 담아 반환해주는 함수입니다.

**출력문을 여러 줄로 출력하는 방법**

```swift
print("""
숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
중복 숫자는 허용하지 않습니다.
입력 :
""", terminator: " ")
```

**ulimit 명령어**

재귀 함수를 사용하는 것을 고민하다가 `Recursion limit`가 어느정도인지 궁금하였고 `ulimit -s` 명령어를 사용하여 확인한 결과 stack size는 보통 8MB까지 가능하다는 것을 알 수 있었다.

## 그라운드 룰
### 활동 시간
- **수** : 오후 2시 ~ 6시 30분
- **목** : 세션 끝나고 식사 후 6시
- **금** : 세션 후 잠깐 하다가 7시 30분부터 시작

### 코딩 컨벤션
**커밋 메시지**
```
feat : 새로운 기능의 추가
fix: 버그 수정
docs: 문서 수정
style: 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
refactor 코드 리펙토링
test: 테스트 코트, 리펙토링 테스트 코드 추가
chore: 빌드 업무 수정, 패키지 매니저 수정(ex .gitignore 수정 같은 경우)
```