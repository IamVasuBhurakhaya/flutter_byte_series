import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoGalleryPage extends StatefulWidget {
  const PhotoGalleryPage({super.key});

  @override
  _PhotoGalleryPageState createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<PhotoGalleryPage> {
  final List<String> imageList = [
    "https://img3.wallspic.com/crops/0/9/7/2/0/102790/102790-pasture-grassland-cloud-sky-season-1920x1080.jpg",
    "https://azbukadekor.ru/upload/iblock/666/6667602108cfdd4601705f7c76f6585a.jpg",
    "https://wallup.net/wp-content/uploads/2019/09/1017631-ligh-sun-lake-shadow-yoho-national-park-luminosity-spruces-mountains-flash-1.jpg",
    "https://images7.alphacoders.com/695/695186.jpg",
    "https://n-biz86.ru/800/600/https/i.artfile.ru/3456x2232_607958_%5Bwww.ArtFile.ru%5D.jpg",
    "https://i.pinimg.com/originals/11/ac/9e/11ac9e105ac2defe20535a3307cb2001.jpg",
    "https://fsd.multiurok.ru/html/2019/01/10/s_5c37480636665/1048065_1.jpeg",
    "https://www.chromethemer.com/download/hd-wallpapers/wicked-nature-4k-7680x4320.jpg",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImageViewer(
                    images: imageList,
                    initialIndex: selectedIndex,
                  ),
                ),
              );
            },
            child: Hero(
              tag: imageList[index],
              child: Image.network(
                imageList[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class FullScreenImageViewer extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenImageViewer({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PhotoViewGallery.builder(
        itemCount: images.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(images[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 3,
            heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
          );
        },
        pageController: PageController(initialPage: initialIndex),
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        enableRotation: true,
      ),
    );
  }
}
