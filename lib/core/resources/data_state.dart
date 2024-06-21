class DataState<T> {
  DataState({this.data, this.error});

  final T? data;
  final String? error;

  bool get isOk => data != null;
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess({required super.data});
}

class DataFailed<T> extends DataState<T> {
  DataFailed({required super.error});
}
