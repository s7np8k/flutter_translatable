import 'package:flutter_translatable/flutter_translatable_config.dart';
import 'dart:io';

class FlutterTranslatable {
  static Future<List<String>> readDartFilesInDirectories() async {
    List<String> fileContents = [];

    for (var directoryPath in inputPaths) {
      await _readFilesRecursively(directoryPath, fileContents);
    }

    return fileContents;
  }

  static Future<void> _readFilesRecursively(
      String directoryPath, List<String> fileContents) async {
    var directory = Directory(directoryPath);

    await for (var entity in directory.list(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        try {
          String content = await entity.readAsString();
          fileContents.add(content);
        } catch (e) {
          print('Error reading file ${entity.path}: $e');
          // You might want to handle the error based on your specific use case.
        }
      }
    }
  }

  static Future<void> extractStrings(String outputFile) async {
    var filesContents = await readDartFilesInDirectories();
    // Extract the string inside single or double quotes
    final regex = RegExp(r'''(?:'([^']*)'|"([^"]*)")''', unicode: true);
    List extractedStrings = [];
    for (String fileContent in filesContents) {
      Iterable<RegExpMatch> matches = regex.allMatches(fileContent);
      List<String?> extracted =
          matches.map((match) => match.group(1) ?? match.group(2)).toList();
      extractedStrings = [...extractedStrings, ...extracted];
    }

    // Remove strings defined by excludedStrings list
    extractedStrings.removeWhere((element) => excludedStrings
        .any((value) => element!.contains(value) || element.isEmpty));
    // Remove duplicates
    extractedStrings = extractedStrings.toSet().toList();

    final jsonFile = File(outputFile);
    jsonFile.writeAsStringSync('{\n');
    for (var extractedString in extractedStrings) {
      jsonFile.writeAsStringSync(
          '  "$extractedString": "${makeValueEmpty ? '' : extractedString}"${extractedStrings.last == extractedString ? '' : ','}\n',
          mode: FileMode.append);
    }
    jsonFile.writeAsStringSync('}\n', mode: FileMode.append);
  }
}
