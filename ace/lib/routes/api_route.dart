class ApiRoute {
  static const String baseUrl = 'https://dev.sniperfactory.com/';
  static const String loginAPi = "${baseUrl}api/auth/login";
  static const String signupAPi = "${baseUrl}api/auth/signup";

  static const String forgetPasswordApi = "${baseUrl}api/auth/verify-email";
  static const String changePasswordApi = "${baseUrl}api/auth/change-password";


// 홈

  static const String homeBannerApi = "${baseUrl}api/course";


// 특정 모각 가져오기 생성 삭제
  static const String mogakApi = "${baseUrl}api/mogak/";
  static const String mogakCreateApi = "${baseUrl}api/mogak";

  static const String mogakTopApi = "${baseUrl}api/top/mogak/";
  static const String mogakTalkApi = "${baseUrl}api/talk";

  static const String avatarUploadApi = "${baseUrl}api/upload";
  static const String mogakLikeApi = "${baseUrl}api/up";

  //프로필 가져오기

  static const String profileApi = "${baseUrl}api/profile/";
}


// 작명 규칙 해당 해당 라우트명 + 기능명 + Api
// ex) 로그인 페이지 : loginApi