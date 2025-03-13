import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String status;
  final String date;
  final int itemCount;
  final bool showTrackOrder;

  OrderCard({
    required this.orderId,
    required this.status,
    required this.date,
    required this.itemCount,
    required this.showTrackOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order: $orderId", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.shopping_bag, size: 32),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$status on $date", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                        Text("+ $itemCount items", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                showTrackOrder
                    ? TextButton(
                        onPressed: () {},
                        child: Text("Track Order", style: TextStyle(color: Colors.teal)),
                      )
                    : Icon(Icons.arrow_forward, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}