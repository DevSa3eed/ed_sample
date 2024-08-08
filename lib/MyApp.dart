import 'package:ed_sample/core/util/custom_scroll_behavior.dart';
import 'package:ed_sample/core/util/generate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _setPreferredOrientations();
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          theme: _buildAppTheme(),
          debugShowCheckedModeBanner: false,
          builder: (context, child) => _buildAnnotatedRegion(child),
          initialRoute: Screens.SPLASH_PAGE,
          onGenerateRoute: GenerateScreen.onGenerate,
        );
      },
    );
  }

  void _setPreferredOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  ThemeData _buildAppTheme() {
    return ThemeData(
      fontFamily: "Roboto",
      primarySwatch: Colors.yellow,
    );
  }

  Widget _buildAnnotatedRegion(Widget? child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: child!,
      ),
    );
  }
}
