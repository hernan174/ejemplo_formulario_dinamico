import 'package:flutter/material.dart';

class ButtonModeWidget extends StatelessWidget {
  const ButtonModeWidget(
      {Key? key,
      required this.child,
      this.onPressed,
      required this.padding,
      required this.style,
      this.focusNode})
      : super(key: key);

  final Widget child;
  final Function()? onPressed;
  final EdgeInsets? padding;
  final ButtonStyle style;
  final FocusNode? focusNode;

  factory ButtonModeWidget.botonSimple(
      {Key key,
      required String titulo,
      EdgeInsets? padding,
      required Function() onPressed,
      double? tamanioTexto,
      ButtonStyle? style}) = _CustomButtonSimple;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: ElevatedButton(
          onPressed: onPressed,
          style: style,
          focusNode: focusNode,
          child: child),
    );
  }
}

class _CustomButtonSimple extends ButtonModeWidget {
  _CustomButtonSimple({
    super.key,
    required String titulo,
    super.onPressed,
    EdgeInsets? padding,
    ButtonStyle? style,
    double? tamanioTexto,
  }) : super(
            child: _CustomChildButtonSimple(
                titulo: titulo, tamanioTexto: tamanioTexto),
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            style: style ?? const ButtonStyle());
}

class _CustomChildButtonSimple extends StatelessWidget {
  const _CustomChildButtonSimple(
      {Key? key, required this.titulo, this.tamanioTexto})
      : super(key: key);
  final String titulo;
  final double? tamanioTexto;
  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: const TextStyle(color: Colors.white),
    );
  }
}
