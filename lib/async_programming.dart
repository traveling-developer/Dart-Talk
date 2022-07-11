import 'dart:convert';
import 'dart:io';

String _filePath = 'data/sample.json';

Future<void> readAsync() async {
  final fileData = await _readFileAsync();
  dynamic jsonData = jsonDecode(fileData);

  print('Number of JSON keys: ${jsonData.length} (async)');
}

Future<String> _readFileAsync() async {
  final file = File(_filePath);
  final contents = await file.readAsString();
  return contents.trim();
}
