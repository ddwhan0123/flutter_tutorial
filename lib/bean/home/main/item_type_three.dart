class HomeTypeThreeBean {
  String momentCreateTime; //文章创建时间
  String momentReadingVolume; //文章阅读量
  String monentCommentCount; //评论总量
  String userHeaderImg; //头像地址
  String username; //用户名
  String momentTitleString; //文章创建时间
  int userIdentity; //用户类型
  List<String> photoWall; //图片墙
  String tipsString;//主题色样式的热点文字

  HomeTypeThreeBean(
      {this.momentCreateTime,
      this.momentReadingVolume,
      this.monentCommentCount,
      this.userHeaderImg,
      this.userIdentity,
      this.momentTitleString,
      this.username,
      this.photoWall,
      this.tipsString});
}
