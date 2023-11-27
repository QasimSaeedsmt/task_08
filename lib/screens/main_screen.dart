import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_08/constants/string_resources.dart';

import '../bloc/person_bloc.dart';
import '../bloc/person_events.dart';
import '../models/userModel/person.dart';
import '../services/data_manager.dart';
import '../services/hive_db.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String dataFetched = StringResources.EMPTY_STRING;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PersonBloc>(context).add(FetchPersonEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringResources.MAIN_SCREEN_TITLE),
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveDB.box.listenable(),
        builder: (context, Box<Person> box, _) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final person = box.getAt(index);
              return ListTile(
                onTap: () async {
                  // HomeWidgetConfig.update(MyHomeWidget(), context);
                  DataManager().addDataToWidget(person!);
                },
                title: Text(person?.name ?? StringResources.EMPTY_STRING),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    person?.avatar ?? StringResources.EMPTY_STRING,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
