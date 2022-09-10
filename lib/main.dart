import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:waifu_list/ui/main_screen.dart';

void main () async {
  await Hive.initFlutter();
  await Hive.openBox('liked_chara');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Waaifu',
        theme: ThemeData(),
        home: const MainScreen(),
      );
    }
    );
  }

}