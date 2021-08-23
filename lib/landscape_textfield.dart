library landscape_textfield;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

class LandscapeTextField extends StatefulWidget {
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final DragStartBehavior dragStartBehavior;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final GestureTapCallback? onTap;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextEditingController? controller;

  LandscapeTextField({
    this.textInputAction,
    this.decoration,
    this.keyboardType,
    this.style,
    this.strutStyle,
    this.textAlignVertical,
    this.textDirection,
    this.toolbarOptions,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollPhysics,
    this.scrollController,
    this.autofillHints,
    this.restorationId,
    this.textCapitalization = TextCapitalization.none,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.expands = false,
    this.cursorWidth = 2.0,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.enableIMEPersonalizedLearning = true,
    this.focusNode,
    this.controller,
    this.textAlign = TextAlign.start,
  });

  @override
  State<LandscapeTextField> createState() => _LandscapeTextFieldState();
}

class _LandscapeTextFieldState extends State<LandscapeTextField> {
  late FocusNode focusNode;
  late TextEditingController controller;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    controller = widget.controller ?? TextEditingController();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        var provider = LandscapeTextFieldProvider.of(context);
        if (provider != null) {
          provider.attachTo(this);
        } else {
          print("LandscapeTextFieldProvider not found under the context");
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    print("Dispose a focus node");
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: widget.textInputAction,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      onAppPrivateCommand: widget.onAppPrivateCommand,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      keyboardAppearance: widget.keyboardAppearance,
      selectionControls: widget.selectionControls,
      onTap: widget.onTap,
      mouseCursor: widget.mouseCursor,
      buildCounter: widget.buildCounter,
      scrollPhysics: widget.scrollPhysics,
      scrollController: widget.scrollController,
      autofillHints: widget.autofillHints,
      restorationId: widget.restorationId,
      textCapitalization: widget.textCapitalization,
      obscuringCharacter: widget.obscuringCharacter,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      expands: widget.expands,
      cursorWidth: widget.cursorWidth,
      selectionHeightStyle: widget.selectionHeightStyle,
      selectionWidthStyle: widget.selectionWidthStyle,
      scrollPadding: widget.scrollPadding,
      dragStartBehavior: widget.dragStartBehavior,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
      textAlign: widget.textAlign,
      focusNode: focusNode,
      controller: controller,
    );
  }
}

class LandscapeTextFieldProvider extends InheritedWidget {
  final Widget innerChild;
  final Widget Function(Function() closeKeyboard)? buttonBuilder;

  LandscapeTextFieldProvider({this.buttonBuilder, required Widget child})
      : this.innerChild = child,
        super(
          child: _LandscapeTextFieldWrapper(
            key: GlobalKey<_LandscapeTextFieldWrapperState>(),
            child: child,
          ),
        );

  static LandscapeTextFieldProvider? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LandscapeTextFieldProvider>());
  }

  attachTo(_LandscapeTextFieldState textFieldState) {
    final childKey = this.child.key;
    if (childKey is GlobalKey<_LandscapeTextFieldWrapperState> && childKey.currentState != null) {
      childKey.currentState!.attachTo(textFieldState);
    }
  }

  @override
  bool updateShouldNotify(LandscapeTextFieldProvider oldWidget) {
    return false;
  }
}

class _LandscapeTextFieldWrapper extends StatefulWidget {
  const _LandscapeTextFieldWrapper({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  _LandscapeTextFieldWrapperState createState() => _LandscapeTextFieldWrapperState();
}

class _LandscapeTextFieldWrapperState extends State<_LandscapeTextFieldWrapper> {
  var _keyboardShown = false;
  var _landscapeController = TextEditingController();
  late StreamSubscription _keyboardStreamSubscription;
  var _focusNodeLandscape = FocusNode();

  _LandscapeTextFieldState? currentTextFieldState;

  attachTo(_LandscapeTextFieldState textFieldState) {
    _landscapeController.text = textFieldState.controller.text;
    setState(() {
      currentTextFieldState = textFieldState;
    });
  }

  void _hideKeyboard() {
    final currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Widget buildLandscapeFullscreenInput() {
    if (MediaQuery.of(context).orientation == Orientation.landscape && _keyboardShown) {
      // set focus to landscape fs input
      _focusNodeLandscape.requestFocus();

      return KeyboardDismissOnTap(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Material(
            color: Colors.white,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // landscape fs input
                    Expanded(
                      child: TextField(
                        decoration: currentTextFieldState?.widget.decoration,
                        minLines: currentTextFieldState?.widget.minLines,
                        maxLines: currentTextFieldState?.widget.maxLines,
                        keyboardType: currentTextFieldState?.widget.keyboardType,
                        obscureText: currentTextFieldState?.widget.obscureText ?? false,
                        obscuringCharacter: currentTextFieldState?.widget.obscuringCharacter ?? '•',
                        textCapitalization: currentTextFieldState?.widget.textCapitalization ?? TextCapitalization.none,
                        maxLength: currentTextFieldState?.widget.maxLength,
                        maxLengthEnforcement: currentTextFieldState?.widget.maxLengthEnforcement,
                        onEditingComplete: currentTextFieldState?.widget.onEditingComplete,
                        // textInputAction: currentTextFieldState?.widget.textInputAction,
                        // onSubmitted: (String text) {
                        //   _hideKeyboard();
                        //   if (currentTextFieldState?.widget.onSubmitted != null) {
                        //     currentTextFieldState?.widget.onSubmitted!(text);
                        //   }
                        // },
                        onAppPrivateCommand: currentTextFieldState?.widget.onAppPrivateCommand,
                        inputFormatters: currentTextFieldState?.widget.inputFormatters,
                        autocorrect: currentTextFieldState?.widget.autocorrect ?? true,
                        autofillHints: currentTextFieldState?.widget.autofillHints,
                        controller: _landscapeController,
                        onChanged: (String text) {
                          if (currentTextFieldState?.controller != null) {
                            try {
                              currentTextFieldState!.controller.text = text;
                            } catch (_) {}
                          }
                          if (currentTextFieldState?.widget.onChanged != null) {
                            currentTextFieldState!.widget.onChanged!(text);
                          }
                        },
                        autofocus: true,
                        focusNode: _focusNodeLandscape,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // by clicking on button we dismiss keyboard
                    if (LandscapeTextFieldProvider.of(context)?.buttonBuilder != null)
                      LandscapeTextFieldProvider.of(context)!.buttonBuilder!(_hideKeyboard)
                    else
                      ElevatedButton(
                        onPressed: _hideKeyboard,
                        child: Text('DONE'),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      // un focus landscape fs input
      _focusNodeLandscape.unfocus();
      return Container();
    }
  }

  @override
  void initState() {
    final keyboardVisibilityController = KeyboardVisibilityController();
    // Listen for changes
    _keyboardStreamSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        _keyboardShown = visible;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    print("Dispose a focus node 2");
    _landscapeController.dispose();
    _focusNodeLandscape.dispose();
    _keyboardStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: widget.child,
          ),
          Positioned.fill(
            child: buildLandscapeFullscreenInput(),
          ),
        ],
      ),
    );
  }
}
