import 'package:ejemplo_formulario_dinamico/widgets/modelo_generico_widget.dart';

///Clase padre de la cual deben extender las clases que deseen utilizar el widget [ModeloGenericoWidget]
///Posee 2 modelos de metodos `copyWithFromKey` para actualizar los valores del modelo y `toJson`
///para pasar el modelo a un mapa que posteriormente se utiliza para convertir en un widget
abstract class ModeloBase<T> {
  T copyWithFromKey({required String key, required String valor});

  Map<String, dynamic> toJson();
}
