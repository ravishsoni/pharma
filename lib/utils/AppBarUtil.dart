import 'package:flutter/material.dart';

class AppBarUtil extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool isBack;
  final Color backgroundColor;

  const AppBarUtil({
    Key? key,
    required this.title,
    this.actions,
    this.isBack = false,
    this.backgroundColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff009c92),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: actions,
        backgroundColor: backgroundColor,
        leading: isBackWidget(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


  Widget isBackWidget(BuildContext context) {
    if (isBack) {
      return  IconButton(icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: () {
        Navigator.pop(context);
      },);
    } else {
      return SizedBox();
    }
  }
}
