import 'package:dartz/dartz.dart';

mixin BaseBlocMixin {
  Either<String?, M> handleBlocData<M>({
    required Either<String?, M> response,
    required Function(M data) onData,
    required Function(String? error) onFailure,
  }) {
    try {
      return response.fold((error) => left(onFailure(error)), (data) {
        return right(onData(data));
      });
    } on String catch (e) {
      return left(onFailure(e));
    }
  }
}
