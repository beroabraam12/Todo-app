import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/component/new_todo.dart';
import 'package:todo/models/todo.dart';

class ListPage extends StatefulWidget {
  static final routeName = "/";
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Todo> todos = [
    Todo(
      id: "1",
      name: "Todo1 here is my first todo ever in my life",
      desc: "dasdasdasdasdasdasdasdas",
      date: DateTime.now(),
      time: TimeOfDay.now(),
      image: "assets/cart.png",
      color: Color(0xFFFEA64C),
    ),
    Todo(
      id: "2",
      name: "Todo1 here is my first todo ever in my life",
      desc: "dasdasdasdasdasdasdasdas",
      date: DateTime.now(),
      time: TimeOfDay.now(),
      image: "assets/gm.png",
      color: Color(0xFFFE1E9A),
    ),
    Todo(
      id: "3",
      name: "Todo1 here is my first todo ever in my life",
      desc: "dasdasdasdasdasdasdasdas",
      date: DateTime.now(),
      time: TimeOfDay.now(),
      image: "assets/location.png",
      color: Color(0xFF254DDE),
    ),
  ];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  addTodos(id, color, name, date, desc, selectIcon, time) {
    setState(() {
      todos.add(Todo(
        id: id.toString(),
        color: color,
        name: name,
        date: date,
        desc: desc,
        image: selectIcon,
        time: time,
        done: false,
      ));
    });
    Navigator.of(context).pop();
    setState(() {});
  }

  bool editMode = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              setState(() {
                editMode = !editMode;
              });
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Icon(Icons.done),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    const Color(0xFFFE1E9A),
                    const Color(0xFF254DDE),
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Icon(
                Icons.calendar_today,
                color: Color(0xffFE1E9A),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              scaffoldKey.currentState.showBottomSheet(
                (context) {
                  return NewTodo(addTodos);
                },
              );
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Icon(Icons.add),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    const Color(0xFF00FFFF),
                    const Color(0xFF254DDE),
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        bottomOpacity: 0,
        toolbarOpacity: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Image.asset("assets/nav.png"),
            onPressed: () {},
          ),
        ],
        title: Text(
          "TODO",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
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
                                child: CircleAvatar(
                                  backgroundColor: todos[i].color,
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
                          editMode
                              ? Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: mediaQuery.size.height * 0.02,
                                    ),
                                    Checkbox(
                                        value: todos[i].done == null
                                            ? false
                                            : todos[i].done,
                                        onChanged: (val) {
                                          setState(() {
                                            todos[i].done = val;
                                            print(val);
                                          });
                                        })
                                  ],
                                )
                              : Column(
                                  children: <Widget>[
                                    SizedBox(
                                        height: mediaQuery.size.height * 0.02),
                                    Text(
                                      DateFormat("d MMM")
                                          .format(todos[i].date)
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        height: mediaQuery.size.height * 0.02),
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
