import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception_data_model.freezed.dart';
part 'exception_data_model.g.dart';

@freezed
class ExceptionDataModel with _$ExceptionDataModel {
  const factory ExceptionDataModel({
    String? code,
    String? error,
    String? detail,
    @Default([]) List<ExceptionDataMessageModel> messages,
  }) = _ExceptionDataModel;

  factory ExceptionDataModel.fromJson(Map<String, Object?> json) =>
      _$ExceptionDataModelFromJson(json);
}

@freezed
class ExceptionDataMessageModel with _$ExceptionDataMessageModel {
  const factory ExceptionDataMessageModel({
    String? tokenClass,
    String? tokenType,
    String? message,
  }) = _ExceptionDataMessageModel;

  factory ExceptionDataMessageModel.fromJson(Map<String, Object?> json) =>
      _$ExceptionDataMessageModelFromJson(json);
}
