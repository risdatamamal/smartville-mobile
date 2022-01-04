import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../common/text_styles.dart';
import '../model/news_response.dart';

class ListPengumuman extends StatefulWidget {
  const ListPengumuman({Key? key, required this.pengumumanList})
      : super(key: key);

  final List<Datum> pengumumanList;
  @override
  _ListPengumumanState createState() => _ListPengumumanState();
}

class _ListPengumumanState extends State<ListPengumuman> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.pengumumanList.map((item) {
            return SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(children: [
                  ShaderMask(
                    shaderCallback: (rectangle) => const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xFF017262), Color(0x00017262)],
                    ).createShader(Rect.fromLTRB(
                      0,
                      0,
                      rectangle.width,
                      120,
                    )),
                    blendMode: BlendMode.multiply,
                    child: CachedNetworkImage(
                      imageUrl: item.fotoBerita!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.white,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.judulBerita ?? "",
                          style: primaryText.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            item.deskripsiBerita ?? "",
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            style: primaryText.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.pengumumanList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? const Color(0XFFF38263)
                      : const Color(0XFFA2A5A4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
