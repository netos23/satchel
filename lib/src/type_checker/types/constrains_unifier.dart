import 'package:satchel/satchel.dart';
import 'package:satchel/src/type_checker/model/constraints.dart';
import 'package:satchel/src/util/iterable.dart';

class ConstrainsUnifier {
  const ConstrainsUnifier();

  bool unify(Set<Constraints> constrains) {
    final result = <Constraints>[];
    Set<Constraints> constraintsSet = constrains;

    while (constraintsSet.isNotEmpty) {
      final constraint = constraintsSet.first;
      constraintsSet.remove(constraint);

      if (constraint.lhs == constraint.rhs) {
        continue;
      } else if (constraint.lhs is TypeVar &&
          !constraint.rhs.freeVars().contains(constraint.lhs)) {
        constraintsSet = constraintsSet
            .map((c) => c.replace(constraint.lhs, constraint.rhs))
            .toSet();
      } else if (constraint.rhs is TypeVar &&
          !constraint.lhs.freeVars().contains(constraint.rhs)) {
        constraintsSet = constraintsSet
            .map((c) => c.replace(constraint.rhs, constraint.lhs))
            .toSet();
      } else if (constraint case Constraints(
        lhs: TypeSum(left: final ll?, right: final lr?),
        rhs: TypeSum(left: final rl?, right: final rr?),
      )) {
        constraintsSet.add(Constraints(lhs: ll, rhs: rl));
        constraintsSet.add(Constraints(lhs: lr, rhs: rr));
      } else if (constraint case Constraints(
        lhs: Func(args: final largs, returnType: final lret),
        rhs: Func(args: final rargs, returnType: final rret),
      )) {
        constraintsSet.add(Constraints(lhs: lret, rhs: rret));
        for (final (la, ra) in ZipIterable(largs, rargs)) {
          constraintsSet.add(Constraints(lhs: la, rhs: ra));
        }
      } else if (constraint case Constraints(
        lhs: TypeTuple(types: final ltypes),
        rhs: TypeTuple(types: final rtypes),
      )) {
        for (final (la, ra) in ZipIterable(ltypes, rtypes)) {
          if (la == null || ra == null) {
            continue;
          }
          constraintsSet.add(Constraints(lhs: la, rhs: ra));
        }
      } else if (constraint case Constraints(
        lhs: TypeRecord(types: final ltypes),
        rhs: TypeRecord(types: final rtypes),
      )) {
        for (final entry in ltypes.entries) {
          final lhs = entry.value;
          final rhs = rtypes[entry.key];
          if (lhs == null || rhs == null) {
            continue;
          }

          constraintsSet.add(Constraints(lhs: lhs, rhs: rhs));
        }
      } else if (constraint case Constraints(
        lhs: TypeVariant(types: final ltypes),
        rhs: TypeVariant(types: final rtypes),
      )) {
        for (final entry in ltypes.entries) {
          final lhs = entry.value;
          final rhs = rtypes[entry.key];
          if (lhs == null || rhs == null) {
            continue;
          }

          constraintsSet.add(Constraints(lhs: lhs, rhs: rhs));
        }
      } else if (constraint case Constraints(
        lhs: TypeList(type: final ltype?),
        rhs: TypeList(type: final rtype?),
      )) {
        constraintsSet.add(Constraints(lhs: ltype, rhs: rtype));
      } else {
        return false;
      }
    }

    return true;
  }
}
