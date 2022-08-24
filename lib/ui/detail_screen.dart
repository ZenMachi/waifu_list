import 'package:flutter/material.dart';
import 'package:waifu_list/model/waifu_list.dart';
import 'package:waifu_list/ui/detail_screen/detail_screen_web.dart';
import 'detail_screen/detail_screen_mobile.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key,  this.fav, this.waifu, required this.variant}) : super(key: key);
  final FavoriteList? fav;
  final WaifuList? waifu;
  final String variant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffbff),
      body: LayoutBuilder (
        builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth >= 1300) {
            return DetailScreenWeb(waifu: waifu,fav: fav, variant: variant,);
          } else if (constraints.maxWidth >= 1100) {
            return DetailScreenWeb(waifu: waifu, fav: fav, variant: variant, width: 400,);
          } else {
            return DetailScreenMobile(waifu: waifu, fav: fav, variant: variant,);
          }
      }
      )
    );
  }
}

