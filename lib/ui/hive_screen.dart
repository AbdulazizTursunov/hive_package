import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'hive_second_example.dart';

class AddLocalStorage extends StatefulWidget {
  const AddLocalStorage({super.key});

  @override
  State<AddLocalStorage> createState() => _AddLocalStorageState();
}

class _AddLocalStorageState extends State<AddLocalStorage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build statega kirdi');
    }
    final createData = Hive.box('myBox');
    if (kDebugMode) {
      print('quti ochildi kirdi');
    }

    return Scaffold(
      appBar: AppBar(title: const Text('local hive')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.yellow),
              )),
            ),
            const SizedBox(height: 50),
            IconButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('tapga kirdi');
                  }
                  setState(() {});
                  createData.add(controller.text);
                  if (kDebugMode) {
                    print('hivega saqladi');
                  }
                },
                icon: const Icon(Icons.add)),
            const SizedBox(height: 50),
            ListView.builder(
                shrinkWrap: true,
                itemCount: createData.values.length,
                itemBuilder: (context, index) =>
                    Text(createData.values.toList()[index]))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.telegram),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HiveAddModel(),
              ));
        }
      ),
    );
  }
}
