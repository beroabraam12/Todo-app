import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  bool sheetOpen = false;
  String selectIcon, name, desc;
  DateTime date;
  TimeOfDay time;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {},
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
                  sheetOpen = true;
                  return Container(
                    color: Colors.white,
                    height: mediaQuery.size.height * 0.5,
                    width: mediaQuery.size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: mediaQuery.size.height * 0.04,
                            left: mediaQuery.size.width * 0.08,
                          ),
                          child: Text(
                            "New Task",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: mediaQuery.size.height * 0.01,
                            left: mediaQuery.size.width * 0.08,
                          ),
                          child: Text(
                            "Icon",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[400]),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: mediaQuery.size.width * 0.06,
                            ),
                            IconButton(
                              icon: Image.asset("assets/gm.png"),
                              onPressed: () => selectIcon = "assets/gm.png",
                            ),
                            IconButton(
                              icon: Image.asset("assets/ball.png"),
                              onPressed: () => selectIcon = "assets/ball.png",
                            ),
                            IconButton(
                              icon: Image.asset("assets/boling.png"),
                              onPressed: () => selectIcon = "assets/boling.png",
                            ),
                            IconButton(
                              icon: Image.asset("assets/cart.png"),
                              onPressed: () => selectIcon = "assets/cart.png",
                            ),
                            IconButton(
                              icon: Image.asset("assets/drink.png"),
                              onPressed: () => selectIcon = "assets/drink.png",
                            ),
                            IconButton(
                              icon: Image.asset("assets/location.png"),
                              onPressed: () =>
                                  selectIcon = "assets/location.png",
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: mediaQuery.size.width * 0.08,
                          ),
                          child: Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[400]),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: mediaQuery.size.width * 0.08),
                          child: TextFormField(
                            onChanged: (val) {
                              setState(() {
                                name = val;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: mediaQuery.size.height * 0.01,
                            left: mediaQuery.size.width * 0.08,
                          ),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[400]),
                          ),
                        ),
                        SizedBox(
                          height: mediaQuery.size.height * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          margin: EdgeInsets.symmetric(
                              horizontal: mediaQuery.size.width * 0.08),
                          child: TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                            ),
                            onChanged: (val) {
                              setState(() {
                                desc = val;
                              });
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate:
                                      date != null ? date : DateTime.now(),
                                  firstDate: DateTime(2020, 1),
                                  lastDate: DateTime(2020, 12),
                                ).then((pickedDate) {
                                  if (pickedDate == null) {
                                    return;
                                  }
                                  setState(() {
                                    date = pickedDate;
                                  });
                                  showTimePicker(
                                          context: context,
                                          initialTime: time != null
                                              ? time
                                              : TimeOfDay.now())
                                      .then((pickedTime) {
                                    if (pickedTime == null) {
                                      return;
                                    }
                                    setState(() {
                                      time = pickedTime;
                                    });
                                  });
                                });
                              },
                              child: Text(time == null || date == null
                                  ? "Choose Date & Time"
                                  : "${time.hour.toString()}:${time.minute.toString()} ${DateFormat("d MMM").format(date)}"),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: mediaQuery.size.height * 0.01),
                                width: mediaQuery.size.width * 0.3,
                                height: (mediaQuery.size.height -
                                        mediaQuery.padding.top) *
                                    0.05,
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
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      todos.add(Todo(
                                          id: DateTime.now().toString(),
                                          color: Color(0xFFFEA64C),
                                          name: name,
                                          date: date,
                                          desc: desc,
                                          image: selectIcon,
                                          time: time));
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            mediaQuery.size.width * 0.03),
                                    child: FittedBox(
                                      child: Text(
                                        "Add",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
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
        onTap: () {
          if (sheetOpen) {
            sheetOpen = false;
            Navigator.of(context).pop();
          }
        },
        child: Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          child: SafeArea(
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
    );
  }
}
