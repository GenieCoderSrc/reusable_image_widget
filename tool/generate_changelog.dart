import 'dart:io';

void main() {
  final changelogDir = Directory('changelog');
  if (!changelogDir.existsSync()) {
    print('⚠️ changelog directory not found.');
    exit(1);
  }

  final entries = changelogDir
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('.md'))
      .toList();

  entries.sort((a, b) => b.path.compareTo(a.path)); // Descending by version

  final buffer = StringBuffer();
  buffer.writeln('# 📄 CHANGELOG\n');
  buffer.writeln(
    'All notable changes to this project will be documented here.\n',
  );

  buffer.writeln('### 🕘 Versions\n');
  for (final entry in entries) {
    final version = entry.uri.pathSegments.last.replaceAll('.md', '');
    buffer.writeln(
      ' - [$version](https://github.com/${Platform.environment['GITHUB_REPOSITORY']}/blob/main/changelog/$version.md)',
    );
  }

  buffer.writeln('\n### 🔥 Latest Summary\n');
  buffer.writeln(entries.first.readAsStringSync());

  File('CHANGELOG.md').writeAsStringSync(buffer.toString());
  print('✅ CHANGELOG.md generated.');
}
