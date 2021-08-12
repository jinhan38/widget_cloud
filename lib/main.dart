import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_cloud/custom_page_name.dart';
import 'package:widget_cloud/page/page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '위젯 리스트',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: PageName.main,
      getPages: [
        GetPage(name: PageName.main, page: () => Main()),
        GetPage(name: PageName.custom_page_view, page: () => CustomPageView()),
      ],
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final List<Map<String, String>> buttonTextList = [
    {"text": "Page View", "value": PageName.custom_page_view},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("위젯 리스트"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: buttonTextList.length,
          itemBuilder: (context, index) {
            return ListTile(buttonMap: buttonTextList[index]);
          }),
    );
  }
}

class ListTile extends StatelessWidget {
  late Map<String, String> buttonMap;

  ListTile({required this.buttonMap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(buttonMap["value"].toString());
        },
        child: Text(buttonMap["text"].toString()),
      ),
    );
  }
}
