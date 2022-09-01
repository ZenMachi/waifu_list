import 'package:flutter/material.dart';


class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key, this.name, this.iconSize}) : super(key: key);
  final String? name;
  final double? iconSize;

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
      color: favorited ? Colors.red : Colors.white,
      size: widget.iconSize,)
    );
  }
}