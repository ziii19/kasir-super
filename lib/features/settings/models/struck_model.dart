import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'struck_model.g.dart';

@JsonSerializable()
class StruckModel extends Equatable {
  final String? desc;
  final String? message;

  const StruckModel({
    this.desc,
    this.message,
  });

  factory StruckModel.fromJson(Map<String, dynamic> json) =>
      _$StruckModelFromJson(json);

  Map<String, dynamic> toJson() => _$StruckModelToJson(this);

  @override
  List<Object?> get props => [desc, message];
}
