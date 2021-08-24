library landscape_textfield;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

closeKeyboard(BuildContext context) {
  final currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

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
  final bool readOnly;
  final Widget? label;

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
    this.readOnly = false,
    this.label,
  });

  @override
  State<LandscapeTextField> createState() => _LandscapeTextFieldState();
}

class _LandscapeTextFieldState extends State<LandscapeTextField> {
  late FocusNode focusNode;
  late TextEditingController controller;
  late StreamSubscription _keyboardStreamSubscription;
  bool readOnly = false;
  bool? showCursor;
  bool keyboardVisible = false;

  @override
  void initState() {
    showCursor = widget.showCursor;
    focusNode = widget.focusNode ?? FocusNode();
    controller = widget.controller ?? TextEditingController();
    final keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardStreamSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      keyboardVisible = visible;
      if (focusNode.hasFocus && visible) {
        var provider = _LandscapeTextFieldStack.of(context);
        if (provider != null) {
          provider.attachTo(this);
        } else {
          print("[landscape_textfield]: LandscapeTextFieldProvider not found under the context");
        }
      }
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus && keyboardVisible) {
        var provider = _LandscapeTextFieldStack.of(context);
        if (provider != null) {
          provider.attachTo(this);
        } else {
          print("[landscape_textfield]: LandscapeTextFieldProvider not found under the context");
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    _keyboardStreamSubscription.cancel();
    super.dispose();
  }

  disable() {
    // setState(() {
    //   readOnly = true;
    //   showCursor = null;
    // });
  }

  enable() {
    // setState(() {
    //   readOnly = widget.readOnly;
    //   showCursor = true;
    // });
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
      readOnly: readOnly,
      showCursor: showCursor,
    );
  }
}

class LandscapeTextFieldWrapper extends StatefulWidget {
  final Widget Function(Function() hideKeyboard)? buttonBuilder;
  final Widget child;

  const LandscapeTextFieldWrapper({Key? key, required this.child, this.buttonBuilder}) : super(key: key);

  @override
  _LandscapeTextFieldWrapperState createState() => _LandscapeTextFieldWrapperState();
}

class _LandscapeTextFieldWrapperState extends State<LandscapeTextFieldWrapper> {
  final GlobalKey<_LandscapeTextFieldStackState> wrapperKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // print("Build wrapper parent");
    return _LandscapeTextFieldStack(
      key: wrapperKey,
      child: widget.child,
      buttonBuilder: widget.buttonBuilder,
    );
  }
}

class _LandscapeTextFieldProvider extends InheritedWidget {
  final Widget child;
  final GlobalKey? wrapperKey;

  _LandscapeTextFieldProvider({this.wrapperKey, required this.child})
      : super(
          child: child,
        );

  _LandscapeTextFieldStackState? get wrapperState {
    final childKey = this.wrapperKey;
    if (childKey is GlobalKey && childKey.currentState is _LandscapeTextFieldStackState) {
      return childKey.currentState! as _LandscapeTextFieldStackState;
    }
    return null;
  }

  attachTo(_LandscapeTextFieldState textFieldState) {
    print('Attach to a state');
    wrapperState?.attachTo(textFieldState);
  }

  @override
  bool updateShouldNotify(_LandscapeTextFieldProvider oldWidget) {
    return false;
  }
}

class _LandscapeTextFieldStack extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final Widget Function(Function() defaultAction)? buttonBuilder;

  _LandscapeTextFieldStack({
    Key? key,
    required this.child,
    this.buttonBuilder,
    this.padding,
  }) : super(key: key ?? GlobalKey());

  final Widget child;

  static _LandscapeTextFieldProvider? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_LandscapeTextFieldProvider>());
  }

  @override
  _LandscapeTextFieldStackState createState() => _LandscapeTextFieldStackState();
}

class _LandscapeTextFieldStackState extends State<_LandscapeTextFieldStack> {
  var _landscapeController = TextEditingController();
  late StreamSubscription _keyboardStreamSubscription;
  late FocusNode _focusNodeLandscape;

  // bool _keyboardActive = false;

  _LandscapeTextFieldState? currentTextFieldState;

  attachTo(_LandscapeTextFieldState textFieldState) {
    _landscapeController.text = textFieldState.controller.text;
    textFieldState.disable();
    setState(() {
      currentTextFieldState = textFieldState;
    });
  }

  void _doneAction() {
    currentTextFieldState?.enable();
    setState(() {
      currentTextFieldState = null;
    });
    closeKeyboard(context);
  }

  Widget buildLandscapeFullscreenInput() {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape && currentTextFieldState != null) {
          if (_landscapeController.text != currentTextFieldState!.controller.text) {
            _landscapeController.text = currentTextFieldState!.controller.text;
          }

          if (!_focusNodeLandscape.hasFocus) {
            _focusNodeLandscape.requestFocus();
          }
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AnnotatedRegion(
              value: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.transparent,
              ),
              child: Material(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SafeArea(
                    child: Padding(
                      padding: widget.padding ??
                          const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // landscape fs input
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: currentTextFieldState?.widget.decoration?.hintText,
                                label: currentTextFieldState?.widget.label,
                              ),
                              // decoration: currentTextFieldState?.widget.decoration,
                              minLines: currentTextFieldState?.widget.minLines,
                              maxLines: currentTextFieldState?.widget.maxLines,
                              keyboardType: currentTextFieldState?.widget.keyboardType,
                              obscureText: currentTextFieldState?.widget.obscureText ?? false,
                              obscuringCharacter: currentTextFieldState?.widget.obscuringCharacter ?? '•',
                              textCapitalization: currentTextFieldState?.widget.textCapitalization ?? TextCapitalization.none,
                              maxLength: currentTextFieldState?.widget.maxLength,
                              maxLengthEnforcement: currentTextFieldState?.widget.maxLengthEnforcement,
                              onEditingComplete: currentTextFieldState?.widget.onEditingComplete,
                              textInputAction: currentTextFieldState?.widget.textInputAction,
                              onSubmitted: (String text) {
                                var onSubmitted = currentTextFieldState?.widget.onSubmitted;
                                _doneAction();
                                if (onSubmitted != null) {
                                  onSubmitted(text);
                                }
                              },
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
                          if (widget.buttonBuilder != null)
                            widget.buttonBuilder!(_doneAction)
                          else
                            ElevatedButton(
                              onPressed: _doneAction,
                              child: Text('DONE'),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  void initState() {
    _focusNodeLandscape = FocusNode();
    final keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardStreamSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      print("Update keyboard visible to $visible");
      if (!visible && _focusNodeLandscape.hasFocus) {
        _doneAction();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _landscapeController.dispose();
    _focusNodeLandscape.dispose();
    _keyboardStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _LandscapeTextFieldProvider(
      wrapperKey: this.widget.key as GlobalKey?,
      child: Material(
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
      ),
    );
  }
}
