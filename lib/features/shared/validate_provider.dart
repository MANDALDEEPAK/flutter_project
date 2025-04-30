import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'validate_provider.g.dart';

@riverpod
class ValidateController extends _$ValidateController {
  @override
  AutovalidateMode build() {
    return AutovalidateMode.disabled;
  }
  void change (){
    state = AutovalidateMode.onUserInteraction;
  }
}
