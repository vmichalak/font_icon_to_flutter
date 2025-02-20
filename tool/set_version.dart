import 'dart:io';

void main(List<String> arguments) {
  final pubspecFile = File('pubspec.yaml');

  if (!pubspecFile.existsSync()) {
    print('pubspec.yaml file not found.');
    return;
  }
  final pubspecContent = pubspecFile.readAsStringSync();
  final versionRegex = RegExp(r'^version: (\d+\.\d+\.\d+)$', multiLine: true);
  final version = versionRegex.firstMatch(pubspecContent);

  if (version != null) {
    print('Version found: ${version.group(1)}');
    File('bin/version.dart').writeAsStringSync(
      "const String cliVersion = '${version.group(1)}';\n",
    );
  } else {
    print('Version not found in pubspec.yaml file.');
  }
}
