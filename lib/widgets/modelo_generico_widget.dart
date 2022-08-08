import 'package:flutter/material.dart';

import 'package:ejemplo_formulario_dinamico/models/modelo_base.dart';
import 'package:ejemplo_formulario_dinamico/widgets/textfield_widget.dart';

class ModeloGenericoWidget<T extends ModeloBase> extends StatelessWidget {
  const ModeloGenericoWidget(
      {Key? key,
      required this.modeloFormulario,
      required this.onChanged,
      this.where,
      required this.titulos})
      : super(key: key);
  final T modeloFormulario;
  final List<String>? where;
  final Map<String, String> titulos;
  final Function(Map<String, String>) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: modeloFormulario

            ///Convierto el modelo en un json para poder mapear
            .toJson()

            ///Para armar el widget dinamico siempre recorro los [entries] del mapa mapa poder tener metodos como
            ///[where, map] que me permiten interactuar con el contenido
            .entries

            ///Si deseo omitir algun valor que tenga el mapa utilizo el metodo where
            .where((filtro) =>

                ///Especifico que me deje todos los elementos del mapa que se encuentren en la lista

                where?.contains(filtro.key) ?? true)

            ///Una vez que filtro convierto el mapa a un widget para visualizar en el formulario
            .map((item) => TextFieldModelWidget.estandar(
                  ///Como el key del modelo no lo quiero modificar y en su lugar necesito mostrar otro texto
                  ///recorro el mapa  que contiene todas las claves que el modelo original
                  ///y muestro el valor de este que es el texto que deseo mostrar en el formulario
                  labelTitulo: titulos[item.key] ?? '',

                  ///`item.value` es el valor que contenga el modelo actual
                  valorDefecto: item.value,

                  ///Cada vez que realice una interaccion con el campo del texto se dispará este evento y me actualizara el modelo
                  onChanged: (value) {
                    onChanged.call({item.key: value});
                  },
                ))
            .toList());
  }
}
