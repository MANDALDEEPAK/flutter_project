

import 'package:freezed_annotation/freezed_annotation.dart';

part 'animate_instance.freezed.dart';
part 'animate_instance.g.dart';


@freezed
class AnimateInstance with _$AnimateInstance {
  const factory AnimateInstance(
  {
    required double size,
    required double opacity,
    required double radius,
}
      ) = _AnimateInstance;

  factory AnimateInstance.fromJson(Map<String, dynamic> json) =>
      _$AnimateInstanceFromJson(json);

  factory AnimateInstance.initial() => AnimateInstance(
      size: 200,
      opacity: 1,
      radius: 10,
  );
}
