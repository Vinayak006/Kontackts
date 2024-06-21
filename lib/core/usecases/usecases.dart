// ignore_for_file: one_member_abstracts

abstract class Usecases<Type, Params> {
  Future<Type> call(final Params params);
}
