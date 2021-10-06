# 숫자야구 프로젝트 저장소

---
## 👨‍👩‍👦‍👦 팀 그라운드 룰 
**팀원**</br>
@Yohan @Jiseong</br></br>
**협업 방식**</br>
코드 설계 및 개선 작업 모두를 스크럼으로 진행</br>

## 📌 타임라인 ('21.10.05 ~ )
**2021.10.05 (Tue)**

* 프로젝트 요구사항 파악 및 이해
* FlowChart 작성
* Step 1 기능 설계 - 페어 프로그래밍

**2021.10.06 (Wed)**

* 코딩 컨벤션 리팩터링
* 서로에게 코드 설명
* ```README.md ``` 작성

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
<img width="195" alt="스크린샷 2021-10-06 오후 2 34 57" src="https://user-images.githubusercontent.com/70251136/136146035-23cfa46e-ec75-40d6-860e-77915b898eb2.png">


