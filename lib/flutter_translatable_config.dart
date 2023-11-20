// List of file paths locations for processing.
const List<String> inputPaths = [
  './test_dir',
  './test_dir2',
];

// String representing the output directory for processed results.
const String outputPath = './assets/i18n';

// List of strings patterns to be excluded during processing.
const List<String> excludedStrings = [
  'dart:',
  '.dart',
  '.jpg',
  '.jpeg',
  '.png',
];

// Flag indicating whether to leave the value empty or made it equal to key.
const bool makeValueEmpty = false;
