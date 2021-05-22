# undraw/UnDraw

UnDraw is a Flutter widget that provides [700+ illustrations](https://undraw.co/illustrations), designed by [Katerina Limpitsouni](https://twitter.com/ninalimpi) and developed by [westdabestdb](https://www.instagram.com/westdabestdb/).

![](https://media.giphy.com/media/MBf2NBhUXaEufSZFfa/giphy.gif)

## Getting Started
Add this to your package's `pubspec.yaml` file:
```
...
dependencies:
  undraw: ^1.1.0
```

Now in your Dart code, you can use:
```
import 'package:undraw/undraw.dart';
```

## Usage
```
UnDraw(
  color: Colors.red,
  illustration: UnDrawIllustration.mobile_application,
  placeholder: Text("Illustration is loading..."), //optional, default is the CircularProgressIndicator().
  errorWidget: Icon(Icons.error_outline, color: Colors.red, size: 50), //optional, default is the Text('Could not load illustration!').
)
```
