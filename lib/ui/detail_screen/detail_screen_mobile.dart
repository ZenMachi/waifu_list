import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:waifu_list/model/waifu_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waifu_list/ui/widgets/GalleryButtonWidgets.dart';

import '../widgets/FavoriteButton.dart';

class DetailScreenMobile extends StatefulWidget {
  const DetailScreenMobile({Key? key, this.waifu, this.fav, required this.variant}) : super(key: key);
  final FavoriteList? fav;
  final WaifuList? waifu;
  final String variant;

  @override
  State<DetailScreenMobile> createState() => _DetailScreenMobileState();
}

class _DetailScreenMobileState extends State<DetailScreenMobile> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:
    Container(
      decoration: const BoxDecoration(color: Color(0xfffffbff)),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: 50.h,
                  width: 100.w,
                  decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                      child: getImage()
                  )
              ),
              SizedBox(
                height: 50.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: () {
                            Navigator.pop(context);
                          }, icon: const Icon(Icons.arrow_back_rounded, color: Colors.white,)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FavoriteButton(variant: widget.variant, name: returnCharaName(),),
                              GalleryButton(imgSrc: returnImgSrc())
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 18, bottom: 20),
                        child: getName()
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 18, top: 30, right: 18, bottom: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Info', style: GoogleFonts.roboto(textStyle: const TextStyle(color: Color(0xff1c1b1e)), fontSize: 24)),
                const SizedBox(height: 8,),
                getInfo()
              ],
            ),
          )
        ],
      ),
    ),
    );
  }

  Text getName() {

    if( widget.variant == 'waifu') {
      return Text(widget.waifu!.name, style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white, fontSize: 28)));
    } else {
      return Text(widget.fav!.name, style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white, fontSize: 28)));
    }
  }

  Image getImage() {
    if( widget.variant == 'waifu') {
      return Image.asset(widget.waifu!.image, fit: BoxFit.cover,);
    } else {
      return Image.asset(widget.fav!.image, fit: BoxFit.cover,);
    }
  }

  Text getInfo() {
    if( widget.variant == 'waifu') {
      return Text(widget.waifu!.info, style: GoogleFonts.roboto(textStyle: const TextStyle(height: 1.5, color: Color(0xff1c1b1e)), fontSize: 14));
    } else {
      return Text(widget.fav!.info, style: GoogleFonts.roboto(textStyle: const TextStyle(height: 1.5, color: Color(0xff1c1b1e)), fontSize: 14));
    }
  }

  String returnCharaName() {

    if( widget.variant == 'waifu') {
      return widget.waifu!.name;
    } else {
      return widget.fav!.name;
    }
  }

  List<String> returnImgSrc() {

    if( widget.variant == 'waifu') {
      return widget.waifu!.imageUrls;
    } else {
      return widget.fav!.imageUrls;
    }
  }
}
