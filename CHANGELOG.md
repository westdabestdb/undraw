## [1.1.0]
* Null Safety migration
* Code refactor
## [1.0.2]

* Add errorWidget: This widget will be displayed when the future completes with an error. The default is a Text with an error message.
* Update the example to show a sample usage of errorWidget.
* Update example/pubspec.yaml to use a relative path of the package. This eliminates the need to update it with every release and allows to test the example app while developing and updating the package.
* Make `getSvgString` private since its only supposed to be used internally by the package and shouldn't be exposed as a public API.
* Use a constrained dependency for flutter_svg, which is the recommended way. This will increase the package's maintenance score to 100

## [1.0.1]

* Example app fix.
* Maintenance.

## [1.0.0]

* Initial major release.