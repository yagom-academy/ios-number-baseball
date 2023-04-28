# ⚾️ 숫자야구

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)

## 🍀 소개
`Hemg`와 `hoon` 팀이 만든 3개의 숫자로 하는 숫자 야구 게임입니다. 컴퓨터와의 승부에서 승리해야 합니다.
* 주요 개념: `Collection Types`, `Optionals`, `Naming`

## 👨‍💻 팀원
| Hemg | hoon |
| :--------: | :--------: |
| <Img src = "https://user-images.githubusercontent.com/101572902/235090676-acefc28d-a358-486b-b9a6-f9c84c52ae9c.jpeg" width="200" height="200"/> |<img height="200px" src="hoon image link">
| [Github Profile](https://github.com/hemg2) |[Github Profile](https://github.com/Hoon94)


## ⏰ 타임라인
### Step 1
<center><img width="1000" height="700" src="https://i.imgur.com/qsBg2jA.png"></center>

### Step 2
<center><img width="1000" height="300" src="https://i.imgur.com/kgaFCUK.png"></center>

## 👀 시각화된 프로젝트 구조
<center><img width="600" height="1600" src="https://i.imgur.com/ARX3ccH.png"></center>

## 💻 실행 화면 

| 사용자 승리 | 컴퓨터 승리 | 잘못된 입력 |
|:--:|:--:|:--:|
|<img src="https://i.imgur.com/UnHB0MB.gif" width="300">|<img src="https://i.imgur.com/2UBfLwN.gif" width="300">|<img src="https://i.imgur.com/Qm0VppF.gif" width="300">|


## 🛠️ 트러블 슈팅
### `Set`과 `Array` 타입 활용
- 순서도에서 생성한 사용자 랜덤 번호와 컴퓨터 랜덤 번호를 비교하기 위해 어떠한 자료구조를 사용할지에 대해 고민하였습니다. 볼은 순서(위치)와 관계없이 서로 같은 숫자가 있는지를 확인함으로 `Set`을 사용하였고 스트라이크는 순서(위치)와 관련하여 같은 위치에 같은 값이 있는지를 판단하기 때문에 `Array`를 사용하였습니다.

### 함수의 재활용성
- 사용자의 랜덤 숫자 생성과 컴퓨터의 랜덤 숫자 생성 기능을 처음에는 개별 함수로 선언하였습니다. 하지만 결괏값을 받는 변수 즉, 사용자인지 컴퓨터인지의 차이만 존재할 뿐 같은 기능을 수행하므로 하나의 함수로 변경하였습니다.

### 중복 숫자 확인에 대한 활용
- 랜덤 숫자를 포함시킬때 inserted의 대한 부분에 대해서 처음에는 `Set`을 사용하여 `insert`와 `contains`를해서 숫자를 포함시켰는데 `Array` 로 변경함에 있어서 중복된 숫자를 포함 시키지 않기 위해서 어떤 방법을 선택해야 할지 고민하다가 inserted을 사용하여 진행했습니다.

### `split` 함수
- `split`을 이용하여 `readLine` 사용시에 인덱스로 나눌 수 있다고 생각했습니다. `readLine`의 타입이 `String` 값이라 `if let` 바인딩을 하여 `Int` 값으로 변경하여 사용 하려고 했습니다. 처음 생각이 `["1, 2, 3"]` 이라고 생각되어 인트로 감싸서 `Int([1, 2, 3])` 해서 출력이 될꺼라고 생각했었는데 이점에서 잘못 알고 있어 배열 `Int`로 감쌀수없다는 것을 알게 되었고 그래서 `for`문을 통해 인덱스값 하나하나를 `Int`로 변경후 사용하게 되었습니다.
