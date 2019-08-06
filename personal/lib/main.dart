import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal/app_localizations.dart';

//import 'package:flutter_localizations/flutter_localizations.dart'
void main() => runApp(PersonalApp());

class PersonalApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: [
//        Locale('en', 'US'),
//        Locale('ko', 'KR'),
//        Locale('ja', 'JP'),
        Locale('en'),
        Locale('ko'),
        Locale('ja'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        print('---${locale}----${supportedLocales}');
        if (locale == null) {
          return supportedLocales.first;
        }
        for (var supportedLocale in supportedLocales) {
//          if (supportedLocale.languageCode == locale.languageCode &&
//              supportedLocale.countryCode == locale.countryCode) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        print('-------${supportedLocales.first}');
        return supportedLocales.first;
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context).translate('logindFail')),
            Text('asd'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
