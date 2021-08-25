# landscape_textfield

Possible to make fullscreen keyboard when keyboard is open in landscape mode.

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
