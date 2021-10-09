# 숫자야구 프로젝트 저장소
팀원 : [@horeng2](https://github.com/horeng2) [@leeari95](https://github.com/leeari95) [@ye-ha](https://github.com/ye-ha) / 리뷰어 : [@ictechgy](https://github.com/ictechgy)

## 순서도
![flowchart](https://user-images.githubusercontent.com/60090790/136555480-48feaf9d-207a-4954-add9-9d539d55a726.jpg)

## 구현사항
- createRandomNumbers 함수
    - 랜덤 숫자 생성하여 반환
- classifyStrikeOrBall 함수
    - 정답과 비교하며 스트라이크/볼 카운트 판정
- sumUpScores 함수
    - 스트라이크/볼 카운트 합산하여 반환
- printVictoryMessage 함수
    - 승리 메세지를 출력하고 게임 카운트를 초기화
- startGame 함수
    - 게임 시작

## 고민했던 것들
- 순서도 작성 방법과 기준
- commit 메세지 스타일,  body 작성 방법
- 변수 및 함수 네이밍
- 여러 함수에서 여러 번 사용되는 변수를 전역변수로 선언하는게 나을지 파라미터로 연달아서 전달하는게 나을지 고민
- 전역변수 선언 지양하기 위해 inout 키워드를 얼마나 사용할지 고민
- 한 개 이상의 값을 반환받을 때 배열을 사용할지 튜플을 사용할지 고민
- 하드코딩을 피하기 위해 변수를 따로 선언하는 방법
- 볼과 스트라이크 개수를 헤아리는 적절한 방법
- 올바른 범위의 값이 입력되었는지 검증하는 방법

## 개선사항
- 들여쓰기 제한 조건 충족 위해 함수 내의 기능을 함수로 분리
    - checkBallCount함수 내 if문 → calculateBallCount 함수로 분리
    - startGame 함수 내 if문을 printVictoryMessage 함수로 분리
- 볼과 스트라이크 값을 반환할 때 배열 사용 → 튜플 사용
- 가독성 향상, 휴먼에러 및 하드코딩 방지
    - 정수 0 → .zero 이용
    - 정수 9 → victoryGoal 변수 생성
- 일일히 출력하던 부분을 reduce를 이용해 String으로 변환해 한 번에 출력하도록 수정
- guard문을 사용해 숫자를 한 번에 맞추는 경우를 제한했으나 한 번에 맞추는 경우는 드물고, 해당 부분의 가독성이 떨어져 삭제
- 함수 재사용성을 고려하여 3으로 지정했던 부분 수정
- 역할에 맞게 변수명 및 함수명 수정
- 값이 변경되지 않을 변수(var)를 상수(let)로 변경함

## 궁금했던 것들
- refactoring의 스킬, 그리고 이러한 방법들이 왜 좋은걸까?
- 전역변수를 지양하는 이유는 무엇일까?
- 프로젝트 제약사항의 들여쓰기 기준