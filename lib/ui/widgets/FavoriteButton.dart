import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key, required this.variant, this.name, this.iconSize,}) : super(key: key);
  final String? name;
  final double? iconSize;
  final String variant;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
      //Shared Preference Remain

  // static const favoritedKey = 'favorite_key';
  // static const charaKey = 'chara_name';

  late bool favorited;

  final _likedBox = Hive.box('liked_chara');

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      setState(() {
        favorited = !favorited;
        addData();
        showSnackbar();
      });
    },
      icon:  Icon(
      favorited ? Icons.favorite_rounded : Icons.favorite_border_rounded,
      color: favorited ? Colors.red : Colors.white,
      size: widget.iconSize,),
    );
  }

  void addData() async {
        //Well SharedPreferences kinda sucks to me

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool(favoritedKey, favorited);
    // prefs.setString(charaKey, widget.name!);
    await _likedBox.put(widget.name, {'liked' : favorited, 'char' : widget.name});
  }
  void getData() async {
        //Well SharedPreferences kinda sucks to me

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    var getChara = await _likedBox.get(widget.name);
    favorited = getChara?['liked'] ?? false;
    if (getChara?['char'] == widget.name && getChara?['liked'] == true) {
      setState(() {
        favorited = favorited;
      });
    } else {
      setState(() {
        favorited = false;
      });
    }
  }

  showSnackbar () {
    final snackBar = SnackBar(
        content: Text(
            favorited ? 'Yay ${widget.name} liked :)' : 'nuff :('
        )
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}