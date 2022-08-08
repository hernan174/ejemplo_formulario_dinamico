import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:ejemplo_formulario_dinamico/models/persona_model.dart';
import 'package:ejemplo_formulario_dinamico/utils/persona_model_util.dart';
import 'package:ejemplo_formulario_dinamico/widgets/button_widget.dart';
import 'package:ejemplo_formulario_dinamico/widgets/textfield_widget.dart';

class FormularioDinamico1 extends StatefulWidget {
  const FormularioDinamico1({
    Key? key,
  }) : super(key: key);

  @override
  State<FormularioDinamico1> createState() => _FormularioDinamico1State();
}

class _FormularioDinamico1State extends State<FormularioDinamico1> {
  PersonaModel persona = PersonaModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///Recorro el modelo que tengo definido en el widget para mostrar la actualizacion de sus valores
            ...persona

                ///Convierto el modelo en un json para poder mapear
                .toJson()

                ///Para armar el widget dinamico siempre recorro los [entries] del mapa mapa poder tener metodos como
                ///[where, map] que me permiten interactuar con el contenido
                .entries

                ///Si deseo omitir algun valor que tenga el mapa utilizo el metodo where
                .where((filtro) =>

                    ///Especifico que me deje todos los elementos del mapa que se encuentren en la lista
                    ///[PersonaModelUtil.datosPersonales]
                    PersonaModelUtil.datosPersonales.contains(filtro.key))

                ///Una vez que filtro convierto el mapa a un widget para visualizar en el formulario
                .map((item) => TextFieldModelWidget.estandar(
                      ///Como el key del modelo no lo quiero modificar y en su lugar necesito mostrar otro texto
                      ///recorro el mapa [PersonaModelUtil.datosFichaPersona] que contiene todas las claves que el modelo original
                      ///y muestro el valor de este que es el texto que deseo mostrar en el formulario
                      labelTitulo:
                          PersonaModelUtil.datosFichaPersona[item.key] ?? '',

                      ///`item.value` es el valor que contenga el modelo actual de [persona]
                      valorDefecto: item.value,

                      ///Cada vez que realice una interaccion con el campo del texto se dispará este evento y me actualizara el modelo
                      onChanged: (value) {
                        ///Actualizo mi modelo en base a los cambios de [value]
                        persona = persona.copyWithFromKey(
                            key: item.key, valor: value);
                      },
                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonModeWidget.botonSimple(
                    titulo: 'Limpiar',
                    onPressed: () {
                      setState(() {
                        persona = PersonaModel();
                      });
                    }),
                ButtonModeWidget.botonSimple(
                    titulo: 'Cargar',
                    onPressed: () {
                      setState(() {
                        persona = PersonaModel(nombre: 'Hernan', edad: '28');
                      });
                    }),
                ButtonModeWidget.botonSimple(
                    titulo: 'Guardar',
                    onPressed: () {
                      log('>>>>>>>>${persona.toJson()}');
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
