import 'package:ejemplo_formulario_dinamico/models/pais_model.dart';

///Clase utilidad para realizar formularios de forma dinamica
class PaisModelUtil {
  ///Mapa utilizado para la generacion de formulario
  ///La clave es la misma que tiene la clase [PaisModel] y no debe modificarse ya que es el que hace referencia
  ///a la vista con el modelo
  ///El valor es el texto que se utilizara para  visualizar en los formularios y se puede modificar
  static final Map<String, String> datosFichaPersona = {
    'Nombre': 'Pais',
    'Abreviatura': 'Abreviatura',
  };
}
