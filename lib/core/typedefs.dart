import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef ImageDataCallback = Function(XFile? xFile);
// typedef VoidImageDataCallback = void Function(XFile? file);
typedef VoidImageDataCallback = void Function(File? file);
// typedef WidgetImageDataCallback = Widget Function(File? xFile);
typedef WidgetImageDataCallback = Widget Function(XFile? xFile);
