import 'dart:io';

void main() {
  final dir = Directory('lib/features');
  for (var file in dir.listSync(recursive: true)) {
    if (file is File && file.path.endsWith('.dart')) {
      var content = file.readAsStringSync();
      var newContent = content.replaceAll("'../../core", "'../../../core");
      newContent = newContent.replaceAll("'../../shared", "'../../../shared");
      if (content != newContent) {
        file.writeAsStringSync(newContent);
        print('Fixed ${file.path}');
      }
    }
  }
}
