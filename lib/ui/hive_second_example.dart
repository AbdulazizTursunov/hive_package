import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_package/data/model/user_model.dart';

class HiveAddModel extends StatefulWidget {
  const HiveAddModel({super.key});

  @override
  State<HiveAddModel> createState() => _HiveAddModelState();
}

class _HiveAddModelState extends State<HiveAddModel> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userInfo = Hive.box('userInfo');
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  userInfo.deleteFromDisk();
                  setState(() { });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.teal,
                ))
          ],
          title: const Text('Hive Model Add Screen'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: name,
                decoration: InputDecoration(
                    label: const Text('name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.yellow),
                    )),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: surname,
                decoration: InputDecoration(
                    label: const Text('sur name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.yellow),
                    )),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: const Text('age'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.yellow),
                    )),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: ListView.builder(
                    itemCount: userInfo.values.length,
                    itemBuilder: (context, index) {
                      final List<UserModel> users = userInfo.values.toList().cast();
                      if (kDebugMode) {
                        print(users);
                      }
                      return ListTile(
                        onLongPress: () {
                          if (kDebugMode) {
                            print(users);
                          }
                          setState(() {});
                          userInfo.values.toList()[index].delete();
                        },
                        title: Text(users[index].name),
                        subtitle: Text(users[index].surname),
                        trailing: Text(users[index].age.toString()),
                      );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () {
              setState(() {});
              userInfo.add(UserModel(
                  name: name.text.trim(),
                  age: int.parse(age.text),
                  surname: surname.text));
            }));
  }
}
