import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';


@freezed
class Order with _$Order {

  const factory Order({
    @Default('')  @JsonKey(name: '_id') String id,
    required String userId,
    required int totalAmount,
    required List<OrderItem> orderItems
}) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

}


@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
   @Default('')  @JsonKey(name: '_id')  String id,
    required String title,
    required int qty,
    required String price,
    required String image
}) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}
