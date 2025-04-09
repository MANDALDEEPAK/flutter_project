

import 'package:flutter_proj/models/animate_instance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'animate.g.dart';

@riverpod
class Animate extends _$Animate {
  @override
   AnimateInstance build() {
    return AnimateInstance.initial();
  }
  void change({
  double? size,
  double? opacity,
  double? radius,
}
){
    state =state.copyWith(
      opacity: opacity ?? state.opacity,
      size: size ?? state.size,
      radius: radius ?? state.radius,

    );
}
}
