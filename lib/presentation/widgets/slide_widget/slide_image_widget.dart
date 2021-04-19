import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/image_constants.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/widgets/image_network_custom.dart';

class SlideImageWidget extends StatefulWidget {
  final List<String> imagePaths;
  final double slideHeight;
  final String baseURL;
  final CarouselController controller;

  SlideImageWidget({
    Key key,
    this.imagePaths,
    this.slideHeight,
    this.baseURL,
    this.controller,
  }) : super(key: key);

  @override
  _SlideImageWidgetState createState() => _SlideImageWidgetState();
}

class _SlideImageWidgetState extends State<SlideImageWidget> {
  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final slideHeight = widget.slideHeight ?? ScreenUtil.screenHeightDp / 2;
    final imageHeight = slideHeight;
    final canScroll = widget.imagePaths != null && widget.imagePaths.length > 1;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: slideHeight,
          child: CarouselSlider.builder(
            carouselController: widget.controller,
            options: CarouselOptions(
                enableInfiniteScroll: canScroll,
                height: slideHeight,
                aspectRatio: 2.0,
                enlargeCenterPage: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            itemCount: (widget.imagePaths.length).round(),
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                child: ImageNetworkCustom(
                  path: widget.imagePaths[index],
                  height: imageHeight,
                  boxFit: BoxFit.contain,
                  imageHolder: Image.asset(
                    ImageConstants.imageHolder,
                    height: imageHeight,
                    fit: BoxFit.contain,
                  ),
                  baseURL: widget.baseURL,
                ),
              );
            },
          ),
        ),
        Positioned(
          child: widget.imagePaths.length > 1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.imagePaths.map((url) {
                    final index = widget.imagePaths.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? AppColor.primaryColor
                            : AppColor.grey.withAlpha(100),
                      ),
                    );
                  }).toList(),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
