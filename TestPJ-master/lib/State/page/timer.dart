import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test1/utility/my_constant.dart';

class Timer extends StatefulWidget {
  Timer({Key? key}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  DateTime mydatetime = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE d MMMM y');

    return time(formatter, now);
  }

  Scaffold time(DateFormat formatter, DateTime now) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        // padding: EdgeInsets.all(10),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     Text(
        //       '${now.day} ${now.month} ${now.year}',
        //       style: Myconstat().h4Style(),
        //     ),
        //     Text('เวลา ${now.hour} ${now.minute} ${now.second} วินาที')
        //   ],
        // ),
        padding: EdgeInsets.all(20),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: <Widget>[
            Text(
              '${formatter.format(mydatetime)}',
              style: Myconstat().h4Style(),
            ),
            Text(
              'เวลา ${now.hour}:${now.minute}:${now.second}',
              style: Myconstat().h4Style(),
            )
          ],
        ),
      ),
    );
  }
}
