import 'package:flutter_translatable/flutter_translatable.dart';
import 'package:args/args.dart';

void main(List<String> arguments) {
  final argParser = ArgParser()
    ..addOption('output-to', defaultsTo: 'strings');

  final argResults = argParser.parse(arguments);
  final output = argResults['output-to'];

  FlutterTranslatable.extractStrings(output);
}
