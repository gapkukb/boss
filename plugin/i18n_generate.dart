import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart' as yaml;
// import 'package:watcher/watcher.dart';

final cached = Map<String, String>();

class Struct {
  String output = '';
}

String capitalize(String name) {
  return name[0].toUpperCase() + name.substring(1);
}

String generatePropertis(Map value, Struct struct, String prefix) {
  value.entries.forEach((entry) {
    if (entry.value is Map) {
      generatePropertis(entry.value, struct, '${prefix}${entry.key}_');
    } else {
      struct.output += '\tfinal ${prefix}${entry.key} = \'${entry.value}\'.tr;\n';
    }
  });

  return struct.output;
}

generateClass(String filePath) {
  final struct = Struct();
  final String fileName = path.basenameWithoutExtension(filePath);
  final file = File(filePath);
  final content = file.readAsStringSync();

  if (content.isEmpty) return;

  Map decoded = yaml.loadYaml(
    file.readAsStringSync() ?? '',
  );

  final className = capitalize(fileName);

  struct.output += 'class _$className {\n';
  // struct.output += '\t_${className}._(); \n';
  generatePropertis(decoded, struct, '');
  struct.output += '}\n\n';

  cached[fileName] = struct.output;
}

generate() {
  String output = '// Auto genarated file,do not edit\n\n';
  output += "import 'package:get/get.dart';\n\n";

  cached.entries.forEach((entry) {
    output += entry.value;
  });

  output += 'abstract class I18N {\n';
  output += '\tI18N._(); \n';

  cached.entries.forEach((entry) {
    output += '\tstatic final ${entry.key} = _${capitalize(entry.key)}();\n';
  });

  output += '}\n\n';

  final file = File('lib/generated/I18N.g.dart');
  file.createSync(recursive: true);
  file.writeAsStringSync(
    output,
    mode: FileMode.writeOnly,
  );
}

void main() async {
  print(Directory.current);
  var dir = Directory(Directory.current.path + '/assets/locales/en');

  dir.listSync().forEach((file) {
    print("${file.path} auto generated;");
    generateClass(file.path);
  });

  generate();

  var watcher = await dir.watch();
  watcher.listen((event) {
    print("${event.path} has been changed and generated;");
    generateClass(event.path);
    generate();
  });

  await Future.delayed(Duration(days: 1));
}
