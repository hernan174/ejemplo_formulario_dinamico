import 'package:flutter/material.dart';

class TextFieldModelWidget extends StatelessWidget {
  const TextFieldModelWidget(
      {Key? key, required this.labelTitulo, this.onChanged, this.controller})
      : super(key: key);

  final String labelTitulo;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      height: 43,
      child: TextFormField(
          autofocus: false,
          controller: controller,
          style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 13),
          textCapitalization: TextCapitalization.sentences,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: const BorderSide(width: 0.1)),
            contentPadding: const EdgeInsets.only(left: 10, bottom: 5),
            labelStyle: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black54, fontSize: 13),
            labelText: labelTitulo,
          )),
    );
  }

  ///`valorDefecto` Texto que se desea mostrar. Se setea al campo unicamente si `controller` es [null]
  ///`controller` Si se desea tener acceso al controller del lado del formulario para interactuar con el
  ///`labelTitulo` Titulo para el campo
  ///`onChanged` Evento que se dispara cada vez que se interactua con el campo de texto.
  factory TextFieldModelWidget.estandar(
      {Key key,
      String? valorDefecto,
      TextEditingController? controller,
      required String labelTitulo,
      Function(String)? onChanged}) = _TextfieldEstandarModelWidget;
}

class _TextfieldEstandarModelWidget extends TextFieldModelWidget {
  final String? valorDefecto;
  _TextfieldEstandarModelWidget(
      {super.key,
      TextEditingController? controller,
      this.valorDefecto,
      required super.labelTitulo,
      super.onChanged})
      : super(
            controller:
                controller ?? TextEditingController(text: valorDefecto));
}
