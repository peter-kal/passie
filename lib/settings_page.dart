import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passie/bloc/blocs.dart';
import 'package:passie/copymessage.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pacoforsymbols = TextEditingController();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 2,
          child: Card(
              elevation: 1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<PassieBloc, PassieState>(
                      builder: (context, state) {
                    if (state is LoadedState) {
                      pacoforsymbols.text = state.symbols;
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          controller: pacoforsymbols,
                          onChanged: (value) {
                            BlocProvider.of<PassieBloc>(context)
                                .add(SymbolsChanged(value));
                          },
                          decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!
                                  .symsUsedLabelText,
                              suffix: YaruIconButton(
                                tooltip: AppLocalizations.of(context)!
                                    .symsUsedRestoreButtonTooltip,
                                icon: const Icon(Icons.restore),
                                onPressed: () {
                                  BlocProvider.of<PassieBloc>(context).add(
                                      const RestoreButtonForSymsClickedEvent());
                                },
                              )),
                        ),
                      );
                    } else {
                      return const YaruCircularProgressIndicator();
                    }
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ),
      ),
      appBar: YaruWindowTitleBar(
        isMaximizable: false,
        title: Text(AppLocalizations.of(context)!.settingsAppBarTitle),
        leading: SizedBox(
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              BlocProvider.of<PagenavigationBloc>(context)
                  .add(const PasswordPageEvent());
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 180,
        elevation: 80,
        child: Center(
          child: ListView(
            children: [
              Card(
                child: YaruSection(
                    child: YaruTile(
                  title: Text('${AppLocalizations.of(context)!.license}:'),
                  trailing: const SelectableText("MPL-2.0"),
                )),
              ),
              Card(
                  child: YaruSection(
                child: YaruTile(
                  title: Text("${AppLocalizations.of(context)!.sourceCode}:"),
                  trailing: ElevatedButton(
                    child: Row(
                      children: [
                        Text(AppLocalizations.of(context)!.copylinkbutton),
                        const SizedBox(width: 5),
                        const Icon(Icons.copy)
                      ],
                    ),
                    onPressed: () {
                      const copyforlink = ClipboardData(
                          text: 'https://github.com/peter-kal/passie');
                      Clipboard.setData(copyforlink).then((result) {
                        copySnack;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(copySnack);
                    },
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
