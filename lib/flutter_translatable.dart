import 'package:flutter_translatable/flutter_translatable_config.dart';
import 'package:glob/glob.dart';
import 'dart:io';
import 'package:glob/list_local_fs.dart';

class FlutterTranslatable {
  static Future<List<FileSystemEntity>> getFiles(String pattern) async {
    Glob glob = Glob(pattern);
    List<FileSystemEntity> files = await glob.listSync();
    return files;
  }

  static Future<void> extractStrings(String outputFile) async {
    final fileContent = File('test.dart').readAsStringSync();
    // Extract the string inside single or double quotes
    final regex = RegExp(r'''(?:'([^']*)'|"([^"]*)")''', unicode: true);
    final matches = regex.allMatches(fileContent);

    List<String?> extractedStrings =
        matches.map((match) => match.group(1) ?? match.group(2)).toList();
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
