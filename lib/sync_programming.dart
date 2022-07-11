import 'dart:convert';
import 'dart:io';

String _filePath = 'data/sample.json';

void readSync() {
  final fileData = _readFileSync();
  dynamic jsonData = jsonDecode(fileData);

  print('Number of JSON keys: ${jsonData.length} (sync)');
}

String _readFileSync() {
  final file = File(_filePath);
  final contents = file.readAsStringSync();
  return contents.trim();
}
