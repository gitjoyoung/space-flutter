# ace팀 규칙


### 플루터 코드 컨벤션

변수 선언시 camelCase 

함수 선언시 camelCase

class 선언시 PascalCase

폴더 생성시 snakecase 소문자 특수문자 X

폴더 하위 파일 명 snake_case 언더바 포함 해당 폴더명 기입 X
예시 view -> authpage -> change_password.dart

MVC 패턴 적용
Model , View , Controller 

View에서 자주 사용하는 위젯들 widgets 폴더에 따로 구분

util 자주쓰는 도구 함수 


멘토 / 주노첫글자 소문자 - 카멜케이스 (낙타)
멘토 / 주노첫글자 대문자 - 파스칼 케이스
멘토 / 주노변수는 - 카멜케이스로 가져감


### 깃 리모트 설정

리모트(remote)는 원격 저장소를 로컬 저장소에서 참조할 수 있는 이름이나 별칭입니다. 
리모트를 만들려면 git remote add 명령어를 사용할 수 있습니다.

왜 리모트를 설정해주냐?

풀 푸쉬를 편리하게 하기 위한 설정

pull 이란? 
깃허브에서 받아오는 것

push 란?
깃허브로 보내는 것

pull 은 메인 최종적으로 합쳐진 메인 브랜치에서 받음

git pull https://github.com/9weeks-flutter-sface/Higher.git main

위 코드의 뜻

깃에서 pull 받아오겠다 
어디서?
https://github.com/9weeks-flutter-sface/Higher.git

어떤 브랜치를 가져오나?
main 브랜치를 가져오겠다


위 과정중 pull을 받을때 

https://github.com/9weeks-flutter-sface/Higher.git

해당 주소지를 일일히 쓰기 귀찮으니

리모트를 설정해준다

git remote add origin https://github.com/9weeks-flutter-sface/Higher.git

리모드가 잘 들어갔나 확인
git remote -v

잘 들어갔다면 이렇게 뜬다
C:\final-flutter-project>git remote -v
origin  https://github.com/9weeks-flutter-sface/Higher.git (fetch)
origin  https://github.com/9weeks-flutter-sface/Higher.git (push)

이제 git pull origin main 으로 축약된 명령어로
 main 브랜치를 가져올수 있게 되었다


 git push 시에는 주의 해야함
각자의 브랜치에서 작업할 것이기 때문에

 git push origin joyoung
 처럼

 git push origin 자기자신이름 브랜치에 업로드 후

 깃허브에서 풀리퀘스트를 날려 코드 최종 병합을 결정한다 


### 깃허브 브랜치 생성

자신의 이름으로 브랜치를 생성

예시
git branch joyoung

git branch 

C:\final-flutter-project>git branch
  joyoung
  * main

와 같이 생성한 브랜치가 뜬다면 성공


이제 깃을 자신의 브랜치로 바꿔줘야함

git checkout joyoung

C:\final-flutter-project>git branch
* joyoung
  main

* 표시가 해당 브랜치의 위치
여기서 작업후 git push 하고 풀리퀘스트를 하면 됩니다



### 커밋 메세지 예시

git commit -m "feat:추가한 기능 설명" 


| feat | 새로운 기능에 대한 커밋 |
| fix | 버그 수정에 대한 커밋 |
| build | 빌드 관련 파일 수정 / 모듈 설치 또는 삭제에 대한 커밋 |
| chore | 그 외 자잘한 수정에 대한 커밋 |
| ci | ci 관련 설정 수정에 대한 커밋 |
| docs | 문서 수정에 대한 커밋 |
| style | 코드 스타일 혹은 포맷 등에 관한 커밋 |
| refactor | 코드 리팩토링에 대한 커밋 |
| test | 테스트 코드 수정에 대한 커밋 |
| perf | 성능 개선에 대한 커밋 |