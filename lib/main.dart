import 'package:flutter/material.dart';
import 'package:flutter_state/pages/home.dart';
import 'package:flutter_state/provider/counter_provider.dart';
import 'package:flutter_state/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ThemeProvider()
        ),
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        )
      ],
      builder: (context, child) {
        final provider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          theme: provider.theme,
          home: HomePage(),
        );
      },
    );
  }
}
