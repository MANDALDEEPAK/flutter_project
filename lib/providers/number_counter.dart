

import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:flutter_proj/providers/number_counter.dart';
part 'number_counter.g.dart';


@riverpod
class NumberCounter extends _$NumberCounter {
  @override
   double build() {
    return 200;
  }

  void change(double number){
    state = number;
  }
}


@riverpod
class NumberOpacity extends _$NumberOpacity {
  @override
   double build() {
    return 1;
  }
  void change(double number){
    if(state == 1){
      state = number;
    }else{
      state = 1;
    }

  }
}