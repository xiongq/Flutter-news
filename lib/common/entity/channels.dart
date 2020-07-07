/// 频道列表 response
class ChannelResponseEntity {
  String code;
  String title;
  String thumbnail;

  ChannelResponseEntity({
    this.code,
    this.title,
    this.thumbnail,
  });

  factory ChannelResponseEntity.fromJson(Map<String, dynamic> json) =>
      ChannelResponseEntity(
        code: json["code"],
        title: json["title"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
        "thumbnail": thumbnail,
      };
}
