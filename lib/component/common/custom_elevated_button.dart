import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';

/// default font size: 18.0
/// default text color: white
/// default background color: primaryColor
class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final String text;

  final Color? backgroundColor;

  final Color? textColor;

  final double? fontSize;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          text,
          style: TextStyles.titleTextStyle.copyWith(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 18.0,
          ),
        ),
      ),
    );
  }
}

class CustomWhiteElevatedButton extends CustomElevatedButton {
  const CustomWhiteElevatedButton({
    super.key,
    super.onPressed,
    required super.text,
    Color? backgroundColor,
    Color? textColor,
    super.fontSize,
  }) : super(
          backgroundColor: backgroundColor ?? Colors.white,
          textColor: textColor ?? primaryColor,
        );
}

class CustomGestureDetectorWithFillInteraction extends StatefulWidget {
  final void Function()? onTap;
  final Duration duration;
  final Widget child;
  final EdgeInsets effectPadding;
  final double effectBorderRadius;
  const CustomGestureDetectorWithFillInteraction({
    super.key,
    this.onTap,
    required this.child,
    this.duration = const Duration(milliseconds: 100),
    this.effectPadding = EdgeInsets.zero,
    this.effectBorderRadius = 0,
  });

  @override
  State<CustomGestureDetectorWithFillInteraction> createState() => _CustomGestureDetectorWithFillInteractionState();
}

class _CustomGestureDetectorWithFillInteractionState extends State<CustomGestureDetectorWithFillInteraction> {
  bool isPressed = false;

  void pressUp() {
    if (widget.onTap == null) {
      return;
    }
    setState(() {
      isPressed = false;
    });
  }

  void pressDown() {
    if (widget.onTap == null) {
      return;
    }
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapCancel: pressUp,
      child: Listener(
        onPointerDown: (_) => pressDown(),
        onPointerUp: (_) => pressUp(),
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: isPressed ? 0.05 : 0,
                  duration: widget.duration,
                  child: Container(
                    margin: widget.effectPadding,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(widget.effectBorderRadius),
                    ),
                  ),
                ),
              ),
              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}

class CustomGestureDetectorWithOpacityInteraction extends StatefulWidget {
  final void Function()? onTap;
  final Duration duration;
  final Widget child;
  const CustomGestureDetectorWithOpacityInteraction({super.key, this.onTap, required this.child, this.duration = const Duration(milliseconds: 100)});

  @override
  State<CustomGestureDetectorWithOpacityInteraction> createState() => _CustomGestureDetectorWithOpacityInteractionState();
}

class _CustomGestureDetectorWithOpacityInteractionState extends State<CustomGestureDetectorWithOpacityInteraction> {
  bool isPressed = false;

  void pressUp() {
    if (widget.onTap == null) {
      return;
    }
    setState(() {
      isPressed = false;
    });
  }

  void pressDown() {
    if (widget.onTap == null) {
      return;
    }
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapCancel: pressUp,
      child: Listener(
        onPointerDown: (_) => pressDown(),
        onPointerUp: (_) => pressUp(),
        child: Container(
          color: Colors.transparent,
          child: AnimatedOpacity(
            duration: widget.duration,
            curve: Curves.easeOut,
            opacity: isPressed ? 0.6 : 1,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class CustomGestureDetectorWithScaleInteraction extends StatefulWidget {
  final void Function()? onTap;
  final Duration duration;
  final Widget child;
  const CustomGestureDetectorWithScaleInteraction({super.key, this.onTap, required this.child, this.duration = const Duration(milliseconds: 100)});

  @override
  State<CustomGestureDetectorWithScaleInteraction> createState() => _CustomGestureDetectorWithScaleInteractionState();
}

class _CustomGestureDetectorWithScaleInteractionState extends State<CustomGestureDetectorWithScaleInteraction> {
  bool isPressed = false;

  void pressUp() {
    if (widget.onTap == null) {
      return;
    }
    setState(() {
      isPressed = false;
    });
  }

  void pressDown() {
    if (widget.onTap == null) {
      return;
    }
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isPressed ? 0.97 : 1,
      duration: widget.duration,
      curve: Curves.easeOut,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapCancel: pressUp,
        child: Listener(
          onPointerDown: (_) => pressDown(),
          onPointerUp: (_) => pressUp(),
          child: widget.child,
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final void Function()? onTap;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BoxBorder? border;

  const CustomButton({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.border,
    this.foregroundColor,
    required this.child,
  });

  CustomButton.loading({
    super.key,
    this.backgroundColor,
    this.border,
    this.foregroundColor,
  })  : onTap = null,
        child = SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(color: foregroundColor ?? Colors.white, strokeWidth: 2),
        );

  CustomButton.disabled({
    super.key,
    Color? backgroundColor,
    Color? foregroundColor,
    this.border,
    required this.child,
  })  : onTap = null,
        backgroundColor = backgroundColor ?? primaryColor.withAlpha(100),
        foregroundColor = foregroundColor ?? Colors.white.withAlpha(120);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return CustomGestureDetectorWithScaleInteraction(
      onTap: () {},
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: CustomGestureDetectorWithOpacityInteraction(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: widget.border,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: DefaultTextStyle.merge(
                  style: TextStyles.titleTextStyle.copyWith(
                    color: widget.foregroundColor ?? Colors.white,
                    fontSize: 18.0,
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
