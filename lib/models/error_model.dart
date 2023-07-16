import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ErrorModel extends Equatable {
  const ErrorModel({
    this.statusCode,
    this.statusMessage,
    this.success,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);

  final int? statusCode;
  final String? statusMessage;
  final bool? success;

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
