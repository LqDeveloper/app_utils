
extension ObjectExtensions on Object{
  T map<T>(T f(dynamic e)){
    return f(this);
  }
}