// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['_id'] as String? ?? '',
      userId: json['userId'] as String,
      totalAmount: (json['totalAmount'] as num).toInt(),
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'totalAmount': instance.totalAmount,
      'orderItems': instance.orderItems,
    };

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      id: json['_id'] as String? ?? '',
      title: json['title'] as String,
      qty: (json['qty'] as num).toInt(),
      price: json['price'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'qty': instance.qty,
      'price': instance.price,
      'image': instance.image,
    };
