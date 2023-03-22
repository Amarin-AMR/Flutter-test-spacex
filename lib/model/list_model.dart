import 'package:json_annotation/json_annotation.dart';

part 'list_model.g.dart';

@JsonSerializable(createToJson: false)
class ListModel {
  // links patch small,large
  // static_fire_date_utc
  // success
  // name
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'static_fire_date_utc')
  DateTime? fireDate;

  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'details')
  String? details;

  ListModel(
    this.name,
    this.fireDate,
    this.success,
  );

  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);
}
