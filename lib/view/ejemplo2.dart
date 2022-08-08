import 'dart:developer';

import 'package:ejemplo_formulario_dinamico/models/pais_model.dart';
import 'package:ejemplo_formulario_dinamico/utils/pais_model_util.dart';
import 'package:ejemplo_formulario_dinamico/utils/persona_model_util.dart';
import 'package:ejemplo_formulario_dinamico/widgets/modelo_generico_widget.dart';
import 'package:flutter/material.dart';

import 'package:ejemplo_formulario_dinamico/models/persona_model.dart';
import 'package:ejemplo_formulario_dinamico/widgets/button_widget.dart';

class FormularioDinamico2 extends StatefulWidget {
  const FormularioDinamico2({
    Key? key,
  }) : super(key: key);

  @override
  State<FormularioDinamico2> createState() => _FormularioDinamico2State();
}

class _FormularioDinamico2State extends State<FormularioDinamico2> {
  PersonaModel persona = PersonaModel();
  PaisModel pais = PaisModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///Recorro el modelo que tengo definido en el widget para mostrar la actualizacion de sus valores
            ModeloGenericoWidget(
                where: PersonaModelUtil.datosPersonales,
                titulos: PersonaModelUtil.datosFichaPersona,
                modeloFormulario: persona,
                onChanged: (value) {
                  ///Actualizo mi modelo en base a los cambios de [value]
                  if (value.isNotEmpty) {
                    persona = persona.copyWithFromKey(
                        key: value.keys.first, valor: value.values.first);
                  }
                }),
            ModeloGenericoWidget(
                titulos: PaisModelUtil.datosFichaPersona,
                modeloFormulario: pais,
                onChanged: (value) {
                  ///Actualizo mi modelo en base a los cambios de [value]
                  if (value.isNotEmpty) {
                    pais = pais.copyWithFromKey(
                        key: value.keys.first, valor: value.values.first);
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonModeWidget.botonSimple(
                    titulo: 'Limpiar',
                    onPressed: () {
                      setState(() {
                        persona = PersonaModel();
                        pais = PaisModel();
                      });
                    }),
                ButtonModeWidget.botonSimple(
                    titulo: 'Cargar',
                    onPressed: () {
                      setState(() {
                        persona = PersonaModel(nombre: 'Hernan', edad: '28');
                        pais =
                            PaisModel(nombre: 'Argentina', abreviatura: 'ARG');
                      });
                    }),
                ButtonModeWidget.botonSimple(
                    titulo: 'Guardar',
                    onPressed: () {
                      log('>>>>>>>>${persona.toJson()}');
                      log('>>>>>>>>${pais.toJson()}');
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
