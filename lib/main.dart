import 'package:flutter/material.dart';
import 'package:movie_app_demo/controller/api_provider.dart';
import 'package:movie_app_demo/view/pages/main_navigation.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart'; // ✅ Import Device Preview

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Set to false for release builds
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MovieProvider()),
          ChangeNotifierProvider(create: (context) => BottomProvider()),
          ChangeNotifierProvider(create: (context) => SearchProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      useInheritedMediaQuery: true, // ✅ Needed for Device Preview
      builder: DevicePreview.appBuilder, // ✅ Required for Device Preview
      home: MainNavigation(),
    );
  }
}
