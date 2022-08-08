import 'dart:convert';

PersonaModel personaModelFromJson(String str) =>
    PersonaModel.fromJson(json.decode(str));

String personaModelToJson(PersonaModel data) => json.encode(data.toJson());

class PersonaModel {
  PersonaModel({
    this.nombre = '',
    this.direccion = '',
    this.edad = '',
  });

  final String nombre;
  final String direccion;
  final String edad;

  factory PersonaModel.fromJson(Map<String, dynamic> json) => PersonaModel(
        nombre: json["Nombre"] ?? '',
        direccion: json["DireccionCasa"] ?? '',
        edad: json["Edad"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "DireccionCasa": direccion,
        "Edad": edad,
      };

  ///Este Metodo se utiliza actualizar un valor del modelo actual.

  /// [parametros] - requiere [key, valor]
  /// `key` Tiene que ser una clave que se encuentre en la clase [PersonaModel.toJson].
  /// `valor` Es el nuevo valor que se le quiere asignar a la propiedad.
  /// Si se proporciona una clave que no existe `devolvera el modelo sin ningun cambio`
  PersonaModel copyWithFromKey({required String key, required String valor}) {
    ///Paso el modelo a un json
    final Map<String, dynamic> datos = toJson();

    ///Verifico que la clave proporcionada se encuentre en el mapa
    if (datos.containsKey(key)) {
      ///Actualizo el mapa
      datos[key] = valor;
    }

    ///Vuelvo a pasar el mapa a un modelo y lo devuelvo
    return PersonaModel.fromJson(datos);
  }
}
