import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passie/bloc/blocs.dart';
import 'package:yaru_icons/yaru_icons.dart';
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
          child: BlocListener<CopyBloc, CopyState>(
            listener: (context, state) {
              if (state is CopiedMaterialState) {
                var newsnackbar = SnackBar(
                    elevation: 20,
                    duration: const Duration(milliseconds: 600),
                    showCloseIcon: true,
                    shape: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    content: Row(
                      children: [
                        const Icon(
                          YaruIcons.ok_simple,
                          color: Colors.green,
                        ),
                        Text(
                          AppLocalizations.of(context)!.copySnackBarMessage,
                        ),
                      ],
                    ));
                ScaffoldMessenger.of(context).showSnackBar(newsnackbar);
                BlocProvider.of<CopyBloc>(context).add(ResetStateEvent());
              }
            },
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
                    title: Row(
                      children: [
                        Text("${AppLocalizations.of(context)!.sourceCode}:"),
                        YaruIconButton(
                          icon: const Icon(YaruIcons.information),
                          tooltip: AppLocalizations.of(context)!
                              .helpWithTranslationInfoButtonTooltip,
                        )
                      ],
                    ),
                    trailing: ElevatedButton(
                      child: Row(
                        children: [
                          Text(AppLocalizations.of(context)!.copylinkbutton),
                          const SizedBox(width: 5),
                          const Icon(Icons.copy)
                        ],
                      ),
                      onPressed: () {
                        BlocProvider.of<CopyBloc>(context).add(
                            const CopyButtonClicked(
                                'https://github.com/peter-kal/passie'));
                      },
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
