// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      name: json['name'] as String,
      age: json['age'] as int,
      gender: $enumDecode(_$EnumGenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'gender': _$EnumGenderEnumMap[instance.gender]!,
    };

const _$EnumGenderEnumMap = {
  EnumGender.male: 'male',
  EnumGender.female: 'female',
};
