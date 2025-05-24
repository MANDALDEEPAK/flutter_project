import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloudinary_response.freezed.dart';
part 'cloudinary_response.g.dart';


@freezed
class CloudinaryResponse with _$CloudinaryResponse {
  const factory CloudinaryResponse({
    required String secure_url,
    required String public_id,
}) = _CloudinaryResponse;

  factory CloudinaryResponse.fromJson(Map<String, dynamic> json) => _$CloudinaryResponseFromJson(json);
}
