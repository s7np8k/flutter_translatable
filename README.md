## Overview

This Dart CLI script is designed to extract all strings from Dart source files and export them to a JSON file.

## Features

- **String extraction**: The script scans Dart source files and extracts strings found within single quotes (`'`) or double quotes (`"`).

- **JSON export**: The extracted strings are exported to a JSON file.

## Roadmap

- [x] **String extraction**: Extraction of both single and double-quoted strings from Dart files.

- [x] **Export from multiple files**: Ability to process and export strings from multiple Dart files in a directory.

- [X] **Multiple JSON export**: Add support for exporting strings to multiple JSON files at once for different languages (e.g. `output-to=de,es,pt`).

- [x] **String Exclusion Options**: Add options to exclude specific strings from processing.

- [ ] **CLI Parameter for output directory**: Added a CLI parameter to specify the output directory for exported JSON files.

- [ ] **Nested directory support**: Extend the script to process Dart files in nested directories.

## License

This project is licensed under the [MIT License](LICENSE).