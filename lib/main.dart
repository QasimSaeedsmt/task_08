import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_08/screens/main_screen.dart';
import 'package:task_08/services/hive_db.dart';
import 'bloc/person_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDB.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => PersonBloc(),
        child: const MainScreen(),
      ),
    );
  }
}
