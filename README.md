font_icon_to_flutter
===

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

---

Cli app to translate your CSS Font Icon to Dart for your Flutter Project.

## Man

```
font_icon_to_flutter
Translate your CSS Font Icon to Dart for your Flutter Project.

Common command:
  font_icon_to_flutter -i iconly.css

Usage: font_icon_to_flutter <arguments>

Global options:
-t, --type=<name> (mandatory)           Parser type.

          [fontawesome]                 FontAwesome.com static CSS File
          [iconlyio]                    Iconly.io CSS File
          [lucide]                      Lucide.dev static CSS File

-i, --input=<path> (mandatory)          Path to the input file (iconly.io css file).
-o, --output=<path>                     Path to the output file (Dart class). If omitted, prints to stdout.
-f, --font-family=<name> (mandatory)    Font family to use (as specified in your pubspec.yaml).
-p, --font-package=<name>               Package name for the font if it part of a custom package.
-c, --class-name=<name>                 Name of the generated class.
                                        (defaults to "FontIcon")
-h, --[no-]help                         Show this help message and exit.
```

## Credits

Developed with 💙 by [Valentin MICHALAK](https://vmichalak.com)