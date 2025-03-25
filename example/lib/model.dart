import 'package:antlr4/antlr4.dart';
import 'package:satchel/satchel.dart';
import 'package:flutter/cupertino.dart';

enum AppTarget {
  modelTypeCheck,
}

sealed class AppState {
  final String source;
  final AppTarget target;

  AppState(
    this.source,
    this.target,
  );
}

final class IdleAppState extends AppState {
  IdleAppState(
    super.source,
    super.target,
  );
}

final class LoadingAppState extends AppState {
  LoadingAppState(
    super.source,
    super.target,
  );
}

sealed class ResultArtifact {}

class ModelResultArtifact extends ResultArtifact {
  final String model;

  ModelResultArtifact(this.model);
}


final class ResultAppState extends AppState {
  final ResultArtifact model;

  ResultAppState(this.model, super.source, super.target);
}


class AppModel {
  final ValueNotifier<AppState> state = ValueNotifier(
    IdleAppState(
      '',
      AppTarget.modelTypeCheck,
    ),
  );
  final sourceCodeController = TextEditingController();

  Future<void> runTypeCheck() async {
    final text = sourceCodeController.text;
    state.value = LoadingAppState(text, state.value.target);
    try {
      final input =  InputStream.fromString(text);
      final report = buildStellaTypeReport(input);
      final model = report.toString();
      await Future.delayed(const Duration(seconds: 1));
      state.value = ResultAppState(
        ModelResultArtifact(model),
        text,
        state.value.target,
      );
    } catch (e) {
      state.value = IdleAppState(text, state.value.target);
    }
  }


  void changeTarget(AppTarget? target) {
    state.value = IdleAppState(
      state.value.source,
      target ?? AppTarget.modelTypeCheck,
    );
  }

  void dispose() {
    state.dispose();
    sourceCodeController.dispose();
  }
}
