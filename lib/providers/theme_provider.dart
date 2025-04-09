import 'package:flutter_riverpod/flutter_riverpod.dart';





class ThemeProvider extends Notifier<bool>{
  @override
  bool build() {
   return false;
  }

  void toggle(){
    state = !state;
  }

}

final themeProvider = NotifierProvider<ThemeProvider , bool>(() => ThemeProvider());