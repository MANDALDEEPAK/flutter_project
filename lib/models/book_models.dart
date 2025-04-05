//
// class Book {
//   final String  title;
//   final String detail;
//   final String image;
//   final String rating;
//   final String genre;
//
//
//   Book({
//     required this.title,
//     required this.detail,
//     required this.image,
//     required this.rating,
//     required this.genre,
//   });
//
//    factory Book.fromJson(Map<String,dynamic>json){
//      return Book(
//          title: json['title'],
//          detail: json['detail'],
//          image: json['image'],
//          rating: json['rating'],
//          genre: json['genre'],
//      );
//    }
// }
// //
// // class Post{
// //   final int userid;
// //   final int id;
// //   final String title;
// //   final String body;
// //
// //   Post({
// //     required this.userid,
// //     required this.id,
// //     required this.title,
// //     required this.body
// // });
// //
// //   factory Post.fromJson(Map<String,dynamic>json){
// //     return Post(
// //       userid: json['userid'],
// //         id: json['id'],
// //         title: json['title'],
// //         body: json['body'],
// //     );
// //   }
// // }
// //
// // class Complex{
// //   final int id;
// //   final String name;
// //   final String email;
// //   final Address address;
// //
// //   Complex({
// //     required this.address,
// //     required this.id,
// //     required this.name,
// //     required this.email,
// // });
// //   factory Complex.fromJson(Map<String,dynamic>json1){
// //     return Complex(
// //         address: Address.fromJason(json1['address']),
// //         id: json1['id'],
// //         name: json1['name'],
// //         email: json1['email'],
// //     );
// //   }
// // }
// //
// // class Address{
// //   final String street;
// //   final String city;
// //   final Geo geo;
// //
// //   Address({
// //     required this.city,
// //     required this.street,
// //     required this.geo,
// // });
// //   factory Address.fromJason(Map<String,dynamic>json2){
// //     return Address(
// //         city: json2['city'],
// //         street: json2['street'],
// //         geo: Geo.fromJson(json2['geo']),
// //     );
// //   }
// // }
// //
// // class Geo{
// //   final String lat;
// //   final String lan;
// //
// //   Geo({
// //     required this.lan,
// //     required this.lat,
// //   });
// //   factory Geo.fromJson(Map<String,dynamic>json3){
// //     return Geo(
// //         lan: json3['lan'],
// //         lat: json3[' lat'],
// //     );
// //   }
// //
// // }
// //
// //
// // class User{
// //   final int id;
// //   final String firstname;
// //   final String lastname;
// //   final Hair hair;
// //   final String ip;
// //   final Address1 address1;
// //   final Coordinates coordinates;
// //   final String country;
// //
// //   User({
// //     required this.coordinates,
// //     required this.id,
// //     required this.address1,
// //     required this.country,
// //     required this.firstname,
// //     required this.hair,
// //     required this.ip,
// //     required this.lastname,
// // });
// //   factory User.fromJson(Map<String,dynamic>us){
// //     return User(
// //         coordinates: us['coordinates'],
// //         id: us['id'],
// //         address: us['address'],
// //         country: us['country'],
// //         firstname: us['firstname'],
// //         hair: us['hair'],
// //         ip: us['ip'],
// //         lastname: us['lastname'],
// //     );
// //   }
// // }
// //
// // class Hair{
// //   final String color;
// //   final String type;
// //
// //   Hair({
// //     required this.color,
// //     required this.type,
// // });
// //   factory Hair.fromJson(Map<String,dynamic>ha){
// //     return Hair(
// //         color: ha['color'],
// //         type: ha['type']
// //     );
// //   }
// // }
// //
// // class Address1{
// //  final String address1;
// //  final String city;
// //  final String state;
// //  final String stateCode;
// //  final String postalCode;
// //
// //  Address1({
// //    required this.address1,
// //    required this.city,
// //    required this.postalCode,
// //    required this.state,
// //    required this.stateCode,
// // });
// //  factory Address1.fromJson(Map<String,dynamic>add){
// //    return Address1(
// //        address1: address1,
// //        city: city,
// //        postalCode: postalCode,
// //        state: state,
// //        stateCode: stateCode,
// //    );
// //  }
// // }
// //
// // class Coordinates{
// //   final String lat;
// //   final String lng;
// // }