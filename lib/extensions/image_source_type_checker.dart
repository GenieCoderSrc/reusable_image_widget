extension ImageSourceExtension on String {
  bool get isAssetPath {
    // Check if the path starts with 'assets/', which is common for asset paths
    return startsWith('assets/');
  }
}
