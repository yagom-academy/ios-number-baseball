# 숫자 게임

## 소개
> 컴퓨터가 무작위로 생성한 랜덤한 3개의 숫자와
플레이어가 입력한 3개의 숫자를 서로 비교하여 야구게임을 진행합니다. 
3개의 숫자가 모두 일치하면 사용자의 승리 반대로 
주어진 기회 안에 맞추지 못하면 컴퓨터의 승리입니다.

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## 팀원
[Kyo](#https://github.com/KyoPak)
[Mangdi](#https://github.com/MangDi-L)
## 타임라인
[Commit History](#https://github.com/KyoPak/ios-number-baseball/commits/step-1)



## 순서도
![step0_flowchart](https://user-images.githubusercontent.com/59204352/185026725-9ae94505-86b0-4786-bc5b-30406be1cc5e.svg)


## 실행 화면
![NumberBaseball-gif](https://user-images.githubusercontent.com/49121469/185736289-7dbc29e5-df86-41a9-8504-05577b469f18.gif)

## 트러블 슈팅

### ⭐️ 겪었던 문제점, 고민했던 부분 → 해결책
> 1) Strike와 Ball수를 구할때 어떻게 로직을 짤까 고민했었는데 zip함수를 통해 편리하게 구현할수있었습니다.
> 2) 번호가 중복되지 않게 어떻게 설계할까 고민할때 컬렉션 타입 중 Set을 이용해 .update(with: num)으로 손쉽게 구현할 수 있었습니다.
> 3) 문자열을 처리할때 split와 components를 쓰게되었는데 각각의 결과 타입이 달라 활용하는데에 혼란을 겪었습니다. Int타입으로 변환할때 Substring타입은 곤란해서 String 타입인 components를 활용하게 되었습니다.
> 4) 플레이어의 입력을 받을 때 정상적인 입력값이 아닐경우 처리하는 로직을 어떻게 작성할까 고민했습니다. 플레이어의 입력받은수가 없거나 3개가 아니거나 숫자가 아니거나 범위를 넘어가나 하는 제약사항을 두었습니다.
