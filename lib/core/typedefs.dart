import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef ImageDataCallback = Function(XFile? xFile);
typedef VoidImageDataCallback = void Function(XFile? file);
typedef WidgetImageDataCallback = Widget Function(XFile? xFile);
