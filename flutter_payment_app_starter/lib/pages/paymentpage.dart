import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_payment_app/component/colors.dart';
import 'package:flutter_payment_app/pages/my_home_page.dart';
import 'package:flutter_payment_app/widgets/buttons.dart';
import 'package:flutter_payment_app/widgets/large_button.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("images/paymentbackground.png"))),
        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: h * 0.17,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/success.png"))),
            ),
            Text(
              "Success",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.mainColor),
            ),
            Text(
              "Payment is completed for two Bills",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColor.idColor),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Container(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15, left: 20),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.green),
                                child: Icon(
                                  Icons.done,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ken Gen Power",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.mainColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ID:12344554",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.idColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.mainColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "\$65656757",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.mainColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              width: 360,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2, color: Colors.grey.withOpacity(0.5))),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Column(
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(fontSize: 20, color: AppColor.idColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "\$24800",
                  style: TextStyle(
                      fontSize: 30,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButtons(
                  icon: Icons.share_sharp,
                  onTap: () {},
                  text: "Share",
                ),
                SizedBox(
                  width: 80,
                ),
                AppButtons(
                  icon: Icons.print,
                  onTap: () {},
                  text: "print",
                )
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            AppLargeButoon(
              ontap: () {
                Get.to(() => MyHomepage());
              },
              text: "Done",
              backgroundcolr: Colors.white,
              textcolor: AppColor.mainColor,
            )
          ],
        ),
      ),
    );
  }
}
