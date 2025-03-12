/// Extension for the Object class to allow for a let function with Kotlin style.
extension LetExtension<T> on T? {
  /// Returns the result of the lambda function if the object is not null.
  /// If the object is null, returns the value of [ifNull].
  R? let<R>(R? Function(T) lambda, {R? ifNull}) {
    if (this != null) {
      return lambda(this as T);
    }
    return ifNull;
  }
}