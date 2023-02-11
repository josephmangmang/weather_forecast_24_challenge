import 'package:flutter/material.dart';

typedef SafeValueWidgetBuilder<T> = Widget Function(
    BuildContext context, T value);

class OptionalView<T extends Object> extends StatelessWidget {
  const OptionalView({
    super.key,
    required this.value,
    this.alternative,
    required this.builder,
  });

  final T? value;
  final WidgetBuilder? alternative;
  final SafeValueWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      return builder(context, value!);
    }

    return alternative?.call(context) ?? const SizedBox.shrink();
  }
}
