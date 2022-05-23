import 'package:flutter/material.dart';
import 'package:ui/ui/todo/screen/other/upload_task.dart';
import 'package:ui/ui/todo/screen/other/worker_screen.dart';
import 'package:ui/ui/todo/widgets/constant.dart';
import 'package:ui/ui/todo/widgets/drawer_screen.dart';
import 'package:ui/ui/todo/widgets/task_widgets.dart';

class TodoHomeScreen extends StatefulWidget {
  TodoHomeScreen({Key? key}) : super(key: key);

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  int _index = 0;
    List page = [ ListView.builder(itemBuilder: (context, index) {
        return TodoTaskWidgets();
      }), TodoWorkersScreen(), TodoUploadTaskScreen()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task "),
        actions: [
          IconButton(
              onPressed: () {
                popupDialog(context);
              },
              icon: Icon(Icons.filter_list_outlined))
        ],
      ),
      drawer: TodoDrawerWidget(),
      body:page[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "All task"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "My Account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.workspaces_outline), label: "Add task"),
        ],
        onTap: (index) {
        
          setState(() {
            _index = index ;
          });
        },
      ),
    );
  }

  popupDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Task Categories"),
            content: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: Constants.taskCategoriesList.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_rounded,
                                  color: Colors.pinkAccent),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child:
                                    Text(Constants.taskCategoriesList[index]),
                              )
                            ],
                          ));
                    })),
            actions: [
              TextButton(onPressed: () {}, child: Text("close")),
              TextButton(onPressed: () {}, child: Text("cancel filter")),
            ],
          );
        });
  }
}
