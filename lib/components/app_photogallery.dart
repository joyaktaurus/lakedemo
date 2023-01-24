import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


// ignore: must_be_immutable
class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    Key? key,
    this.isEdit = true,
    this.loadingBuilder,
    required this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    required this.initialIndex,
    required this.imageType,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  })  : pageController = PageController(initialPage: initialIndex),
        super(key: key);

  final bool? isEdit;
  LoadingBuilder? loadingBuilder;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final String imageType;
  final PageController pageController;
  final dynamic galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  int? currentIndex = 0;
  String? imageType;
  String? selecteditem;
  @override
  void initState() {
    currentIndex = widget.initialIndex;
    imageType = widget.imageType;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.galleryItems.length,
              loadingBuilder:
                  (BuildContext? context, ImageChunkEvent? loadingProgress) {
                return const Center(child: CircularProgressIndicator());
              },

              //widget.loadingBuilder,
              //backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Image ${currentIndex! + 1} / ${widget.galleryItems.length}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  decoration: null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    if (widget.galleryItems[index] != null) {
      //_imageType == 'file'
      // widget.galleryItems[index].toString().contains("com.workhorse.qrcodescanner")) { //scanner.workhorse
      selecteditem = widget.galleryItems[index].path; //.path;
    } else {
      selecteditem = widget.galleryItems[index].url;
    }
    //final String item  = widget.galleryItems[index].path;
    return widget.galleryItems[index].path != null
        //_imageType == 'file'
        ? PhotoViewGalleryPageOptions(
            imageProvider: FileImage(File(
                selecteditem!)), // NetworkImage('https://demo.wo.instio.co/wo/general/images?filename=5c419931169aae5fdadade33/images/6ifEZDTsG4lZ8bZ8WA0A.png'),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 1.1,
            heroAttributes: PhotoViewHeroAttributes(tag: index),
          )
        : PhotoViewGalleryPageOptions(
            imageProvider: const NetworkImage(''),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 1.1,
            heroAttributes: PhotoViewHeroAttributes(tag: index),
          );
  }
}
