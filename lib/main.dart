import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main ()
{
  runApp(TodoApp());
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class TodoItem{
  String data = "";
  bool isCompleted = false;

  TodoItem(String item, bool flag){
    data = item;
    isCompleted = flag;
  }
  void toggle(){
    isCompleted = !isCompleted;
    print(isCompleted);
  }
}
class _TodoAppState extends State<TodoApp> {

  List <TodoItem> tasks =[];
  TextEditingController listItemController = TextEditingController();
  @override
 void addTask(){
    setState(() {
      tasks.add(TodoItem(listItemController.text, false));
      listItemController.clear();
    });

  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bhai kaam krlo"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget> [
                Row(children: [
                  Expanded(flex: 3, child: TextField(
                      controller: listItemController,
                      decoration: InputDecoration(hintText: "Enter item here"))),  //expanded is added so that button takes less space. ratio is defined here
                  Expanded(flex: 1, child: ElevatedButton(
                  child: Text("Add"),
                  onPressed: addTask))
                ]),
                ListView.builder(
                  shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, idx ){
                      return ListTile(
                        onTap: (){
                          setState(() {
                            tasks[idx].toggle();
                          });
                        },
                          title: Text
                        ('\u2022 '+ tasks[idx].data,style: TextStyle(
                              fontSize: 16,
                              height: 1.55,
                          decoration: tasks[idx].isCompleted? TextDecoration.lineThrough: TextDecoration.none
                            )));
                  }),
                Image.asset("assets/images/RP.png",
                height: 300, width:300)
              ]
            ),
          )
        )
      )
    );
  }
}
