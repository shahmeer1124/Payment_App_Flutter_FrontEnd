import 'package:flutter/material.dart';

import 'package:flutter_payment_app/component/colors.dart';
import 'package:flutter_payment_app/controller/datacontroller.dart';
import 'package:flutter_payment_app/pages/paymentpage.dart';
import 'package:flutter_payment_app/widgets/buttons.dart';
import 'package:get/get.dart';

import '../widgets/large_button.dart';
import '../widgets/text_size.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final DataController _controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    print(_controller.list);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headsection(),
            Obx(() {
              if (_controller.loading == false) {
                return Center(
                  child: Container(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator()),
                );
              } else {
                return _listbills();
              }
            }),
            _Paybutton(),
          ],
        ),
      ),
    );
  }

  _headsection() {
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainbackground(),
          _curveimagecontainer(),
          _buttonContainer()
        ],
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
        bottom: 15,
        right: 58,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.transparent,
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              color: Color(0xFFeef1f4).withOpacity(0.7),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 300,
                            )),
                        Positioned(
                            right: 58,
                            child: Container(
                              padding: EdgeInsets.only(top: 5, bottom: 25),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButtons(
                                    backgroundcolor: AppColor.mainColor,
                                    icon: Icons.cancel,
                                    iconcolor: AppColor.mainColor,
                                    textcolor: Colors.white,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  AppButtons(
                                    backgroundcolor: AppColor.mainColor,
                                    icon: Icons.add,
                                    iconcolor: AppColor.mainColor,
                                    textcolor: Colors.white,
                                    text: "Add Bill",
                                    onTap: () {},
                                  ),
                                  AppButtons(
                                    backgroundcolor: AppColor.mainColor,
                                    icon: Icons.history,
                                    iconcolor: AppColor.mainColor,
                                    textcolor: Colors.white,
                                    text: "History",
                                    onTap: () {},
                                  )
                                ],
                              ),
                              width: 60,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(29),
                                  color: AppColor.mainColor),
                            ))
                      ],
                    ),
                    height: MediaQuery.of(context).size.height - 240,
                  );
                });
          },
          child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/lines.png")),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        offset: Offset(0, 1),
                        color: Color(0xFF012234d).withOpacity(0.2))
                  ])),
        ));
  }

  _mainbackground() {
    return Positioned(
        left: 0,
        bottom: 10,
        child: Container(
          width: Get.width,
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/background.png"))),
        ));
  }

  _curveimagecontainer() {
    return Positioned(
        left: 0,
        right: -2,
        bottom: 10,
        child: Container(
          height: Get.height * 0.1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("images/curve.png"))),
        ));
  }

  _listbills() {
    return Positioned(
        top: 320,
        left: 0,
        right: 0,
        bottom: 0,
        child: ListView.builder(
          itemCount: _controller.list.length,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.only(top: 20, right: 20),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Colors.grey),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "http://127.0.0.1:8000/uploads/" +
                                              _controller
                                                  .list[index].brand_logo),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 15,
                                          offset: Offset(0, 1),
                                          color: Color(0xFF012234d)
                                              .withOpacity(0.2))
                                    ])),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_controller.list[index].brand_name),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(_controller.list[index].id.toString()),
                              ],
                            ),
                          ],
                        ),
                        SizedText(
                          color: AppColor.green,
                          text: _controller.list[index].due_info,
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (_controller.list[index].status == 0) {
                                  _controller.list[index].status = 1;
                                } else if (_controller.list[index].status ==
                                    1) {
                                  _controller.list[index].status = 0;
                                }
                                print(_controller.list[index].status);
                                _controller.list.refresh();
                                // print(_controller.newList.length);
                              },
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Select",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            _controller.list[index].status == 0
                                                ? AppColor.selectColor
                                                : Colors.orange),
                                  ),
                                ),
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.selectBackground),
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "\$" + _controller.list[index].due,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: AppColor.mainColor,
                              ),
                            ),
                            Text(
                              "Due in 3 Days",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: AppColor.idColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 5,
                          height: 35,
                          decoration: BoxDecoration(
                              color: AppColor.halfOval,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30))),
                        )
                      ],
                    )
                  ],
                ),
              ),
              height: 130,
              width: Get.width - 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFdbd8d0),
                        offset: Offset(1, 1),
                        blurRadius: 20.0,
                        spreadRadius: 10)
                  ]),
            );
          },
        ));
  }

  _Paybutton() {
    return Positioned(
        bottom: 20,
        child: AppLargeButoon(
          textcolor: Colors.white,
          text: "pay All Bills",
          ontap: () {
            Get.to(() => PaymentPage());
          },
        ));
  }
}
