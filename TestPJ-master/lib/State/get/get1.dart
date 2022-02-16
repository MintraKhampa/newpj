import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/State/sw.dart/sw1.dart';
import 'package:test1/State/sw.dart/sw2.dart';
import 'package:test1/State/sw.dart/sw3.dart';
import 'dart:convert';
import 'dart:async';
import 'package:test1/State/update_todolist.dart';
import 'package:test1/utility/my_constant.dart';

class Get1 extends StatefulWidget {
  const Get1({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<Get1> {
  List todolistitems = [];
  List todolistitems2 = [];
  List todolistitems3 = [];
  String qrcode = 'Hi';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getTodolist();
    // getTodolist2();
    // getTodolist3();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myconstat.grey1,
      body: todolistCreate(),
    );
  }

  Widget todolistCreate() {
    return Column(
      children: [
        FutureBuilder(
            future: getTodolist(),
            builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
                ? ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          tileColor: Myconstat.white2,
                          title: Row(
                            children: [
                              Text("${snapshot.data[index]['qrname1']}"),
                              Spacer(),
                              Text('1'),
                              Icon(Icons.light),
                            ],
                          ),
                          // trailing: Icon(Icons.light),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Update1(
                                        snapshot.data[index]['id'],
                                        snapshot.data[index]['qrname1'],
                                        // todolistitems[index]['password']
                                      )),
                            ).then((value) => {
                                  setState(() {
                                    print(value);
                                    if (value == 'delete') {
                                      final snackBar = SnackBar(
                                        content: const Text('ลบเรียบร้อยแล้ว'),
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                    getTodolist();
                                  })
                                });
                          },
                        ),
                      );
                    })
                : Container(
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    // child: Center(
                    //   child: CircularProgressIndicator(
                    //     color: Colors.green,
                    //   ),
                    // ),
                    )),
        FutureBuilder(
            future: getTodolist2(),
            builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
                ? Container(
                    child: Column(children: [
                    ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        // itemCount: snapshot.data!.length,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              tileColor: Myconstat.white2,
                              title: Row(
                                children: [
                                  Text("${snapshot.data[index]['qrname2']}"),
                                  Spacer(),
                                  Text('2'),
                                  Icon(Icons.light),
                                ],
                              ),
                              // trailing: Icon(Icons.light),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Update2(
                                            snapshot.data[index]['id'],
                                            snapshot.data[index]['qrname2'],
                                            // todolistitems[index]['password']
                                          )),
                                ).then((value) => {
                                      setState(() {
                                        print(value);
                                        if (value == 'delete') {
                                          final snackBar = SnackBar(
                                            content:
                                                const Text('ลบเรียบร้อยแล้ว'),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                        getTodolist();
                                      })
                                    });
                              },
                            ),
                          );
                        }),
                  ]))
                : Container(
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    // child: Center(
                    //   child: CircularProgressIndicator(
                    //     color: Colors.green,
                    //   ),
                    // ),
                    )),
        FutureBuilder(
            future: getTodolist3(),
            builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
                ? Container(
                    child: Column(children: [
                    ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        // itemCount: snapshot.data!.length,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              tileColor: Myconstat.white2,
                              title: Row(
                                children: [
                                  Text("${snapshot.data[index]['qrname3']}"),
                                  Spacer(),
                                  Text('3'),
                                  Icon(Icons.light),
                                ],
                              ),
                              // trailing: Icon(Icons.light),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Update3(
                                            snapshot.data[index]['id'],
                                            snapshot.data[index]['qrname3'],
                                            // todolistitems[index]['password']
                                          )),
                                ).then((value) => {
                                      setState(() {
                                        print(value);
                                        if (value == 'delete') {
                                          final snackBar = SnackBar(
                                            content:
                                                const Text('ลบเรียบร้อยแล้ว'),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                        getTodolist();
                                      })
                                    });
                              },
                            ),
                          );
                        }),
                  ]))
                : Container(
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    // child: Center(
                    //   child: CircularProgressIndicator(
                    //     color: Colors.green,
                    //   ),
                    // ),
                    ))
      ],
    );

    // ListView.builder(
    //     itemCount: todolistitems.length,
    //     itemBuilder: (context, index) {
    //       return Card(
    //         child: ListTile(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(30),
    //           ),
    //           tileColor: Myconstat.white2,
    //           title: Text("${todolistitems[index]['qrname1']}"),
    //           onTap: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (context) => Update1(
    //                       todolistitems[index]['id'],
    //                       todolistitems[index]['qrname1'],
    //                       todolistitems[index]['password'])),
    //             ).then((value) => {
    //                   setState(() {
    //                     print(value);
    //                     if (value == 'delete') {
    //                       final snackBar = SnackBar(
    //                         content: const Text('ลบเรียบร้อยแล้ว'),
    //                       );

    //                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //                     }
    //                     getTodolist();
    //                   })
    //                 });
    //           },
    //         ),
    //       );
    //     });
  }

  Future<dynamic> getTodolist() async {
    var url = Uri.http('172.20.10.11:8000', '/api/all-devicelist1');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }

  Future<dynamic> getTodolist2() async {
    var url = Uri.http('172.20.10.11:8000', '/api/all-devicelist2');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }

  Future<dynamic> getTodolist3() async {
    var url = Uri.http('172.20.10.11:8000', '/api/all-devicelist3');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }
}
