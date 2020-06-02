import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todo.dart';

class NewTodo extends StatefulWidget {
  final addTodos;
  NewTodo(this.addTodos);
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  String selectIcon, name, desc;

  DateTime date;

  TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
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
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
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
                onPressed: () => selectIcon = "assets/location.png",
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              left: mediaQuery.size.width * 0.08,
            ),
            child: Text(
              "Name",
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
            ),
          ),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.08),
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
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.01,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            margin:
                EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.08),
            child: TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
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
                    initialDate: date != null ? date : DateTime.now(),
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
                            initialTime: time != null ? time : TimeOfDay.now())
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
                  margin: EdgeInsets.only(top: mediaQuery.size.height * 0.01),
                  width: mediaQuery.size.width * 0.3,
                  height:
                      (mediaQuery.size.height - mediaQuery.padding.top) * 0.05,
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
                        widget.addTodos(DateTime.now(),Color(0xFFFEA64C),name,date,desc,selectIcon,time);
                        
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: mediaQuery.size.width * 0.03),
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
  }
}
