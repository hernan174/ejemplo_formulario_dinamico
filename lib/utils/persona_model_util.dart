import 'package:ejemplo_formulario_dinamico/models/persona_model.dart';

///Clase utilidad para realizar formularios de forma dinamica
class PersonaModelUtil {
  ///Mapa utilizado para la generacion de formulario
  ///La clave es la misma que tiene la clase [PersonaModel] y no debe modificarse ya que es el que hace referencia
  ///a la vista con el modelo
  ///El valor es el texto que se utilizara para  visualizar en los formularios y se puede modificar
  static final Map<String, String> datosFichaPersona = {
    'Nombre': 'Apellido y Nombre',
    'Edad': 'Edad',
    'DireccionCasa': 'Direccion',
  };

  ///Lista para determinar que campos son los que se va a cargar en el formulario. Los valores son las claves
  /// del mapa [datosFichaPersona]
  static final List<String> datosPersonales = [
    'Nombre',
    'Edad',
  ];
}
