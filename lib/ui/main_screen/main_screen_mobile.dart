import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:waifu_list/model/waifu_list.dart';
import '../detail_screen.dart';

class WaifuListMobile extends StatelessWidget {
  const WaifuListMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 18, top: 56, bottom: 18),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Waaifu', style: TextStyle(fontSize: 45),),
              SizedBox(height: 15.h,),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('My Personal Favorite', style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 24, color: Color(0xff1c1b1e))),),
                    const SizedBox(height: 24,),
                    //Waifu List Inkwell
                    SizedBox(
                        height: 190,
                        child: ListView.builder(
                            itemCount: favoriteWaifuList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final FavoriteList fav = favoriteWaifuList[index];
                              return Container(
                                margin: const EdgeInsets.only(right: 12),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return DetailScreen(fav: fav, variant: 'fav',);
                                    }));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 120,
                                          width: 150,
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                            child: Image.asset(fav.image, fit: BoxFit.cover,),
                                          ),
                                        ),
                                        const SizedBox(height: 8,),
                                        Container(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text(fav.name, style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 14), fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                                          child: Text(fav.source, style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 12))),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                    ),
                    SizedBox(height: 5.h,),
                    Text('Waifu List', style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 24, color: Color(0xff1c1b1e))),),
                    const SizedBox(height: 24,),
                    //Waifu List InkWell
                    SizedBox(
                        height: 190,
                        child: ListView.builder(
                            itemCount: waifuList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final WaifuList waifu = waifuList[index];
                              return Container(
                                margin: const EdgeInsets.only(right: 12),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return DetailScreen(waifu: waifu, variant: 'waifu',);
                                    }));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 120,
                                          width: 150,
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                            child: Image.asset(waifu.image, fit: BoxFit.cover,),
                                          ),
                                        ),
                                        const SizedBox(height: 8,),
                                        Container(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text(waifu.name, style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 14), fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                                          child: Text(waifu.source, style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 12))),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}