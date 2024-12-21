import 'dart:convert';
import 'dart:io';

extension FileReader on String {
  Future<String> read() async {
    final filePath = 'test/resources/${toString()}';
    String text;
    try {
      text = await File(filePath).readAsString();
    } catch (e) {
      text = await File('/$filePath').readAsString();
    }

    return text;
  }

  Future<Map<String, dynamic>> readJsonDecode() async {
    final filePath = 'test/resources/${toString()}';
    String text;
    try {
      text = await File(filePath).readAsString();
    } catch (e) {
      text = await File('/$filePath').readAsString();
    }
    return jsonDecode(text);
  }
}
