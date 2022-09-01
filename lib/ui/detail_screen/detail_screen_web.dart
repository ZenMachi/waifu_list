import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../model/waifu_list.dart';
import '../widgets/FavoriteButton.dart';

class DetailScreenWeb extends StatefulWidget {
  const DetailScreenWeb({
    Key? key, this.waifu, this.fav, required this.variant, this.height = 600, this.width = 600, this.imageHeight = 600, this.imageWidth = 600
  }) : super(key: key);

  final FavoriteList? fav;
  final WaifuList? waifu;
  final String variant;
  final double? height;
  final double? width;
  final double? imageHeight;
  final double? imageWidth;

  @override
  State<DetailScreenWeb> createState() => _DetailScreenWebState();
}

class _DetailScreenWebState extends State<DetailScreenWeb> {
  final _infoController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Waaifu', style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 57, color: Color(0xff1c1b1e)))),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 32),
              child: getName()
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    height: widget.imageHeight,
                    width: widget.imageWidth,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child:ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: getImage()
                    ),
                  ),
                  SizedBox(
                    height: widget.imageHeight,
                    width: widget.imageWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 0.h,),
                        Container(
                            padding: const EdgeInsets.only(right: 12, bottom: 12),
                            child: FavoriteButton(name: getNameSnackbar(), iconSize: 32,)
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: widget.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 330,
                      width: widget.width,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: const Color(0xffe9ddff),
                        child: Container(
                          margin: const EdgeInsets.all(36),
                          child: Column(
                            children: [
                              Text('Info', style: GoogleFonts.roboto(textStyle: const TextStyle(color: Color(0xff22005d)), fontSize: 32),),
                              const SizedBox(height: 10,),
                              SizedBox(
                                height: 200,
                                child: Scrollbar(
                                    controller: _infoController,
                                    child: ListView(
                                      controller: _infoController,
                                      children: [
                                        getInfo()
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 240,
                      width: widget.width,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: const Color(0xffe9ddff),
                        child: Container(
                          margin: const EdgeInsets.all(36),
                          child: Column(
                            children: [
                              Text('Source', style: GoogleFonts.roboto(textStyle: const TextStyle(color: Color(0xff22005d)), fontSize: 32),),
                              const SizedBox(height: 10,),
                              getSource()
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose () {
    _infoController.dispose();
    super.dispose();
  }

  String getNameSnackbar() {

    if( widget.variant == 'waifu') {
      return widget.waifu!.name;
    } else {
      return widget.fav!.name;
    }
  }

  Text getName() {

    if( widget.variant == 'waifu') {
      return Text(widget.waifu!.name, style: GoogleFonts.roboto(textStyle: const TextStyle(color: Color(0xff1c1b1e), fontSize: 32)));
    } else {
      return Text(widget.fav!.name, style: GoogleFonts.roboto(textStyle: const TextStyle(color: Color(0xff1c1b1e), fontSize: 32)));
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
      return Text(widget.waifu!.info, style: GoogleFonts.roboto(textStyle: const TextStyle(height: 1.4, color: Color(0xff22005d)), fontSize: 16), textAlign: TextAlign.justify,);
    } else {
      return Text(widget.fav!.info, style: GoogleFonts.roboto(textStyle: const TextStyle(height: 1.4, color: Color(0xff22005d)), fontSize: 16), textAlign: TextAlign.justify,);
    }
  }

  Text getSource() {
    if( widget.variant == 'waifu') {
      return Text(widget.waifu!.source, style: GoogleFonts.roboto(textStyle: const TextStyle(height: 1.5, color: Color(0xff22005d)), fontSize: 16), textAlign: TextAlign.justify,);
    } else {
      return Text(widget.fav!.source, style: GoogleFonts.roboto(textStyle: const TextStyle(height: 1.5, color: Color(0xff22005d)), fontSize: 16), textAlign: TextAlign.justify,);
    }
  }
}
