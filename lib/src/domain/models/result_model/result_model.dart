import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@Freezed(genericArgumentFactories: true)
class ResultModel<T extends Object?> with _$ResultModel<T> {
  factory ResultModel({
    required int count,
    required List<T> data,
  }) = _ResultModel;

  factory ResultModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ResultModelFromJson(json, fromJsonT);
}
