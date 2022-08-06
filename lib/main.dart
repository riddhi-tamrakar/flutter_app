import 'package:assignmentapp/providers/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/style/theme.dart';
import 'feature/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightThemeData(context),
        home: const HomeScreen(),
      ),
    );
  }
}
