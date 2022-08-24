import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:waifu_list/model/waifu_list.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreenMobile extends StatelessWidget {
  const DetailScreenMobile({Key? key, this.waifu, this.fav, required this.variant}) : super(key: key);
  final FavoriteList? fav;
  final WaifuList? waifu;
  final String variant;


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
                              FavoriteButton(name: getNameSnackbar(),),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.collections_rounded, color: Colors.white,)),
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

    if( variant == 'waifu') {
      return Text(waifu!.name, style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white, fontSize: 28)));
    } else {
      return Text(fav!.name, style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white, fontSize: 28)));
    }
  }

  Image getImage() {
    if( variant == 'waifu') {
      return Image.asset(waifu!.image, fit: BoxFit.cover,);
    } else {
      return Image.asset(fav!.image, fit: BoxFit.cover,);
    }
  }

  Text getInfo() {
    if( variant == 'waifu') {
      return Text(waifu!.info, style: GoogleFonts.roboto(textStyle: const TextStyle(height: 1.5, color: Color(0xff1c1b1e)), fontSize: 14));
    } else {
      return Text(fav!.info, style: GoogleFonts.roboto(textStyle: const TextStyle(height: 1.5, color: Color(0xff1c1b1e)), fontSize: 14));
    }
  }

  String getNameSnackbar() {

    if( variant == 'waifu') {
      return waifu!.name;
    } else {
      return fav!.name;
    }
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool favorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      setState(() {
        favorited = !favorited;
        final snackBar = SnackBar(
            content: Text(
                favorited ? 'Yay ${widget.name} liked :)' : 'nuff :('
            )
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }, icon:  Icon(
      favorited ? Icons.favorite_rounded : Icons.favorite_border_rounded,
      color: favorited ? Colors.red : Colors.white,)
    );
  }
}