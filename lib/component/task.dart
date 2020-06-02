import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todo.dart';

class TaskPopup {
  static showtaskDialog(BuildContext context, TodoModel todo) {
    final mediaQuery = MediaQuery.of(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: Colors.white,
          content: Container(
            width: mediaQuery.size.width * 0.7,
            height: mediaQuery.size.height * 0.5,
            child: Column(
              children: <Widget>[
                Container(
                  width: mediaQuery.size.width * 0.1,
                  height: mediaQuery.size.width * 0.1,
                  child: Image.asset(
                    todo.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.03,
                ),
                Text(
                  todo.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      DateFormat("d MMM").format(todo.date),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    SizedBox(
                      width: mediaQuery.size.width * 0.03,
                    ),
                    Text(
                      "${todo.time.hour.toString()}:${todo.time.minute.toString()}",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.04,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.01,
                ),
                Container(
                  width: mediaQuery.size.width * 0.65,
                  child: Text(
                    todo.desc,
                    textAlign: TextAlign.center,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    margin: EdgeInsets.only(top: mediaQuery.size.height * 0.02),
                    width: mediaQuery.size.width * 0.3,
                    height: (mediaQuery.size.height - mediaQuery.padding.top) *
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
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: mediaQuery.size.width * 0.03),
                        child: FittedBox(
                          child: Text(
                            "Done",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
