# 숫자야구 프로젝트 저장소

---
## 👨‍👩‍👦‍👦 팀 그라운드 룰 
**팀원**</br>
@Yohan @Jiseong</br></br>
**협업 방식**</br>
코드 설계 및 개선 작업 모두를 스크럼으로 진행</br>

## 📌 타임라인 ('21.10.05 ~ '21.10.08)
**2021.10.05 (Tue)**

* 프로젝트 요구사항 파악 및 이해
* FlowChart 작성
* Step 1 기능 설계 - 페어 프로그래밍

**2021.10.06 (Wed)**

* 코딩 컨벤션 리팩터링
* 서로에게 코드 설명
* ```README.md ``` 작성

**2021.10.07 (Thu)**

* 변수명, 함수명 리팩터링
* 함수 구현 및 세분화, 들여쓰기 최소화
* Step 1 PR 피드백 반영


## 🐶 Step 0 - FlowChart
![flowchart](https://images.velog.io/images/yohanblessyou/post/302b1fc2-73f1-4a38-adef-3daca8cbbc6f/Untitled%20(2).png)
## 🐯 Step 1 - 기본 기능 구현
* 다음 변수 생성
	+ 컴퓨터가 제시할 임의의 정수 3개를 담아둘 변수 - ```let keyNumbers```
	+ 남은 시도횟수를 담아둘 변수(초기값은 9) - ```let numLife```
* 다음 함수 구현
	+ 1~9 사이의 세 개의 임의의 정수를 생성하여 반환하는 함수(생성한 세 개의 정수는 중복된 수가 없어야함) - ```func generateThreeRandomNumbers()```
	+ 세 개의 정수를 전달받아 컴퓨터가 제시한 난수와 비교하여 볼과 스트라이크 결과를 반환하는 함수 - ```func computeStrikeAndBall()```
* 게임시작 함수 - ```func runNumberGame()```
* 이번 스텝에서는 사용자 입력이 임의의 수를 생성하여 게임을 진행하도록 구현</br>
</br>

### 🎮 구현 결과
<img src ="https://user-images.githubusercontent.com/70251136/136145167-188f4c3b-4586-4a4e-8108-bc2ee241e841.gif" width="300"></br>

#### 👾 게임 종료
남은 횟수 0 / 컴퓨터 승리</br></br> 
<img width="199" alt="스크린샷 2021-10-06 오후 2 31 37" src="https://user-images.githubusercontent.com/70251136/136145799-84018115-757e-4b87-99e9-a2f1003aee18.png"></br></br>
Strike = 3 / 사용자 승리</br></br>
<img width="195" alt="스크린샷 2021-10-06 오후 2 34 57" src="https://user-images.githubusercontent.com/70251136/136146035-23cfa46e-ec75-40d6-860e-77915b898eb2.png"></br></br>

## 🦊 Step 1 리팩터링
* 기존 변수명, 함수명에 의도가 잘 드러나질 않다고 느껴 수정하였습니다.
	+ ```let keyNumbers``` -> ```let generatedCorrectNumbers```
		+ key라는 단어는 너무 광범위한 의미를 담고있다고 생각하여, 컴퓨터가 생성한 정답의 의미를 명확히 표현하도록 변경하였습니다.
	+ ```let numLife``` -> ```var lifeCount```
		+ num은 관용적인 표현임과 동시에, 변수가 아닌 상수의 역할을 지니고 있는 이름으로 느껴져 Count라는 표현으로 변경하였습니다.
	+ ```func computeStrikeAndBall()``` -> ```func computedStrikeCountAndBallCount()```
		+ API Guideline에 따라 nonmutating 함수엔 -ed라는 접미사를 붙여 명사로 변경하였습니다.
	+ ```func generateThreeRandomNumbers()```-> ```func generatedThreeRandomNumbers()```
		+ API Guideline에 따라 nonmutating 함수엔 -ed라는 접미사를 붙여 명사로 변경하였습니다.

## 🐼 Step 2 - 사용자 입력 구현

* 다음 함수를 구현합니다
	+ 사용자 메뉴를 출력하고 메뉴를 입력받는 함수 (게임시작, 게임종료) - ```func selectMenu()```
	+ 게임 숫자를 입력받는 함수 - ```func receivedUserInput()```
	+ 게임 메뉴 및 사용자가 입력하는 세 개의 숫자의 유효성을 검증하는 함수 - ```func isValidInput()```
	+ 사용자가 입력한 수와 임의로 생성한 정수를 비교하는 함수 - ```func increaseStrikeCountOrBallCount()```</br>
</br>

### 🎮 구현 결과
#### ⚽️ 메뉴의 잘못된 입력 처리
![prj2_1_1 mp4](https://user-images.githubusercontent.com/70251136/136516936-28130c14-4606-49c6-9360-29883a3de3ff.gif)
#### 🏀 정상적인 게임 결과 출력 - 사용자 승리
![prj2_1_2 mp4](https://user-images.githubusercontent.com/70251136/136516934-c8507ce6-baf7-4023-8fe3-588d73257086.gif)
#### ⚾️ 정상적인 게임 결과 출력 - 컴퓨터 승리
![prj2_1_3 mp4](https://user-images.githubusercontent.com/70251136/136516925-97ccb2a3-69b5-4fc6-9b26-cac5c0ee7d0f.gif)
#### 👾 게임 종료
![prj2_1_4 mp4](https://user-images.githubusercontent.com/70251136/136516919-8fbaaaca-c335-465e-89d1-49f2d80f7f12.gif)

