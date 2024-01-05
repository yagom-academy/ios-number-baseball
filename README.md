# iOS 커리어 스타터 캠프 11기
#### 제목: 숫자 야구
#### 구성원
- Diana: https://github.com/Diana-yjh
- Danny: https://github.com/dannykim1215

</br>

## ✍️ FlowChart
![Screenshot 2024-01-05 at 9 15 55 PM](https://github.com/Diana-yjh/ios-number-baseball/assets/57698939/11f4ccbb-8f66-4259-aac5-3161db6b8869)


## 🗓️ 타임라인
### 1월 3일
기본 큰 기능 구현 (프로그램 실행 함수, 게임 시작 함수, 사용자 입력 함수 와 검증 기능)</br></br>

### 1월 4일
컴퓨터 랜덤 숫자 생성 함수, 스트라이크 체크 기능, 볼 체크 기능 구현 후 각 함수들을 파일로 분리</br>
FlowChart 이미지 추가, Readme에 추가</br>
이미 구현 한 스트라이크 체크 기능과 볼 체크 기능 을 사용하여 체크 함수 구현</br>
체크 함수 내 게임 시작 함수(execute()) 호출 제거</br></br>

### 1월 5일
사용자 입력 함수 ```filter``` 를 활용하여 로직 변경</br></br>
변경 전
```
if splitUserInput[0] != splitUserInput[1] && splitUserInput[0] != splitUserInput[2] && splitUserInput[1] != splitUserInput[2] {
     ~
}
```
</br>
변경 후
</br>

```
for i in 0...2 {
      let deleteSameNumber = splitUserInput.filter({$0 == splitUserInput[i]})
}
```

</br>
게임 9회 종료 후에도 게임이 종료되지 않고 반복되는 오류 수정 </br>
게임이 실행되지 않고 사용자 입력이 반복되는 오류 수정</br>

## 👍 실행 결과
![Screenshot 2024-01-05 at 9 14 15 PM](https://github.com/Diana-yjh/ios-number-baseball/assets/57698939/82b9742d-b148-46c5-83b1-8215bce5917f)

## 🧐 학습 내용
짝프로그래밍 방식으로 프로젝트 진행</br>
Swift 기본 문법 및 고차함수 ```filter``` 등 을 처음 사용</br>
Class 구현 및 사용</br>
Guard let, If let 등 을 사용한 Optional 바인딩</br>
Git push, pull, remote 설정 등 학습
