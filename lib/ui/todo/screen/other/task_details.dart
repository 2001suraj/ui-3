import 'package:flutter/material.dart';

class TodoTaskDetails extends StatefulWidget {
  const TodoTaskDetails({Key? key}) : super(key: key);

  @override
  State<TodoTaskDetails> createState() => _TodoTaskDetailsState();
}

class _TodoTaskDetailsState extends State<TodoTaskDetails> {
  TextEditingController comment = TextEditingController();
  bool _iscomment = false;
  @override
  Widget build(BuildContext context) {
    bool vv = true;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Back"),
              ),
              Align(
                alignment: Alignment.center,
                child: Text("Human resource task"),
              ),
              Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Uploaded by "),
                        Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: CircleAvatar(
                                  radius: 33,
                                  child: Image(
                                    image: AssetImage('assets/images/man.png'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text("Mark Merchs"),
                                  Text("Team leader"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Uploaded on : "),
                        Text(" 2021-04-12 "),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Deadline date : "),
                        Text(" 2021-04-32 "),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Still have time",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    Divider(),
                    Text("Done state : "),
                    Row(
                      children: [
                        Text("Done "),
                        Text(
                          "Not Done yet ",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        Checkbox(
                            value: vv,
                            onChanged: (vv) {
                              setState(() {
                                vv = false;
                              });
                            })
                      ],
                    ),
                    Divider(),
                    Text("Task description :"),
                    Text(" description  for the task :"),
                    _iscomment
                        ? Row(
                            children: [
                              Flexible(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: TextField(
                                    maxLines: 6,
                                    controller: comment,
                                    maxLength: 300,
                                    decoration: InputDecoration(
                                        filled: true, fillColor: Colors.amber),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Flexible(
                                child: Column(
                                  children: [
                                    MaterialButton(
                                        color: Colors.pinkAccent,
                                        onPressed: () {},
                                        child: Text("Post")),
                                    SizedBox(height: 20),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _iscomment = !_iscomment;
                                          });
                                        },
                                        child: Text("cancel")),
                                  ],
                                ),
                              )
                            ],
                          )
                        : FlatButton(
                            color: Colors.pink,
                            onPressed: () {
                              setState(() {
                                _iscomment = !_iscomment;
                              });
                            },
                            child: Text("Add a comment"),
                          ),
                    Divider(),
                    ListView.separated(
                      shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return const ListTile(
                            leading: CircleAvatar(
                              radius: 20,
                              child: CircleAvatar(
                                radius: 16,
                                child: Image(
                                  image: AssetImage('assets/images/man.png'),
                                ),
                              ),
                            ),
                            title: Text("John form"),
                            subtitle: Text("Hello, this is comment 2 ."),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: 12),
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
