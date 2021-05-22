library undraw;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:undraw/illustrations.dart';

export 'package:undraw/illustrations.dart';

class UnDraw extends StatelessWidget {
  UnDraw({
    Key? key,
    required this.illustration,
    required this.color,
    this.semanticLabel,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
    this.colorBlendMode = BlendMode.srcIn,
    this.height,
    this.width,
    this.placeholder,
    this.errorWidget,
    this.padding,
  });

  final UnDrawIllustration illustration;
  final Color color;
  final String? semanticLabel;
  final AlignmentGeometry alignment;
  final BoxFit fit;
  final BlendMode colorBlendMode;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final EdgeInsets? padding;

  String _illustrationToString(UnDrawIllustration illustration) {
    return illustration.toString().split('.').last;
  }

  Future<String> _getSvgString(url) async {
    final response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future<SvgPicture> _renderIllustration(
    UnDrawIllustration illustration,
    Color color,
  ) async {
    final data = illustrationList.firstWhere(
      (i) => i['identifier'] == _illustrationToString(illustration),
    );

    var image = await _getSvgString(data['url']);
    image = image.replaceAll('#6c63ff', '#${color.value.toRadixString(16)}');

    return SvgPicture.string(
      image,
      height: height,
      width: width,
      alignment: alignment,
      colorBlendMode: colorBlendMode,
      fit: fit,
      semanticsLabel: semanticLabel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SvgPicture>(
        future: _renderIllustration(illustration, color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: padding ?? EdgeInsets.all(16),
              child: snapshot.data,
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            print(snapshot.stackTrace);
            return Center(
              child: errorWidget ?? Text('Could not load illustration!'),
            );
          } else {
            return Center(
              child: placeholder ?? CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
