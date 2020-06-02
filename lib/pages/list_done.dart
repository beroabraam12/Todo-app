import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo.dart';

class ListDonePage extends StatefulWidget {
  static final routeName = '/doneList';
  @override
  _ListDonePageState createState() => _ListDonePageState();
}

class _ListDonePageState extends State<ListDonePage> {
  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<Todo>(context);
    final todos = todoData.doneTodos;
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "DONE TASKS",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {},
        child: Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.only(bottom: mediaQuery.size.height * 0.07),
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: mediaQuery.size.height * 0.02,
                        left: mediaQuery.size.width * 0.03,
                        right: mediaQuery.size.width * 0.03),
                    width: mediaQuery.size.width * 0.8,
                    height: mediaQuery.size.height * 0.11,
                    child: Card(
                      color: Colors.white,
                      elevation: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: mediaQuery.size.width * 0.02),
                                width: mediaQuery.size.width * 0.03,
                                child: Icon(
                                  Icons.done,
                                  color: todos[i].color,
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: mediaQuery.size.width * 0.05,
                                  ),
                                  width: mediaQuery.size.width * 0.12,
                                  height: mediaQuery.size.width * 0.12,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(todos[i].image),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: mediaQuery.size.width * 0.03,
                          ),
                          Center(
                            child: Container(
                              width: mediaQuery.size.width * 0.55,
                              child: Text(
                                todos[i].name,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: mediaQuery.size.width * 0.03,
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(height: mediaQuery.size.height * 0.02),
                              Text(
                                DateFormat("d MMM")
                                    .format(todos[i].date)
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: mediaQuery.size.height * 0.02),
                              Text(
                                "${todos[i].time.hour.toString()}:${todos[i].time.minute.toString()}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
