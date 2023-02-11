import 'package:flutter/material.dart';

typedef AppButtonCallback = Future<void> Function();

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final AppButtonCallback onPressed;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          side: BorderSide(color: Colors.black, width: 2),
        ),
        onPressed: isProcessing ? null : _onTap,
        child: isProcessing
            ? Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2),
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                ))
            : Text(
                widget.label,
                style: Theme.of(context).textTheme.labelLarge,
              ));
  }

  Future<void> _onTap() async {
    setState(() {
      isProcessing = true;
    });
    await widget.onPressed();

    setState(() {
      isProcessing = false;
    });
  }
}
