
// import 'package:json_annotation/json_annotation.dart';
part 'm_token.g.dart';

// @JsonSerializable(createToJson: false)
class MToken{
  String? token;

  MToken({this.token});

  factory MToken.fromJson(Map<String, dynamic> json) => _$MTokenFromJson(json);
}