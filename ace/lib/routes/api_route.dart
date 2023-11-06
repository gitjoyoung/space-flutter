class ApiRoute {
  static const String baseUrl = 'https://dev.sniperfactory.com/';
  static const String login = "${baseUrl}api/auth/login";
  static const String signup = "${baseUrl}api/auth/signup";


  static const String forgetPassword = "${baseUrl}api/auth/verify-email";
  static const String changePassword = "${baseUrl}api/auth/change-password";


// 특정 모각 가져오기 생성 삭제
  static const String mogak = "${baseUrl}api/mogak/";
  static const String topMogak = "${baseUrl}api/top/mogak/";

  static const String avatarUpload = "${baseUrl}api/upload";

}
