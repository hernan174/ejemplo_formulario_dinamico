abstract class ModeloBase<T> {
  T copyWithFromKey({required String key, required String valor});

  Map<String, dynamic> toJson();
}
