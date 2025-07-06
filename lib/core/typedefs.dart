import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

typedef ImageDataCallback =  Function(File? file, Uint8List? bytes);
typedef VoidImageDataCallback = void Function(File? file, Uint8List? bytes);
typedef WidgetImageDataCallback = Widget Function(File? file, Uint8List? bytes);
