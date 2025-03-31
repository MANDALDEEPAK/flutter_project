import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/app_theme/app_sizes.dart';

import '../models/book_models.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage({super.key,required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
              image: NetworkImage(book.image),
          ),
        ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(book.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Column(
                      children: [
                        Text(book.rating),
                        Text(book.genre),
                      ],
                    ),
                  ],
                ),
                AppSizes.gapH20,
                Text(book.detail),
                AppSizes.gapH20,
                AppSizes.gapH20,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){}, child: Text('Read Book')),
                    ElevatedButton(onPressed: (){}, child: Text('More Info')),
                  ],
                ),
              ],
                        ),
                      ),
                    ),
            ),
      ),


      // Stack(
      //   children: [
      //     Column(
      //       children: [
      //         CachedNetworkImage(imageUrl: book.image),
      //       ],
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       child: Container(
      //         height: 500,
      //         color: Colors.white,
      //         child: SingleChildScrollView(
      //           child: Padding(
      //             padding: const EdgeInsets.all(10.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(book.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      //                     Column(
      //                       children: [
      //                         Text(book.rating),
      //                         Text(book.genre),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //                 AppSizes.gapH20,
      //                 Text(book.detail),
      //                 AppSizes.gapH20,
      //
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     ElevatedButton(onPressed: (){}, child: Text('Read Book')),
      //                     ElevatedButton(onPressed: (){}, child: Text('More Info')),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),


    );
  }
}


//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_proj/app_theme/app_sizes.dart';
//
// import '../models/book_models.dart';
//
// class DetailPage extends StatelessWidget {
//   final Book book;
//   const DetailPage({super.key,required this.book});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               CachedNetworkImage(imageUrl: book.image),
//             ],
//           ),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               height: 500,
//               color: Colors.white,
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(book.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                           Column(
//                             children: [
//                               Text(book.rating),
//                               Text(book.genre),
//                             ],
//                           ),
//                         ],
//                       ),
//                       AppSizes.gapH20,
//                       Text(book.detail),
//                       AppSizes.gapH20,
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ElevatedButton(onPressed: (){}, child: Text('Read Book')),
//                           ElevatedButton(onPressed: (){}, child: Text('More Info')),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
