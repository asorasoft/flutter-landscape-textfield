import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:landscape_textfield/landscape_textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FocusNode secondInput = FocusNode();

  @override
  Widget build(BuildContext context) {
    return LandscapeTextFieldProvider(
      buttonBuilder: (closeKeyboard) {
        return ElevatedButton(
          onPressed: closeKeyboard,
          child: const Text("រួចរាល់"),
        );
      },
      child: Scaffold(
        // Build app bar according to orientation and keyboard visibility
        appBar: AppBar(
          title: const Text("Landscape fullscreen keyboard PoC"),
        ),
        body: Column(
          children: [
            // Input field for portrait mode
            LandscapeTextField(
              decoration: const InputDecoration(hintText: 'Your name here...'),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(secondInput);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            LandscapeTextField(
              decoration: const InputDecoration(hintText: 'Anything here...'),
              maxLength: 500,
              focusNode: secondInput,
              maxLines: null,
              onChanged: (text) {
                print(text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
