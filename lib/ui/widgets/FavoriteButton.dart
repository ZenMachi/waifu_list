import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key, this.name, this.iconSize}) : super(key: key);
  final String? name;
  final double? iconSize;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  static const favoritedKey = 'favorite_key';

  late bool favorited;

  @override
  void initState() {
    super.initState();
    getBool();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      setState(() {
        favorited = !favorited;
        addBool();
        final snackBar = SnackBar(
            content: Text(
                favorited ? 'Yay ${widget.name} liked :)' : 'nuff :('
            )
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }, icon:  Icon(
      favorited ? Icons.favorite_rounded : Icons.favorite_border_rounded,
      color: favorited ? Colors.red : Colors.white,
      size: widget.iconSize,)
    );
  }

  void addBool() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(favoritedKey, favorited);
  }
  void getBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favorited = prefs.getBool(favoritedKey) ?? false;
    setState(() {
      this.favorited = favorited;
    });

  }

}