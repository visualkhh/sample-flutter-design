import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Slider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;

  List<String> images = [
    'http://p3.ifengimg.com/a/2018_06/4715606611fff06_size70_w375_h421.jpg',
    'https://img.huffingtonpost.com/asset/5cad557f240000f9084f66e7.jpeg?cache=FMsCqxZ3fI&ops=crop_0_171_2667_1966,scalefit_630_noupscale',
    'https://img.hankyung.com/photo/201903/03.19270989.1.jpg',
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Text("12"),
          Text("cc"),
          Text("ee"),
        ],
      ),
//      body: PageView.builder(
//        controller: pageController,
//        itemCount: images.length,
//        itemBuilder: (context, position) {
//          return imageSlider(position);
//        },
//      ),
    );
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        return Center(
          child: SizedBox(
            height: 200,
            width: 300,
            child: widget,
          ),
        );
      },
      child: Container(
        child: Image.network(images[position], fit: BoxFit.cover),
      ),
    );
  }
}
