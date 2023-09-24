import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_package/data/adapters/user_adapter.dart';
import 'package:hive_package/ui/hive_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox('myBox');
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox('userInfo');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('mainga kirdi');
    }
    return const MaterialApp(
      home: AddLocalStorage()
    );
  }
}
