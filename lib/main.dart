import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/database/app_database.dart';
import 'core/navigation_hub.dart';

void main() {
  // Ensure the Flutter engine bindings are ready before launching native bindings (SQLite)
  WidgetsFlutterBinding.ensureInitialized();

  // Create a single instance of the database to be shared app-wide
  final database = AppDatabase();

  runApp(
    Provider<AppDatabase>.value(value: database, child: const InvoisyncApp()),
  );
}

class InvoisyncApp extends StatelessWidget {
  const InvoisyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invoisync',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode
          .system, // Automatically adapts to iOS/Android dark mode settings
      home: const MainNavigationHub(),
    );
  }
}
