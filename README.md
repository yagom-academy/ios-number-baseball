# ⚾️ 숫자야구게임 프로젝트



## 목차

- [소개](#소개)
- [실행화면](#실행화면)
- [흐름도](#흐름도)
- [팀 규칙](#팀-규칙)
  - [코딩 컨벤션](#코딩-컨벤션)
  - [커밋 컨벤션](#커밋-컨벤션)
- [고민했던 점 및 해결방안](#고민했던-점-및-해결방안)
  - [Step 1](#Step-1)
  - [Step 2](#Step-2)
- [참고 링크](#참고-링크)



## 🗣소개

>  컴퓨터가 입력한 무작위 숫자와 사용자가 입력한 숫자 세개를 비교하는 야구 게임입니다. 3개의 숫자가 모두 일치하면 사용자가 승리합니다.

- 프로젝트 기간 : 2022.12.19 ~ 2022.12.23

- 팀 프로젝트(2인)

- 팀 구성원

| <img src="https://user-images.githubusercontent.com/88870642/209277155-54747f50-ad72-43da-a25f-1fce510e4790.png" alt="KakaoTalk_Image_2022-12-23-14-29-17" style="zoom:33%;" /> | <img src="https://user-images.githubusercontent.com/88870642/209277405-22e2a7cb-03f4-4064-b2dc-de1eb0fea4be.png" alt="image" style="zoom:33%;" /> |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
|                           **송준**                           |                          **Andrew**                          |



## 💻실행화면

### 야구 게임 실행 

<img src = "https://user-images.githubusercontent.com/88870642/209295667-93eb986d-070f-4591-86c2-9806ca3ede3f.gif" height = "150" >

### 사용자 승리 

<img src = "https://user-images.githubusercontent.com/88870642/209295933-3abd7e64-3104-4236-91b3-64d396e4f200.gif" height = "150" >

### 컴퓨터 승리 

<img src = "https://user-images.githubusercontent.com/88870642/209296048-71df4ab4-957a-4edf-a633-67762e6a60fb.gif" height = "150" >



## 📊흐름도

<img src = "https://user-images.githubusercontent.com/45560895/208592877-5a37d55c-32c2-4af1-891a-3811fcb52408.png" height = "700" >







## 👥팀 규칙

### 코딩 컨벤션

- 함수명의 전달인자 괄호와 중괄호 띄어쓰기 

- 함수, 변수, 상수 이름은 CamelCase 사용하기 

- 변수명 모호하게 작성하지 않기

- 부호, 등호 양쪽으로 띄어써주기 

- 함수에서 return 사용 시 줄바꾸기

- 맥락상 의미가 달라지면 줄바꾸기



### 커밋 컨벤션

- Subject line 글자수 50자 이내로 작성
- 함수 한개 단위 커밋



## 🛠고민했던 점 및 해결방안

### Step 1 

###  1️⃣ split(separator: )를 사용했을  때 오류 발생

 readLine을 사용 할 때 강제추출 외에 다른 방법으로 구현할 수 있지 않을까 고민했습니다. split과 components 메서드를 활용해 입력받은 값을 나누어 보고 두 개의 차이점을 알아봤습니다.

**- split**

```swift
func split(separator: Character, maxSplits: Int = Int.max, omittingEmptySubsequences: Bool = true) -> [Substring]
```

- import없이 사용할 수 있다
-  매개 변수가 3개이다. (separator, maxSplits, omittingEmptySubsequences)
-  반환형이 SubString 배열이다.



**- components**

```swift
func components(separatedBy separator: String) -> [String]
```

- Foundation을 import 해야 사용할 수 있다.

- 하나의 파라미터만 받는다. (separatedBy)
- 반환형이 문자열 배열이다.

----

### 2️⃣전역변수와 지역변수 차이점

**- 전역변수**

- 어디에서든 사용할 수 있는 변수

- Data 영역에 static변수와 함께 할당 된다.

- 프로그램의 시작과 동시에 생성되고 프로그램이 종료가 되어야지 그때서야 메모리에서 소멸된다.

- 때문에 필요이상으로 생성하면 메모리를 보다 많이 사용하게 된다.



**- 지역변수**

- 선언한곳 scope 안에서만 사용할 수 있는 변수

- 매개변수와 함께 stack 영역에 저장된다.

- 생성된 함수가 호출이 되면 stack에서 생성되고 함수 호출이 완료되면 종료된다.

- 필요할 때만 사용하므로 메모리를 절약할 수 있다

----

###  3️⃣Type annotation과 Type Inference 특징

Type annotation

- 변수 혹은 상수 선언 시 타입을 명시적으로 선언 

- 컴파일러에게 미리 알려줌으로써 컴파일러 속도가 더 빨라진다 

Type Inference

- 변수를 선언할 때 타입을 생략하고 값을 넣어 초기화
- Swift 특성 중 ***\*설계에 의한 안전성\**** 이라는 항목에 의거해서, 타입 추론은 변수나 상수를 초기화할 때 입력된 값을 바탕으로 스스로 추론이 가능합니다. 
- 컴파일러는 추론시 더 큰 범위의 Type을 설정하기 때문에 의도치 않는 문제가 생성될 수 있기 때문에 Type Annotations을 권장한다고 합니다.

```swift
let e = 2.71828 // Double 타입으로 생성 

let eFloat: Float = 2.71828 // Float 타입으로 생성
```

----



### Step 2

### 1️⃣유효성 검사를 더 간결하게 하는 방법(feat: 정규식)

사용자가 입력한 값에 대한 유효성 검사를 할 때, 중복되는 while문과 if문을 통해 조건을 적용시켰습니다. 이런 방식의 코드가 가독성을 많이 떨어트린다 느껴져서, 정규식을 사용하였습니다. 

**- 프로젝트 사용 예시**

```swift
let isNumbersValid = inputtedUserNumbers.components(separatedBy: " ").joined().range(of: "^[1-9]{3,3}$", options: .regularExpression) != nil
```

----

### 2️⃣에러처리를 꼭 사용해야 될까?

코드 작성에서 유효성 처리를 할 때, 에러처리를 사용해서 만들어 보았습니다. 에러에 대한 분기가 적다고 판단되어, 불필요한 코드가 많이 생겨 가독성이 떨어질거라 판단되어 에러처리를 사용하지 않았습니다.

**- 에러처리 사용 예시**

<img src = "https://user-images.githubusercontent.com/88870642/209071985-a2df4a74-cd3a-4cf0-8105-90b51676e834.png" height = "250">
<img src = "https://user-images.githubusercontent.com/88870642/209072078-2e74dcab-c2b6-4d71-885c-50406cfb6a90.png" height = "350">

**-에러처리 사용 안함**

![image](https://user-images.githubusercontent.com/88870642/209283149-8086b869-183b-4b45-8159-8a5d86f74344.png)

----

### 3️⃣커밋 컨벤션

커밋 컨벤션의 단위가 일정하지 못한 문제에 부딪혔습니다.

![image](https://user-images.githubusercontent.com/88870642/209296393-5317528f-36c4-432c-89a2-87087ea3b9c7.png)

----

### 4️⃣Bool타입 Naming

Bool 타입 Naming의 경우 "~가 맞는가?" 라는 형태로 물어보고 변수 값으로 대답하는 형태로 Naming을 합니다.

- 처음 사용한 Bool 이름

```swift
let checkingNumbersRange = true
```

- 수정 후 이름

```swift
let isNumbersValid = true
```

**예시**

```swift
var isEmpty: Bool = false
var containsApple: Bool = true
var isEnabled: Bool = false
```





## 📎참고 링크 

- [정규식 공식 문서](https://developer.apple.com/documentation/foundation/nsstring/1416849-range)
- [정규식 참고 블로그 1](https://ios-development.tistory.com/1087)

- [Components](https://developer.apple.com/documentation/foundation/nsstring/1413214-components)

- [Split](https://developer.apple.com/documentation/swift/string/split(separator:maxsplits:omittingemptysubsequences:))

- [Types](https://docs.swift.org/swift-book/ReferenceManual/Types.html )

  

  
