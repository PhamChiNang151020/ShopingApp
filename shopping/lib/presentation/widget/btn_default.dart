import 'package:flutter/material.dart';

import '../common/common.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton({
    Key? key,
    // this.enable,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.sizeHeight,
    this.sizeWidth,
    this.borderRadius,
    this.widgetLeft,
    this.widgetRight,
    this.isCustomOnButton,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? sizeHeight;
  final double? sizeWidth;
  final double? borderRadius;
  final Widget? widgetLeft;
  final Widget? widgetRight;
  final bool? isCustomOnButton;
  // final bool? enable;

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  // final ValueNotifier<bool> _turnOnBTN = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          widget.buttonColor ?? MyColor.defaultColor,
        ),
        minimumSize: MaterialStateProperty.all(Size(
          widget.sizeWidth ?? double.infinity - (5 / 100),
          widget.sizeHeight ?? 40,
        )),
        maximumSize: MaterialStateProperty.all(Size(
          widget.sizeWidth ?? double.infinity - (5 / 100),
          widget.sizeHeight ?? 40,
        )),
        shadowColor: MaterialStateProperty.all<Color>(
            widget.buttonColor ?? MyColor.defaultColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 20.0),
          ),
        ),
      ),
      onPressed: /* _turnOnBTN.value == false ? null :  */ widget.onPressed,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: widget.isCustomOnButton == true
              ? Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: widget.widgetLeft ?? Container(),
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        widget.buttonText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: MyColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2
                            // fontSize: 12,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: widget.widgetRight ?? Container(),
                    ),
                  ],
                )
              : Text(
                  widget.buttonText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: MyColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2),
                ),
        ),
      ),
    );
  }
}
