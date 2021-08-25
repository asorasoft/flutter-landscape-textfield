# landscape_textfield

Possible to make fullscreen keyboard when keyboard is open in landscape mode.

## Demo

`LandscapeTextField(...)` or `LandscapeTextField.form(...)` has 2 behavior options:
    * `LandscapeTextFieldBehavior.KEEP_FOCUS`
    * `LandscapeTextFieldBehavior.AUTO_OPEN`

#### `LandscapeTextFieldBehavior.KEEP_FOCUS`

```dart
LandscapeTextField(
  behavior: LandscapeTextFieldBehavior.KEEP_FOCUS,
  label: const Text("This TextField's cursor will be still open when done editing in fullscreen keyboard."),
  ...
),
```

![](https://raw.githubusercontent.com/asorasoft/flutter-landscape-textfield/master/doc/screenshot/keep_focus.gif)

#### `LandscapeTextFieldBehavior.AUTO_OPEN`

```dart
LandscapeTextField(
  behavior: LandscapeTextFieldBehavior.AUTO_OPEN,
  label: const Text("This focused TextField will open the keyboard automatically when rotate device."),
  ...
),
```

![](https://raw.githubusercontent.com/asorasoft/flutter-landscape-textfield/master/doc/screenshot/auto_open.gif)

## How to use

Wrap your `Scaffold` with `LandscapeTextFieldWrapper`.
Check the `example` folder or code below

```dart
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
```
