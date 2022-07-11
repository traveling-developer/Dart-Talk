import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

String _filePath = 'data/sample.json';

Future<void> readWithIsolate() async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_readFileAsync, receivePort.sendPort);
  String fileData = await receivePort.first as String;

  dynamic jsonData = jsonDecode(fileData);

  print('Number of JSON keys: ${jsonData.length} (isolate)');
}

Future<String> _readFileAsync(SendPort p) async {
  final file = File(_filePath);
  final contents = await file.readAsString();
  Isolate.exit(p, contents.trim());
}
