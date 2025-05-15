import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_provider.g.dart';



@riverpod
class FileController extends _$FileController {
  @override
  File? build() {
    return null;
  }
  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      state = File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
  }
}
