import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/data/book_data.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:go_router/go_router.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // sizedbox widget
    return SizedBox(
      height: 350,
      // Carouselview widget
      child: CarouselView(
        itemSnapping: true,
          enableSplash: true,
          elevation: 10,
          shape: RoundedRectangleBorder(),
          itemExtent: 120,
          onTap: (a){
          context.pushNamed(AppRoute.details.name,extra: books[a]);
          },
          children: books.map((d){
            // column widget
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image widget
              CachedNetworkImage(
                errorWidget: (c,s,o) {
                  return Center(child: Icon(Icons.info));
                },
                //placeholder: (c,s) => Center(child: CircularProgressIndicator()),
                  imageUrl: d.image,
              ),
              // text widget
              Text(d.detail),
            ],
            );
          }).toList()
      ),

    );
  }
}
