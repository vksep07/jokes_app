import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:jokes_app/app/app.dart';
import 'package:jokes_app/utils/common_widgets/custom_theme.dart';

void main() {

  runApp(CustomTheme(
    initialThemeKey: MyThemeKeys.LIGHT,
    child: App(),
  ),);
}



