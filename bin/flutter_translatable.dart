import 'package:flutter_translatable/flutter_translatable.dart';
import 'package:args/args.dart';

void main(List<String> arguments) {
  final argParser = ArgParser()
    ..addOption('output', abbr: 'o', defaultsTo: 'strings.json');

  final argResults = argParser.parse(arguments);

  final outputFile = argResults['output'];

  FlutterTranslatable.extractStrings(outputFile);
}
