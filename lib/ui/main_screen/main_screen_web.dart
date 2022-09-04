import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../model/waifu_list.dart';
import '../detail_screen.dart';

class WaifuListWeb extends StatefulWidget {
  const WaifuListWeb({Key? key}) : super(key: key);

  @override
  State<WaifuListWeb> createState() => _WaifuListWebState();
}

class _WaifuListWebState extends State<WaifuListWeb> {
  final _scrollFav = ScrollController();
  final _scrollList = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StickyHeader (
        header: Container (
          width: 100.w,
          color: const Color(0xfffffbff),
          margin: EdgeInsets.only(left: 48, top: 48),
          child: Text('Waaifu', style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 57, color: Color(0xff1c1b1e)))),
        ),
        content: Container(
          margin: const EdgeInsets.only(bottom: 48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      Text('My Personal Favorite', style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 32, color: Color(0xff1c1b1e)))),
                      const SizedBox(height: 50,),
                      Scrollbar(
                        controller: _scrollFav,
                        child: SizedBox(
                            height: 180,
                            child: ListView.builder(
                                controller: _scrollFav,
                                shrinkWrap: true,
                                itemCount: favoriteWaifuList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final FavoriteList fav = favoriteWaifuList[index];
                                  return Container(
                                    margin: const EdgeInsets.only(right: 16),
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
                                              width: 180,
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
                      ),
                      SizedBox(height: 15.h,),
                      Text('Waifu List', style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 32, color: Color(0xff1c1b1e)))),
                      const SizedBox(height: 50,),
                      Scrollbar(
                        controller: _scrollList,
                        child: SizedBox(
                            height: 180,
                            child: ListView.builder(
                                controller: _scrollList,
                                shrinkWrap: true,
                                itemCount: waifuList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final WaifuList waifu = waifuList[index];
                                  return Container(
                                    margin: const EdgeInsets.only(right: 16),
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
                                              width: 180,
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
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    _scrollFav.dispose();
    _scrollList.dispose();
    super.dispose();
  }

}