import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  String? title;
  List<DescriptionData>? rows;

  DataModel({this.title, this.rows});

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

@JsonSerializable()
class DescriptionData {
  String? title;
  String? description;
  String? imageHref;

  DescriptionData({
    this.title,
    this.description,
    this.imageHref,
  });

  factory DescriptionData.fromJson(Map<String, dynamic> json) =>
      _$DescriptionDataFromJson(json);
  Map<String, dynamic> toJson() => _$DescriptionDataToJson(this);
}
