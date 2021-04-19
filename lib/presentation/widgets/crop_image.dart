import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:flutter_cinema/common/constants/string_constants.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';
import 'package:flutter_cinema/common/injector/injector.dart';
import 'package:flutter_cinema/presentation/bloc/loader_bloc/bloc.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';

class CropImage extends StatefulWidget {
  final File file;
  final double aspectRatio;
  final Function(File) callback;

  CropImage({this.file, this.aspectRatio = 1 / 1, this.callback});

  @override
  _CropImageState createState() => _CropImageState();
}

class _CropImageState extends State<CropImage> {
  final cropKey = GlobalKey<CropState>();
  final _loaderBloc = Injector.container<LoaderBloc>();

  Future<void> _cropImage() async {
    final scale = cropKey.currentState.scale;
    final area = cropKey.currentState.area;
    if (area == null) {
      return;
    }
    _loaderBloc.add(StartLoading());
    final sample = await ImageCrop.sampleImage(
      file: widget.file,
      preferredSize: (1000 / scale).round(),
      preferredHeight: 200,
      preferredWidth: 200,
    );

    final file = await ImageCrop.cropImage(
      file: sample,
      area: area,
    );
    _loaderBloc.add(FinishLoading());
    if (file != null) {
      widget.callback?.call(file);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Crop.file(
              widget.file,
              key: cropKey,
              aspectRatio: widget.aspectRatio,
              alwaysShowGrid: false,
              scale: 1,
              maximumScale: 1,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  onPressed: _cropImage,
                  child: Text(
                    StringConstants.done,
                    style: ThemeText.button.copyWith(
                      color: Colors.white,
                      fontSize: 25.sp,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
