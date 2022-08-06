// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      title: json['title'] as String?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => DescriptionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'title': instance.title,
      'rows': instance.rows,
    };

DescriptionData _$DescriptionDataFromJson(Map<String, dynamic> json) =>
    DescriptionData(
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageHref: json['imageHref'] as String?,
    );

Map<String, dynamic> _$DescriptionDataToJson(DescriptionData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imageHref': instance.imageHref,
    };
