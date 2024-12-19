import 'dart:io';

import 'package:args/args.dart';
import 'package:font_icon_to_flutter/font_icon_to_flutter.dart';
import 'package:path/path.dart' as path;

const _parserKey = 'type';
const _inputKey = 'input';
const _outputKey = 'output';
const _fontFamilyKey = 'font-family';
const _fontPackageKey = 'font-package';
const _classNameKey = 'class-name';
const _helpKey = 'help';

const _parserIconlyIo = 'iconlyio';
const _parserLucide = 'lucide';
const _parserFontAwesome = 'fontawesome';

final _argParser = ArgParser()
  ..addOption(
    _parserKey,
    abbr: 't',
    mandatory: true,
    valueHelp: 'name',
    allowedHelp: {
      _parserIconlyIo: 'Iconly.io CSS File',
      _parserLucide: 'Lucide.dev static CSS File',
      _parserFontAwesome: 'FontAwesome.com static CSS File',
    },
    help: 'Parser type.',
  )
  ..addOption(
    _inputKey,
    abbr: 'i',
    mandatory: true,
    valueHelp: 'path',
    help: 'Path to the input file (iconly.io css file).',
  )
  ..addOption(
    _outputKey,
    abbr: 'o',
    valueHelp: 'path',
    help: 'Path to the output file (Dart class). If omitted, prints to stdout.',
  )
  ..addOption(
    _fontFamilyKey,
    abbr: 'f',
    mandatory: true,
    valueHelp: 'name',
    help: 'Font family to use (as specified in your pubspec.yaml).',
  )
  ..addOption(
    _fontPackageKey,
    abbr: 'p',
    valueHelp: 'name',
    help: 'Package name for the font if it part of a custom package.',
  )
  ..addOption(
    _classNameKey,
    abbr: 'c',
    defaultsTo: 'FontIcon',
    valueHelp: 'name',
    help: 'Name of the generated class.',
  )
  ..addFlag(
    _helpKey,
    abbr: 'h',
    help: 'Show this help message and exit.',
    callback: (b) {
      if (b) {
        _printHelp();
        exit(0);
      }
    },
  );

Future<void> main(List<String> args) async {
  final parsedArgs = _argParser.parse(args);

  final parserArg = parsedArgs[_parserKey] as String;
  final inputArg = parsedArgs[_inputKey] as String;
  final outputArg = parsedArgs[_outputKey] as String?;
  final classNameArg = parsedArgs[_classNameKey] as String? ?? 'FontIcon';
  final fontFamilyArg = parsedArgs[_fontFamilyKey] as String;
  final fontPackageArg = parsedArgs[_fontPackageKey] as String?;

  final inputPath = path.join(Directory.current.path, inputArg);
  final inputFile = File(inputPath);
  final inputContent = await inputFile.readAsString();

  var result = '';
  switch (parserArg) {
    case _parserIconlyIo:
      result = IconClassGenerator.fromIconlyIo(
        className: classNameArg,
        fontFamily: fontFamilyArg,
        fontPackage: fontPackageArg,
        content: inputContent,
      );
    case _parserLucide:
      result = IconClassGenerator.fromLucide(
        className: classNameArg,
        fontFamily: fontFamilyArg,
        fontPackage: fontPackageArg,
        content: inputContent,
      );
    case _parserFontAwesome:
      result = IconClassGenerator.fromFontAwesome(
        className: classNameArg,
        fontFamily: fontFamilyArg,
        fontPackage: fontPackageArg,
        content: inputContent,
      );
    default:
      print('Unknown parser type');
      exit(-1);
  }

  if (outputArg == null) {
    print(result);
  } else {
    final outputPath = path.join(Directory.current.path, outputArg);
    final outputFile = File(outputPath);
    await outputFile.writeAsString(result);
  }
}

void _printHelp() {
  print('''
font_icon_to_flutter
Translate your CSS Font Icon to Dart for your Flutter Project.

Common command:
  font_icon_to_flutter -i iconly.css

Usage: font_icon_to_flutter <arguments>

Global options:''');
  print(_argParser.usage);
}
