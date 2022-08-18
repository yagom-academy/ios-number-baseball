## iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다

## 순서도

![Number_Baseball drawio](https://user-images.githubusercontent.com/99257965/185020633-f380bcd1-0394-49a4-825b-55fdb104444d.png)

## 코드 설명

### NumberBaseballLibrary
NumberBaseballLibraryProtocol을 채택하고 있습니다.

주요 함수
1. func matchNumberArray([Int],[Int]) -> (Int, Int) : 두 개의 배열을 매개변수로 받아 Strike와 Ball을 계산 해주는 함수
2. func playNumberBaseball() : 숫자야구 게임 진행 함수 입니다.

### main.swift
NumberBaseballLibrary 클래스에서 playNumberBaseball()를 호출하여 게임을 진행합니다.

## 중요하게 생각한 부분
프로토콜을 사용하여 캡슐화와 접근제어를 구현했습니다.
여러 메서드를 작성하여 기능을 분리했습니다.
