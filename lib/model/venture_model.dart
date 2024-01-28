import 'dart:convert';

List<Venture> ventureFromJson(String str) =>
    List<Venture>.from(json.decode(str).map((x) => Venture.fromJson(x)));

String ventureToJson(List<Venture> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Venture {
  final String description;
  final int employeeCount;
  final String founderName;
  final fundingRounds;
  final fundingStatus;
  final dynamic incorporationDate;
  final incorporationType;
  final String industryCategory;
  final String investor;
  final String location;
  final String logoIconSrc;
  final String rating;
  final String type;
  final int valuation;
  final int ventureId;
  final String ventureName;

  Venture({
    required this.description,
    required this.employeeCount,
    required this.founderName,
    required this.fundingRounds,
    required this.fundingStatus,
    required this.incorporationDate,
    required this.incorporationType,
    required this.industryCategory,
    required this.investor,
    required this.location,
    required this.logoIconSrc,
    required this.rating,
    required this.type,
    required this.valuation,
    required this.ventureId,
    required this.ventureName,
  });

  factory Venture.fromJson(Map<String, dynamic> json) => Venture(
        description: json["description"],
        employeeCount: json["employeeCount"],
        founderName: json["founder_name"],
        fundingRounds: json["fundingRounds"],
        fundingStatus: json["fundingStatus"],
        incorporationDate: json["incorporationDate"],
        incorporationType: json["incorporationType"],
        industryCategory: json["industryCategory"],
        investor: json["investor"],
        location: json["location"],
        logoIconSrc: json["logo_icon_src"],
        rating: json["rating"],
        type: json["type"],
        valuation: json["valuation"],
        ventureId: json["venture_id"],
        ventureName: json["venture_name"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "employeeCount": employeeCount,
        "founder_name": founderName,
        "fundingRounds": fundingRounds,
        "fundingStatus": fundingStatus,
        "incorporationDate": incorporationDate,
        "incorporationType": incorporationType,
        "industryCategory": industryCategory,
        "investor": investor,
        "location": location,
        "logo_icon_src": logoIconSrc,
        "rating": rating,
        "type": type,
        "valuation": valuation,
        "venture_id": ventureId,
        "venture_name": ventureName,
      };
}
