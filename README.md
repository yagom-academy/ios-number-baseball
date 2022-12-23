# ⚾️ 첫번째 숫자야구 프로젝트

> 프로젝트 기간: 2022.12.19 ~ 2022.12.23
> 
> 팀원: 👩🏻‍💻[sehong](https://github.com/sehoong0429), 👨🏻‍💻[harry](https://github.com/HarryHyeon) | 리뷰어: 👨🏻‍💻[inho](https://github.com/inho-98)

<br>

# 목차
- [프로젝트 소개](#프로젝트-소개)
- [순서도](#순서도)
- [키워드](#키워드)
- [타임라인](#타임라인)
- [Ground rule](#ground-rule)
    - [coding convention](##coding-convention)
    - [commit convention](##commit-convention) 
    - [의사소통](##의사소통)
- [Step 0](#step-0) 
    - [고민한 내용](##고민한-내용)
    - [배운점](###배운점)
- [Step 1](#step-1)
    - [고민한 내용](##고민한-내용)
    - [배운점](###배운점)
- [Step 2](#step-2) 
    - [고민한 내용](##고민한-내용)
    - [배운점](###배운점)

<br>

# 프로젝트 소개
숫자야구 게임
게임이 시작되면 컴퓨터가 생성한 1-9사이의 랜덤값 3개의 정수와<br>
사용자의 입력 값을 받아 스트라이크와 볼을 판정하여 승패를 결정하는 숫자야구 게임.  

<br>

# 순서도
![number-baseball drawio](https://user-images.githubusercontent.com/119860138/209172211-1a98a379-17dc-4c2a-be98-75e0c622fd4a.png)

<br>

# 키워드
`array`, `set`, `tuple`<br>
`optional`<br>
`swift coding convention`<br>
`naming`

<br>

# 타임라인 
- 12월 20일: STEP1 PR
- 12월 21일: STEP1 피드백 수정 
- 12월 22일: STEP2 PR, STEP2 피드백 수정
- 12월 23일: STEP2 피드백 2차 수정, readme작성 

<br>

# Ground rule

## coding convention
- 함수를 선언하고 개행하지 않기 
- return시에 한번 더 개행하기
- 변수 선언과 로직이 수행 되는 부분 구분을 위해서 개행하기<br>
![image](https://user-images.githubusercontent.com/67987230/209257899-05ea16ea-7e50-4176-83c8-afbd953fdf61.png)

## commit convention
- 커밋 Type 사용
    - feat = 주로 사용자에게 새로운 기능이 추가되는 경우
    - fix = 사용자가 사용하는 부분에서 bug가 수정되는 경우
    - docs = 문서에 변경 사항이 있는 경우
    - style = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
    - refactor = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
    - test = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
    - chore = 별로 중요하지 않은 일을 수정하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)

## 의사소통 
- 디스코드 회의실에서 화면 공유, 통화 
- 디스코드 메세지 

<br>

# Step 0

## 고민한 내용
- git 사용법 -> 간단한 명령어를(clone, pull, push, branch...) 숙지
- 순서도 그리기 -> 순서도 기호를 알아보고, draw.io를 이용해 작성 

## 배운점 
- fork를 하고 `collaborator`를 설정하는 방법 
- GitHub의 원격 공동 저장소 사용하는 방법 

<br>

# Step 1

## 고민한 내용 
- 중복되지 않은 숫자를 담기 위한 컬렉션 타입 선택 고민 Set vs Array -> 중복된 값을 담을 수 없는 `Set`을 선택하여 구현
- 변수 네이밍을 할때 서로의 스타일이 달라서 예시로 랜덤 숫자를 표현해보면 해리는 randNum , 세홍은 randomNumber
해리는 간단하게 표현이 되는 것을 선호하는 편이고 세홍은 길더라도 한번에 알아보기 쉽도록 작성하는 방식을 선호 -> [API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/#fundamentals)를 참고하여, 해당 가이드라인에 맞게 수정하여 구현

## 배운점
- 함수와 변수의 기능에 맞는 `naming` <br>
- `전달인자레이블`을 생략 가능한 `와일드카드패턴`<br>
- `tuple`<br>

<br>

# Step 2

## 고민한 내용
- 가이드라인에 맞춰 naming을 명확한 방향으로 수정했으나, 함수나 변수가 의미하는 맞지 않은 네이밍을 많이 사용하게됨 -> 함수의 역할 분리를 해서 함수명을 보면 어떤 기능을 하고 있는 함수인지 알수있도록 구현
- 반복되는 출력문을 함수로 관리하는게 좋을까? -> 결론적으로 출력하는 부분은 함수로 묶어서 구현하였고, 추후에 유지보수를 생각한다면 출력문 관리가 수월할 것 같음

## 배운점 
- `code convention`
- swift `API Design Guidelines`지키면서 함수의 기능에 맞는 이름을 작성 해야한다는 것을 배웠음
- 만든 프로젝트내에 두 숫자를 비교하는 함수가 있는데, 이때 `전달인자레이블`을 활용해서 함수 호출이 의미하는 바가 명확해야 한다는 것을 배웠음<br>

    <img width="576" alt="image" src="https://user-images.githubusercontent.com/67987230/209272046-e3e7f52f-76ec-4b23-9f92-d1fa6f3bc661.png">

