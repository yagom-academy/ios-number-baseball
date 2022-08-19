<!-- 
1. 제목: 앱 이름
2. 소개: 2~3줄 사이의 간략한 소개글
3. 팀원
3-1. 사진 (아바타 or 미모지)
3-2. 닉네임
3-3. 역할
4. 타임라인: 시간 순으로 프로젝트의 주요 진행 척도를 표시
5. 시각화된 프로젝트 구조(다이어그램 등)
6. 실행 화면(기능 설명)
6-1. 화면 스크린샷 or gif
6-2. 해당 화면에 대한 설명
7. 트러블 슈팅
7-1. 겪었던 문제점, 고민했던 부분 → 해결책
7-2. 사소하다고 느껴지더라도 가능한 많은 트러블 슈팅을 작성합니다. (물론 순서는 중요도 순으로 작성합니다.)
* 문제해결 항목과 내용이 많다면 캠프 이후에 항목수를 조절하여 README 분량을 조절해보세요.
README DAY에 README를 완벽하게 완성하는 것이 아니기 때문에 포트폴리오 제출시 다시 한번 다듬어 봅시다.
8. 참고 링크

8-1. 사용한 자료의 출처, 식별자 표시

-->
# 목차
1. [제목](#제목)
2. [소개](#소개)
3. [팀원](#팀원)
4. [타임라인](#타임라인)
5. [프로젝트 구조](#프로젝트-구조)
6. [실행화면](#실행화면)
7. [트러블 슈팅](#트러블-슈팅)
8. [참고 링크](#참고-링크)

## 제목
- 숫자야구
## 소개
- 숫자야구를 하는 프로그램 입니다.
- 컴퓨터가 랜덤한 숫자 3개를 고르고 사용자가 주어진 기회안에 숫자를 맞추는 게임입니다.

## 팀원
- [Ayaan]()
- [제이푸시]()

## 타임라인
<img width="546" alt="스크린샷 2022-08-19 17 16 06" src="https://user-images.githubusercontent.com/82566116/185575539-f16b1d6c-86c1-456c-91c4-a4e17727f2bb.png">
<img width="548" alt="스크린샷 2022-08-19 17 16 16" src="https://user-images.githubusercontent.com/82566116/185575570-d313ba59-80cc-42a9-ba7f-e822a899cfe0.png">
<img width="559" alt="스크린샷 2022-08-19 17 16 28" src="https://user-images.githubusercontent.com/82566116/185575614-37735251-83d1-43c7-9c64-eb99eda6ca79.png">
<img width="552" alt="스크린샷 2022-08-19 17 16 39" src="https://user-images.githubusercontent.com/82566116/185575652-b164ee53-0482-42db-980e-05d17f1ea96b.png">

## 프로젝트 구조
- 전체 순서도

| main | selectMenu |
| -- | -- |
| <img src="https://user-images.githubusercontent.com/82566116/184847815-ec5cd80a-cd37-49d9-9be7-4ae547718c0a.png"/> | ![제목 없는 다이어그램-selectMenu drawio](https://user-images.githubusercontent.com/82566116/184848001-3a084877-8694-498a-ab09-81a5aa21e673.png) |

| playBall | generateAnswer | enterUserNumbers |
| -- | -- | -- |
| ![제목 없는 다이어그램-playBall drawio-2](https://user-images.githubusercontent.com/82566116/184856520-a89cc006-a5b0-481b-812c-b362a42fb5f2.png) | ![제목 없는 다이어그램-generateAnswer drawio](https://user-images.githubusercontent.com/82566116/184852209-c5285dda-74dc-4839-a68e-5d7da3461fa3.png) | ![제목 없는 다이어그램-enterUserNumbers drawio](https://user-images.githubusercontent.com/82566116/184852230-c1d4cc04-379f-4af1-8da1-1244c64b9f47.png) |

| validateNumbers | refereeDecision |
| -- | -- |
| ![제목 없는 다이어그램-validateNumbers drawio](https://user-images.githubusercontent.com/82566116/184852514-3a98f260-5a33-4a19-9b79-7a68eb5843a5.png) | ![제목 없는 다이어그램-refereeDecision drawio](https://user-images.githubusercontent.com/82566116/184852720-fa5472e3-db07-4f6d-826c-c4602da2cc4f.png)

## 실행화면


## 트러블 슈팅
-  inputUserNumbers() -> [Int]
  - array의 값 슬라이싱을 통해 반환하려다 보니 arraySlice형이 반환되어서 arraySlice형으로 반환할 지 Int형 array로 변환 후 반환할지 고민
    - Array 생성자로 덮어주어 Int형 배열로 반환하기로 해결

- playBall()
  - Int형 배열을 양식과 같이 출력하기 위한 방법에 대한 고민
    - String으로 매핑해준 후 구분자를 공백으로 사용하여서 하나의 문자열로 합쳐 주는 함수를 기능분리 해서 해결

- 순서도
  - 순서도를 작성할 때 변수의 네이밍, 자세한 로직을 설명을 했는데 그러다보니 너무 순서도가 복잡해지고 많은 시간이 소요됨. 순서도의 의미를 생각해서 전체적인 흐름을 파악할 정도로만 작성하는게 좋을지, 자세하게 설명할지 고민
    - 자세하게 작성해도 괜찮고, 전체적인 흐름만 파악할 정도로 작성해도 괜찮음.
    - 이 프로젝트를 보는 다른 사람(미래의 나 등)이 잘 이해할 수 있도록 그리는 것이 중요.
    - 코드에 정답이 없듯이 순서도를 그리는 방법에도 정답은 없음.
    
## 참고 링크
- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
- [Git Convention](https://udacity.github.io/git-styleguide/)
- [변수명 잘 짓기](https://tv.naver.com/v/4980432/list/267189)

