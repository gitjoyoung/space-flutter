class ApiRoute {
  static const String baseUrl = 'https://dev.sniperfactory.com/';

// 로그인 회원가입 비밀번호 찾기
  static const String loginAPi = "${baseUrl}api/auth/login";
  static const String signupAPi = "${baseUrl}api/auth/signup";

  static const String forgetPasswordApi = "${baseUrl}api/auth/verify-email";
  static const String changePasswordApi = "${baseUrl}api/auth/change-password";
  static const String profileApi = "${baseUrl}api/me/profile";

// 홈 화면

  static const String homeBannerApi = "${baseUrl}api/course";
  static const String homeSpacerRankApi = "${baseUrl}api/rank?month=10";

// 마이페이지 관련
  static const String MypageMeApi = "${baseUrl}api/me/";

// 톡톡
// 특정 톡톡 가져오기 생성 삭제
  static const String talkAllApi = "${baseUrl}api/talk";
  static const String createTalkApi = "${baseUrl}api/talk";

  static const String talkApi = "${baseUrl}api/talk/";
  static const String talkCreateApi = "${baseUrl}api/talk/";

// 모각
// 특정 모각 가져오기 생성 삭제
  static const String mogakApi = "${baseUrl}api/mogak/";
  static const String mogakCreateApi = "${baseUrl}api/mogak";

  static const String mogakTopApi = "${baseUrl}api/top/mogak/";
  static const String mogakTalkApi = "${baseUrl}api/talk";

  static const String avatarUploadApi = "${baseUrl}api/upload";
  static const String mogakLikeApi = "${baseUrl}api/up";

  // 캐치업 가져오기
  static const String catchApi = "${baseUrl}api/catchup?filter=";
  static const String catchLikeApi = "${baseUrl}api/up";
  static const String catchTopApi = "${baseUrl}api/top/catchup";
}


// 작명 규칙 해당 해당 라우트명 + 기능명 + Api
// ex) 로그인 페이지 : loginApi