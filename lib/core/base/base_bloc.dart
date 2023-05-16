import 'package:dartz/dartz.dart';

mixin BaseBlocMixin {
  Either<String?, M> handleBlocData<M>({
    required Either<String?, M> response,
    required Function(M data) onData,
    required Function(String? error) onFailure,
  }) {
    try {
      return response.fold((error) => onFailure(error), (data) {
        return onData(data);
      });
    } on String catch (e) {
      return onFailure(e.toString());
    }
  }
}
