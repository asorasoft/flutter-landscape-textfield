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
    // print("Build app");
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
  final FocusNode primaryInput = FocusNode();
  final FocusNode secondInput = FocusNode();

  @override
  Widget build(BuildContext context) {
    // Must wrap the whole scaffold with LandscapeTextFieldWrapper
    return LandscapeTextFieldWrapper(
      buttonBuilder: (closeKeyboard) {
        return ElevatedButton(
          onPressed: closeKeyboard,
          child: const Text("រួចរាល់"),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Rotate your phone on keyboard open"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Normal TextField
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Simple TextField...',
                  ),
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(primaryInput);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // TextFormField that need landscape keyboard
                // Default behavior is LandscapeTextFieldBehavior.KEEP_FOCUS
                LandscapeTextField.form(
                  label: const Text("Keep focus"),
                  focusNode: primaryInput,
                  decoration: const InputDecoration(hintText: 'Type something here...'),
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(secondInput);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // TextFormField that need landscape keyboard
                // LandscapeTextFieldBehavior.AUTO_OPEN
                LandscapeTextField(
                  behavior: LandscapeTextFieldBehavior.AUTO_OPEN,
                  label: const Text("Auto open"),
                  decoration: const InputDecoration(hintText: 'Type anything...'),
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
        ),
      ),
    );
  }
}
