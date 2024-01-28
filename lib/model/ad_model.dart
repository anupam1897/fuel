import 'dart:convert';

List<Ad> adFromJson(String str) =>
    List<Ad>.from(json.decode(str).map((x) => Ad.fromJson(x)));

String adToJson(List<Ad> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ad {
  final int adId;
  final String adImage;

  Ad({
    required this.adId,
    required this.adImage,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        adId: json["ad_id"],
        adImage: json["ad_image"],
      );

  Map<String, dynamic> toJson() => {
        "ad_id": adId,
        "ad_image": adImage,
      };
}
