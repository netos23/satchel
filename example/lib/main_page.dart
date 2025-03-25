import 'package:example/editor/editor.dart';
import 'package:example/model.dart';
import 'package:example/util/theme.dart';
import 'package:example/view/graph_view.dart';
import 'package:example/widgets/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.theme,
    required this.modeState,
  });

  final ValueNotifier<ThemeMode> modeState;
  final ThemeData theme;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final model = AppModel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: model.state,
      builder: (context, state, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Satchel type checker'),
            actions: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     width: 150,
              //     child: DropdownButtonFormField(
              //       decoration: InputDecoration(border: OutlineInputBorder()),
              //       value: state.target,
              //       items: AppTarget.values
              //           .map(
              //             (t) => DropdownMenuItem(
              //               value: t,
              //               child: Text(t.name),
              //             ),
              //           )
              //           .toList(),
              //       onChanged: model.changeTarget,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(backgroundColor: Colors.green),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Run'),
                  onPressed: switch (state) {
                    LoadingAppState() => null,
                    _ => switch (state.target) {
                        AppTarget.modelTypeCheck => model.runTypeCheck,
                      },
                  },
                ),
              ),
            ],
          ),
          body: Focus(
            autofocus: true,
            child: SplitView(
              viewMode: SplitViewMode.Horizontal,
              gripColor: widget.theme.colorScheme.surfaceContainerHigh,
              gripColorActive: widget.theme.colorScheme.surfaceContainerHigh,
              gripSize: defaultGripSize,
              children: [
                EditorWidget(controller: model.sourceCodeController),
                switch (state) {
                  ResultAppState(:final model) => switch (model) {
                      ModelResultArtifact(:final model) => ReportView(
                          text: model,
                        ),
                    },
                  _ => const SizedBox(),
                },
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Made with Flutter'),
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      child: Visibility(
                        visible: state is LoadingAppState,
                        child: const LinearProgressIndicator(),
                      ),
                    ),
                    MiniIconButton(
                      small: false,
                      icon: switch (widget.modeState.value) {
                        ThemeMode.system => Icons.light_mode,
                        ThemeMode.light => Icons.light_mode,
                        ThemeMode.dark => Icons.dark_mode,
                      },
                      tooltip: 'Theme mode',
                      onPressed: () {
                        widget.modeState.value =
                            switch (widget.modeState.value) {
                          ThemeMode.system => ThemeMode.light,
                          ThemeMode.light => ThemeMode.dark,
                          ThemeMode.dark => ThemeMode.light,
                        };
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}
