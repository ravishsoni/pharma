import 'package:flutter/material.dart';
import 'package:pharma/utils/AppBarUtil.dart';
import 'package:pharma/utils/OrderCard.dart';

class MyOrderScreen extends StatefulWidget {

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtil(
          title: 'My Order',
          actions: [
            Icon(
              Icons.notifications,
              color: Colors.white,
            )
          ],
          isBack: false,
          backgroundColor: Color(0xff00000000),
        ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            OrderCard(
              orderId: "#123456",
              status: "Delivered",
              date: "21 Apr, 24",
              itemCount: 5,
              showTrackOrder: false,
            ),
            SizedBox(height: 10),
            OrderCard(
              orderId: "#123456",
              status: "In transit",
              date: "21 Apr, 24",
              itemCount: 5,
              showTrackOrder: true,
            ),
          ],
        ),
      ),
    );
  }

}