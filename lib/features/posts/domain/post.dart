import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.g.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required String title,
    required int views,
    required double userId,
    @Default([]) List<String> tags,
    @Default([]) List<String> reactions,
    @Default('not-available') String image,

}) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
