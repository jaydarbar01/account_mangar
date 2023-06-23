
import 'package:account_mangar/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'controller.dart';


class PasswordView extends StatefulWidget {
  @override
  _PasswordViewState createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {


  MyController data=Get.put(MyController());

  var selectedindex = 0;
  String code = '';
  Box box=Hive.box("data");
  String password='';





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // password=box.get("pass");

  }

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: Colors.black.withBlue(40),
    );
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print("Code is $code");
    return Scaffold(
      backgroundColor: Colors.black.withBlue(40),
      body: Column(
        children: [
          Container(
            height: height * 0.15,
            width: width,
            color: Colors.black.withBlue(40),
            alignment: Alignment.center,
            child: SafeArea(
              child: Container(
                  height: height * 0.06,
                  width: height * 0.06,
                  child:Image(image: AssetImage("images/download.png"),)),
            ),
          ),
          Container(
              height: height * 0.85,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              "Account Maneger",
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.black.withBlue(100),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Forgate PassWord",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black.withBlue(40),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DigitHolder(
                              width: width,
                              index: 0,
                              selectedIndex: selectedindex,
                              code: code,
                            ),
                            DigitHolder(
                                width: width,
                                index: 1,
                                selectedIndex: selectedindex,
                                code: code),
                            DigitHolder(
                                width: width,
                                index: 2,
                                selectedIndex: selectedindex,
                                code: code),
                            DigitHolder(
                                width: width,
                                index: 3,
                                selectedIndex: selectedindex,
                                code: code),
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(onTap: () {
                                        data.addDigit(1);
                                      },
                                        child: Container(margin: EdgeInsets.fromLTRB(30, 20, 10, 20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),

                                            child: Text('1', style: textStyle)),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(onTap: () {
                                        data.addDigit(2);
                                      },
                                        child: Container(margin: EdgeInsets.all(20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),

                                            child: Text('2', style: textStyle)),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(onTap: () {
                                        data.addDigit(3);
                                      },
                                        child: Container(margin: EdgeInsets.fromLTRB(10, 20, 30, 20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),

                                            child: Text('3', style: textStyle)),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(onTap: () {
                                        data.addDigit(4);
                                      },
                                        child: Container(margin: EdgeInsets.fromLTRB(30, 20, 10, 20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),

                                            child: Text('4', style: textStyle)),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(onTap: () {
                                        data.addDigit(5);
                                      },
                                        child: Container(margin: EdgeInsets.all(20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),

                                            child: Text('5', style: textStyle)),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(onTap: () {
                                        data.addDigit(6);
                                      },
                                        child: Container(margin: EdgeInsets.fromLTRB(10, 20, 30, 20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),

                                            child: Text('6', style: textStyle)),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(onTap: () {
                                        data.addDigit(7);
                                      },
                                        child: Container(margin: EdgeInsets.fromLTRB(30, 20, 10, 20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),

                                            child: Text('7', style: textStyle)),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(onTap: () {
                                        data.addDigit(8);
                                      },
                                        child: Container(margin: EdgeInsets.all(20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),

                                            child: Text('8', style: textStyle)),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(onTap: () {
                                        data.addDigit(9);
                                      },
                                        child: Container(margin: EdgeInsets.fromLTRB(10, 20, 30, 20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),

                                            child: Text('9', style: textStyle)),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(onTap: () {
                                        data.backspace();
                                      },
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(30, 20, 10, 20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(50)),
                                            child: Icon(Icons.backspace_outlined,
                                                color: Colors.black.withBlue(40),
                                                size: 30)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(onTap: () {
                                        data.addDigit(0);
                                      },
                                        child: Container(
                                            margin: EdgeInsets.all(20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),

                                            child: Text('0', style: textStyle)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(onTap: () {

                                        print("this${data.get_pass()}");

                                        print(data.code);

                                        if(data.code==data.get_pass())
                                        {
                                          print("right ans");
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return dashboard();
                                          },));
                                        }
                                        else
                                        { print("wrong password");

                                        }
                                        print("object");

                                      },
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(10, 20, 30, 20),alignment:Alignment.center,height: 60,width: 50,
                                            decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(50)),
                                            child: Icon(Icons.check,
                                                color: Colors.black.withBlue(40),
                                                size: 30)),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
  // addDigit(int digit) {
  //   if (code.length > 3) {
  //     return;
  //   }
  //   setState(() {
  //     code = code + digit.toString();
  //     print('Code is $code');
  //     selectedindex = code.length;
  //   });
  // }
  //
  // backspace() {
  //   if (code.length == 0) {
  //     return;
  //   }
  //   setState(() {
  //     code = code.substring(0, code.length - 1);
  //     selectedindex = code.length;
  //   });
  // }
}

class DigitHolder extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String code;

  MyController data=Get.put(MyController());
  DigitHolder({
    required this.selectedIndex,
    Key? key,
    required this.width,
    required this.index,
    required this.code,
  }) : super(key: key);

 final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: width * 0.17,
        width: width * 0.17,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: data.index == data.selectedindex ? Colors.green : Colors.transparent,
                offset: Offset(0, 0),
                spreadRadius: 1.5,
                blurRadius: 2,
              )
            ]),
        child: Obx(() => data.code.value.length > index
            ? Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.black.withBlue(40),
            shape: BoxShape.circle,
          ),
        )
            : Container(),)
    );
  }

}
