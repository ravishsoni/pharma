import 'package:flutter/material.dart';
import 'package:pharma/data/imagesPath.dart';
import 'package:pharma/utils/AppBarUtil.dart';
import 'package:pharma/utils/buildSampleDrugItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> _pages;
  int _activeImagePage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _pages = List.generate(
        imagesPath.length,
        (index) => Placeholder(
            child: Image.asset(imagesPath[index], fit: BoxFit.fill)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtil(
        title: "Pharma Connect",
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
          )
        ],
        isBack: false,
        backgroundColor: Color(0xff00000000),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 4,
                      child: PageView.builder(
                          controller: _pageController,
                          itemCount: imagesPath.length,
                          onPageChanged: (value) {
                            setState(() {
                              _activeImagePage = value;
                            });
                          },
                          itemBuilder: (context, index) {
                            return _pages[index];
                          }),
                    ),
                    Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List<Widget>.generate(
                                  _pages.length,
                                  (index) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: InkWell(
                                        onTap: () {
                                          _pageController.animateToPage(index,
                                              duration:
                                                  Duration(microseconds: 300),
                                              curve: Curves.easeIn);
                                        },
                                        child: CircleAvatar(
                                          radius: 4,
                                          backgroundColor:
                                              _activeImagePage == index
                                                  ? Colors.green
                                                  : Colors.grey,
                                        ),
                                      )))),
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Sample Drugs',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Text('List of drugs assigned to you',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey)),
                SizedBox(height: 20),
                _sampleDrugGridViewWidget(),
              ],
            ),
          )),
    );
  }

  Widget _sampleDrugGridViewWidget() {
    return Expanded(flex:1, child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: buildSampleDrugItem(
                    Color(0xffffe7e9),
                    Color(0xffffcfd3),
                    "assets/images/img_data1.png",
                    "Revital Cal 500mg Strip Of 15 Tablets",
                    context)),
            Expanded(
                child: buildSampleDrugItem(
                    Color(0xfffff8cf),
                    Color(0xfffff1a4),
                    "assets/images/img_data2.png",
                    "Recombigen Dr. ORG New 3 In 1 Vaporizer",
                    context)),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: buildSampleDrugItem(
                    Color(0xffd3f7ff),
                    Color(0xff98ecff),
                    "assets/images/img_data3.png",
                    "Dr. Morepen Blood Pressure Monitor Model Bp 14",
                    context)),
            Expanded(
                child: buildSampleDrugItem(
                    Color(0xffd0fedf),
                    Color(0xff94fbb9),
                    "assets/images/img_data4.png",
                    "Revital Cal 500mg Strip Of 15 Tablets",
                    context)),
          ],
        ),],
    )
    );}
}
