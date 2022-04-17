## iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다

#### STEP1 순서도

![](https://i.imgur.com/BYbGlyR.png)

#### STEP2 순서도

![](https://i.imgur.com/Fd4pPRJ.png)

- if let 말고도 옵셔널 처리하는 방법에는 무엇이 있나요? 각각은 어떤 상황에 적절할까요?
1. ! 강제 언랩핑

2. if 문 사용
(ex. if name != nil { print(name) } )

3. 옵셔널 바인딩 사용

if let
guard let

4. Nil-Coalescing
 
 -  반환 값이 없을 때 괄호를 표기한 것이 좋을까요?
헷갈리지 않기 위해 제거하는 것이 좋겠네요

- components 말고도 split이라는 메서드도 있는데요. 둘은 어떤 차이가 있을까요?
- 위 코드를 split으로 구현한다면 어떻게 구현될까요?
components는 String 타입으로 값이 반환되고, split은 subString 타입으로 값이 반환됩니다.
또한, components는 foundation이 import되어있을 때만 사용 가능합니다.

- 옵셔널 체이닝 사용하고 if let을 통해 다시 옵셔널 제거를 시도하네요. readLine()을 guard로 옵셔널을 제거하고 이후 코드를 진행시키는 것은 어떤가요?
- if let과 guard let의 차이는 무엇일까요?
if let 은 바인딩한 값을 scope 안에서 지역변수로써 사용 가능하고 guard let은 함수안에서 사용하여 바인딩한 값을 return 하여 전역 변수로 활용 가능 합니다.

