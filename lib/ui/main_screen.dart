import 'package:flutter/material.dart';
import 'package:waifu_list/ui/main_screen/main_screen_web.dart';
import 'main_screen/main_screen_mobile.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xfffffbff),
      body: LayoutBuilder (
        builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth < 900) {
            return const WaifuListMobile();
          } else {
            return const WaifuListWeb();
          }
        },
      )
    );
  }
}

