import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_countries/providers/theme_provider.dart';
import 'package:world_countries/screens/home_screen.dart';
import 'package:world_countries/utils/theme/dart_theme.dart';
import 'package:world_countries/utils/theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        )
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.themeMode,
            home: const HomeScreen(),
          );
        }
      ),
    );
  }
}
