import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maztafarma/core/constant/image_constant.dart';

class SlideshowWidget extends StatelessWidget {
  const SlideshowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: ((536.0 * screenWidth) / 1080.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CarouselSlider(
                options: CarouselOptions(
                    aspectRatio: 1080 / 360,
                    height: 598,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, value){
                      // widget.bloc!.setPages(index);
                    }
                ),
                items: ['https://lampungtoday.com/wp-content/uploads/2018/07/IKLAN-BANNER-SEAGEM-LT-2018-copy.jpg','https://ilmupc.com/wp-content/uploads/2020/04/cara-membuat-banner-iklan-sederhana-di-photoshop.jpg'].map((promo) {
                  return GestureDetector(
                    onTap: () {
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 268,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white, image: DecorationImage(image: AssetImage(placeholder))
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: promo,
                              placeholder: (context, url) => Image.asset(placeholder),
                              errorWidget: (context, url, error) => Image.asset(placeholder)
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                // onPageChanged: (index) {
                //   widget.bloc!.setPages(index);
                // },
              ),
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: map<Widget>(
          //           images,(index, url) {
          //           return
          //             Container(
          //               width: 8.0,
          //               height: 8.0,
          //               margin: EdgeInsets.symmetric(
          //                   vertical: 14.0, horizontal: 2.0),
          //               decoration: BoxDecoration(
          //                   shape: BoxShape.circle,
          //                   color: widget.bloc!.currPage == index
          //                       ? ColorRevamp.mediumGrey1
          //                       : ColorRevamp.mediumGrey1.withOpacity(0.25)),
          //             );
          //         },
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: (){},
          //         child: Container(
          //             margin: EdgeInsets.only(top: 4, bottom: 12),
          //             padding: EdgeInsets.symmetric(vertical: 6),
          //             child: Text('Lihat Semua Promo', style: TextStyle(fontSize: 16))
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
