import 'package:advanced_widgets/views/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'business/theme_state.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeState>(
      create: (BuildContext context) => ThemeState(), child: WeatherApp()));
}
