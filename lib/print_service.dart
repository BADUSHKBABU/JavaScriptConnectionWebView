
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:print/print_service.dart';
import 'dart:ui' as ui;


import 'dart:typed_data';

import 'package:flutter/cupertino.dart';


class ImageconProvider with ChangeNotifier
{
  Uint8List _image=Uint8List(0);
  Uint8List get   image=>_image;

   imageconverter(Uint8List img)
  {
    _image=img;
    notifyListeners();
  }


}