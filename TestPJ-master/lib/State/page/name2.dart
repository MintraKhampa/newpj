import 'package:flutter/material.dart';
import 'package:test1/utility/my_constant.dart';
import 'package:test1/widgets/show_title.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class codename3 extends StatefulWidget {
  const codename3({Key? key}) : super(key: key);

  @override
  _codename3State createState() => _codename3State();
}

class _codename3State extends State<codename3> {
  final formKey = GlobalKey<FormState>();
  TextEditingController qrname3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Account'),
        backgroundColor: Myconstat.primary,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitle('NameDevice'),
                buildqrname(size),
                // buildRegister(size),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, Myconstat.routemainpage);
                        print('data complete');
                        print('---------');
                        print('NameDevice: ${qrname3Controller.text}');
                        postname();
                        setState(() {
                          qrname3Controller.clear();
                        });
                      }
                    },
                    child: Text('OK'),
                    style: Myconstat().MyButtonStyle(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildqrname(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: qrname3Controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก DeviceName';
              }
            },
            decoration: InputDecoration(
              labelStyle: Myconstat().h3Style(),
              labelText: 'DeviceName :',
              prefixIcon: Icon(
                Icons.person,
                color: Myconstat.light2,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstat.dark1),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstat.light1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: Myconstat().h4Style(),
      ),
    );
  }

  Future postname() async {
    var url = Uri.http('172.20.10.11:8000', '/api/post-devicelist3/');
    Map<String, String> header = {'Content-type': 'application/json'};
    String jsondata = '{"qrname3":"${qrname3Controller.text}"}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('-------reuslt-------');
    print(response.body);
    print(response.statusCode);
  }
}
