import 'package:satchel/src/type_checker/model/stella_types.dart';

class VariableGenerator {
  static VariableGenerator instance = VariableGenerator._();
  final String prefix;
  int _seq = 0;

  VariableGenerator._([this.prefix = 'T']);

  TypeVar nextVariable(){
    return TypeVar('${prefix}-${_seq++}');
  }
}