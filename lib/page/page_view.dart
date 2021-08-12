import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class CustomPageView extends StatelessWidget {
  PageController pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildPageView(),
          _buildCircleIndicator(),
        ],
      ),
    );
  }
  _buildPageView() {
    return Container(
      color: Colors.green,
      child: PageView.builder(
          itemCount: 3,
          controller: pageController,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Text("페이지번호 : $index", style: TextStyle(fontSize: 30),)
            );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }


  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          dotColor: Colors.blue,
          selectedBorderColor: Colors.red,
          itemCount: 3,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}
