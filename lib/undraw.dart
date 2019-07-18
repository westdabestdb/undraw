library undraw;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:undraw/illustrations.dart';
export 'package:undraw/illustrations.dart';
class UnDraw extends StatelessWidget {
  UnDraw(
      {Key key,
      @required this.illustration,
      @required this.color,
      this.semanticLabel,
      this.alignment = Alignment.center,
      this.fit = BoxFit.contain,
      this.colorBlendMode,
      this.height,
      this.width,
      this.placeholder,
      this.padding})
      : assert(illustration != null),
        assert(color != null);
  final UnDrawIllustration illustration;
  final Color color;
  final String semanticLabel;
  final AlignmentGeometry alignment;
  final BoxFit fit;
  final BlendMode colorBlendMode;
  final double height;
  final double width;
  final Widget placeholder;
  final EdgeInsets padding;

  Future<String> getSvgString(url) async {
    http.Response response = await http.get(url);
    return response.body;
  }

  Future<SvgPicture> renderIllustration(String name, Color _exColor) async {
    var nameSplit = name.toString().split("UnDrawIllustration.");
    var illustration =
        illustrationList.where((i) => i["identifier"] == nameSplit[1]);
    String url = illustration.toList()[0]["url"];
    String image = await getSvgString(url);

    String valueString = color.toString().split('(0x')[1].split(')')[0];
    valueString = valueString.substring(2, valueString.length);
    image = image.replaceAll("#6c63ff", "#" + valueString);
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
        child: FutureBuilder(
      future: renderIllustration(illustration.toString(), color),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: padding ?? EdgeInsets.all(16),
            child: snapshot.data,
          );
        } else {
          return Center(
            child: placeholder ?? CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
