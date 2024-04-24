/// The model of the return value of pop method.
class PopResult {
  /// Return [false] if user just simply pops the route, no actions had been done.
  bool status;

  /// Return page send data
  String resultFromPage;

  /// The result of the popped route.
  dynamic data;

  PopResult({
    required this.status,
    required this.resultFromPage,
    this.data,
  });
}
