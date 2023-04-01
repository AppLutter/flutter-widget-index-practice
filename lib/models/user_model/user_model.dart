import 'package:flutter_widget_index_practice/enums/enum_gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
const factory  UserModel({
  required String name,
  required int age,
  required EnumGender gender,

})=_UserModel;

factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

