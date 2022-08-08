import 'dart:convert';

import 'package:ejemplo_formulario_dinamico/models/modelo_base.dart';

PaisModel paisModelFromJson(String str) => PaisModel.fromJson(json.decode(str));

String paisModelToJson(PaisModel data) => json.encode(data.toJson());

class PaisModel extends ModeloBase {
  PaisModel({
    this.nombre = '',
    this.abreviatura = '',
  });

  final String nombre;
  final String abreviatura;

  factory PaisModel.fromJson(Map<String, dynamic> json) => PaisModel(
        nombre: json["Nombre"],
        abreviatura: json["Abreviatura"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "Abreviatura": abreviatura,
      };

  ///Este Metodo se utiliza actualizar un valor del modelo actual.

  /// [parametros] - requiere [key, valor]
  /// `key` Tiene que ser una clave que se encuentre en la clase [PaisModel.toJson].
  /// `valor` Es el nuevo valor que se le quiere asignar a la propiedad.
  /// Si se proporciona una clave que no existe `devolvera el modelo sin ningun cambio`
  @override
  PaisModel copyWithFromKey({required String key, required String valor}) {
    ///Paso el modelo a un json
    final Map<String, dynamic> datos = toJson();

    ///Verifico que la clave proporcionada se encuentre en el mapa
    if (datos.containsKey(key)) {
      ///Actualizo el mapa
      datos[key] = valor;
    }

    ///Vuelvo a pasar el mapa a un modelo y lo devuelvo
    return PaisModel.fromJson(datos);
  }
}
