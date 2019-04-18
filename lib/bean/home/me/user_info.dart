class UserInfo {
  String userName; //用户名
  String userType; //用户认证类型
  String userScore; //用户积分
  String signNumeber; //签到天数
  String userHeaderImg; //用户头像地址

  UserInfo(
      {this.userName,
      this.userType,
      this.userScore,
      this.signNumeber,
      this.userHeaderImg});
}
