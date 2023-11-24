import 'package:flutter_translatable/flutter_translatable.dart';
import 'package:args/args.dart';

void main(List<String> arguments) {
  final argParser = ArgParser()
    ..addOption('output-to', defaultsTo: 'strings')
    ..addOption('empty-values', defaultsTo: 'false');

  final argResults = argParser.parse(arguments);
  final output = argResults['output-to'];
  final emptyValues = bool.parse(argResults['empty-values'], caseSensitive: false);

  FlutterTranslatable.extractStrings(output, emptyValues);
}
