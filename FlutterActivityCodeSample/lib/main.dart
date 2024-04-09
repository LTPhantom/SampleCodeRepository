import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const activityButtonText = 'Android Activity';
  static const platform = MethodChannel('mychannel');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Example app'),
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: (String result) {
                  switch (result) {
                    case activityButtonText:
                      platform.invokeMethod('mycall');
                      break;
                    default:
                      throw AssertionError('unexpected button: $result');
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: activityButtonText,
                    child: Text(activityButtonText),
                  ),
                ],
              ),
            ],
          ),
          body: SafeArea(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 40,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    Constants.placeholderText,
                    style: TextStyle(fontSize: 24),
                  );
                },
              ),
            ),
          )),
        );
      }),
    );
  }
}
