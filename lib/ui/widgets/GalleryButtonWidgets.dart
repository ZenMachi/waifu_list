import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryButton extends StatefulWidget {
  const GalleryButton({Key? key, required this.imgSrc}) : super(key: key);
  final List<String> imgSrc;

  @override
  State<GalleryButton> createState() => _GalleryButtonState();
}

class _GalleryButtonState extends State<GalleryButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (builder) {
        return PhotoContent(imgSrc: widget.imgSrc,);
      }));
    }, icon: const Icon(Icons.collections_rounded, color: Colors.white,));
  }

  testButton() {
    return widget.imgSrc.map((url) {
      return Container(
        child: PhotoView(
          imageProvider: NetworkImage(url),
        ),
      );
    });
  }
}

class PhotoContent extends StatefulWidget {
  const PhotoContent({Key? key, required this.imgSrc}) : super(key: key);
  final List<String> imgSrc;

  @override
  State<PhotoContent> createState() => _PhotoContentState();
}

class _PhotoContentState extends State<PhotoContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoViewGallery.builder(
          itemCount: widget.imgSrc.length,
          builder: (BuildContext context, int index) {
           return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(widget.imgSrc[index], scale: 0.8)
            );
          })
    );
  }
}
