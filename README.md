# 숫자야구

## 소개

사용자는 1부터 9 사이의 수 3개를 입력합니다. 임의로 생성된 컴퓨터의 수와 동일하지만 위치가 다른 경우 볼, 위치까지 동일한 경우 스트라이크입니다. 사용자는 9번의 기회 안에 3 스트라이크를 얻어내면 승리합니다.


## 팀원
| 닉네임 |                   Rhode                    |                  kokkilE                   |
|:------:|:------------------------------------------:|:------------------------------------------:|
|  사진  | ![](https://i.imgur.com/XyDwGwe.jpg =250x) | ![](https://i.imgur.com/FL0gKeq.png =180x) |
|  역할  |            내비게이터, 드라이버            |            내비게이터, 드라이버            |


## 타임라인

- STEP 1 순서도 작성 - Commits on Dec 19, 2022
- STEP 2 순서도 작성 - Commits on Dec 19, 2022
- createRandomNums 함수 구현 - Commits on Dec 20, 2022
- returnResult 함수 구현 - Commits on Dec 20, 2022
- startGame 함수 구현 : STEP 1 완료 - Commits on Dec 20, 2022
- inputUserNumbers 함수 구현 - Commits on Dec 22, 2022
- showMenu 함수 구현 - Commits on Dec 22, 2022
- startGame 함수 수정 : STEP 2 완료 - Commits on Dec 22, 2022


## 시각화된 프로젝트 구조
<details> 
<summary>STEP 1 순서도</summary>
<div markdown="1">

![](https://i.imgur.com/MdvkfFk.png)

</div>
</details>

<details>
<summary>STEP 2 순서도</summary>
<div markdown="1">

![](https://i.imgur.com/wHxUzSM.png)
    
</div>
</details>


## 실행 화면


| 구분 | 비정상 입력 | 사용자 승리 |컴퓨터 승리 |
| -------- | -------- | -------- |-------- |
| 실행 화면     | ![](https://i.imgur.com/8dD359u.png =200x)     |  ![](https://i.imgur.com/0hLUShi.png =650x)  | ![](https://i.imgur.com/Vif9Lak.png =600x)     |
| 화면 설명     | 1부터 9까지를 초과한 입력, 입력 숫자의 개수가 3개를 초과한 입력, 중복된 입력, 문자열 입력에 대하여 **입력이 잘못되었습니다** 를 출력     | 사용자가 9번의 기회 안에 3스트라이크를 얻어낸 경우 **사용자 승리...!** 를 출력     |사용자가 9번의 기회 안에 3스트라이크를 얻어내지 못한 경우 **컴퓨터 승리...!** 를 출력     |


## 트러블 슈팅

### 옵셔널 체이닝

```
func countBallAndStrike(comparing randomNumbers: [Int]) -> [String: Int] {
    var result = [String: Int]()
    result["strike"] = 0
    result["ball"] = 0

    for i in 0...2 {
        if computerRandomNumbers[i] == randomNumbers[i] {
            result["strike"]? += 1
        } else if randomNumbers.contains(computerRandomNumbers[i]) {
            result["ball"]? += 1
        }
    }

    return result
}
```

 result["strike"]에 접근하기 위해서 물음표(?)를 사용하는 것이 맞는 것일까? 이에 대해 공부를 하게 되었다. 
 
 딕셔너리에서 키값(key)을 통해 value를 꺼내오면 그 반환값은 기본적으로 옵셔널(Optional)이 된다. '특정 키값에 해당하는 value가 확실히 존재하는데 왜 옵셔널이지?'라고 생각했다. 그런데, 컴파일러는 그것을 알지 못한다고 한다. 그래서 nil의 등장에 대비하여 기본적으로 모든 value에 옵셔널을 씌운다고 한다. 즉, 딕셔너리에 존재하지 않는 키값이 입력되면 nil이 반환 될 수 있기 때문이다. 
 
```
var items = [1: "하네스", 2: "패딩", 3: "리드줄", 4: ""]

items[1] // Optional("하네스")
items[4] // Optional("")

item[0] // nil: 만약 딕셔너리에 존재하지 않는 키값이 입력되면, nil이 반환된다.
```

그렇기 때문에, result["strike"]는 Optional(변수)이다. 그러면, Optional(1)에 물음표(?)를 붙이는 것은 무슨 의미를 가질까? 이것은 옵셔널 체이닝을 공부해보면 알 수 있다. 

옵셔널 체이닝은 옵셔널 뒤에 물음표(?)를 붙여서 접근할 수 있다. 이 때, 옵셔널에 값이 존재한다면 값을 반환하고 그렇지 않다면(nil이라면) nil을 반환한다. 어떤 값을 반환하기 위해 사용한다기보다는 옵셔널인 값들을 바인딩을 사용하지 않으면서 로직을 수행하기 위해 사용한다. 

다시 질문으로 돌아가보자.

```
var result = ["strike": 0, "ball":0]

result["strike"]? += 1  //1
result["hello"]? += 1  //실행되지 않음(nil)
```

result["strike"]에 접근하기 위해서 물음표(?)를 사용하는 것이 맞는 것일까? result["strike"]는 Optional(변수)라고 했다. 여기에 물음표(?)를 붙이는 것은 무슨 의미인가? 바로 옵셔널 체이닝을 사용한 것이다! 옵셔널 바인딩을 사용하지 않으면서 로직을 수행하기 위해 물음표(?)를 붙여준 것이라고 볼 수 있다.
    


---

### 사용자 입력 검증


사용자 입력을 받는 inputUserNumbers() 함수에서 입력받은 문자열을 검증하기 위해 다음의 조건들을 만족해야 했다.
- 입력받은 문자열은 3개의 숫자(1…9)를 포함할 것
- 각 숫자 사이는 공백 문자(" ")로 구분할 것
- 세 개의 숫자(1…9)와 두 개의 공백 문자(" ")외 다른 문자는 포함하지 않을 것
- 각 숫자는 중복이 없을 것

위 조건들을 각각의 조건문을 통해 검증하는것이 아닌 다른 방법으로 구현해보고자 했다.

**정규 표현식**

```
let inputType = "^[1-9]{1}\\s[1-9]{1}\\s[1-9]{1}$"

 let isCorrectInput = userInputs.range(of: inputType, options:  .regularExpression) != nil

 if isCorrectInput == true {
     inputComponents = userInputs.components(separatedBy: " ")
 }
```
위 코드와 같이 입력받은 문자열의 형식을 제한하여 수월하게 입력을 검증할 수 있었다.

---

7-3. 네이밍


```
func CreateRandomNums() -> [Int] {
    ...
 }
```
위와 같은 상황에서 CreateRandomNums 라고 함수명을 짓기 보다는, CreateRandomNumbers 라고 함수명을 짓는게 낫다. 조금 더 길어져도 의미가 명확한게 좋기 때문이다. 나는 이 함수명을 이해했을지라도, 협업하는 상대는 그렇지 못했을 수도 있다. 그러하여 축약어를 사용하지 말고 명확하게 네이밍을 하도록 refactoring 하였다.

## 참고 링크
- 옵셔널 체이닝
    - [Apple Developer Documentation - Optional](https://developer.apple.com/documentation/swift/optional)
- 정규 표현식
    - [Apple Developer Documentation - NSRegularExpression](https://developer.apple.com/documentation/foundation/nsregularexpression)
- 네이밍
    - [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)



