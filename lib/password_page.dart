import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passie/bloc/pagenavigationbloc/pagenavigation_bloc.dart';
import 'package:passie/bloc/passiebloc/passie_bloc.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:passie/copymessage.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController pacoforsymbols = TextEditingController();
  @override
  void initState() {
    super.initState();
    pacoforsymbols = TextEditingController();
  }

  var symbolsValue = '@!#{}[]":%^&*()';

  final paco = TextEditingController();
  @override
  void dispose() {
    paco.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YaruWindowTitleBar(
        title: const Text(
          "Passie",
        ),
        isMaximizable: false,
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            BlocProvider.of<PagenavigationBloc>(context)
                .add(const SettingsPageEvent());
          },
        ),
      ),
      bottomNavigationBar:
          BlocBuilder<PassieBloc, PassieState>(builder: (context, state) {
        if (state is LoadedState) {
          paco.text = state.thePasswordAtHand;
          return BottomAppBar(
            height: 120,
            elevation: 80,
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 45,
                  child: TextField(
                    controller: paco,
                    style: const TextStyle(
                        fontSize: 20, fontStyle: FontStyle.normal),
                    readOnly: true,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                        suffix: YaruIconButton(
                          icon: const Icon(Icons.copy),
                          tooltip: 'Copy to Clipboard',
                          onPressed: () {
                            final copy =
                                ClipboardData(text: state.thePasswordAtHand);
                            Clipboard.setData(copy).then((result) {
                              copySnack;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(copySnack);
                          },
                        ),
                        border: const OutlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: FilledButton(
                      onPressed: () {
                        context
                            .read<PassieBloc>()
                            .add(const FilledButtonForPasswordClickedEvent());
                        print(state.toString());
                      },
                      child: const Text("Generate Password")),
                )
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
      body: BlocBuilder<PassieBloc, PassieState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const CircularProgressIndicator();
          }
          if (state is LoadedState) {
            return Center(
              child: Column(
                children: [
                  YaruSection(
                    padding: const EdgeInsets.all(0),
                    margin: const EdgeInsets.all(8),
                    child: Column(children: [
                      YaruCheckboxListTile(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          value: state.default4Nums,
                          subtitle: const Text("Add Numbers to your password"),
                          onChanged: (newNum) {
                            context
                                .read<PassieBloc>()
                                .add(CheckBoxChanged(newNum!, 1));
                          },
                          title: const Text("Numbers")),
                      YaruCheckboxListTile(
                          subtitle: const Text(
                              "Add Lower Case Letters to your password"),
                          value: state.default4Low,
                          onChanged: (newSml) {
                            context
                                .read<PassieBloc>()
                                .add(CheckBoxChanged(newSml!, 2));
                          },
                          title: const Text("Lower Letters")),
                      YaruCheckboxListTile(
                          subtitle: const Text(
                              "Add Capital Letters to your password"),
                          value: state.default4Caps,
                          onChanged: (newCap) {
                            context
                                .read<PassieBloc>()
                                .add(CheckBoxChanged(newCap!, 3));
                          },
                          title: const Text("Capital Letters")),
                      YaruCheckboxListTile(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          subtitle: const Text("Add Symbols to your password"),
                          value: state.default4Syms,
                          onChanged: (newSym) {
                            context
                                .read<PassieBloc>()
                                .add(CheckBoxChanged(newSym!, 4));
                          },
                          title: const Text("Symbols"))
                    ]),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: CartStepperInt(
                      editKeyboardType: TextInputType.number,
                      size: 46,
                      value: state.defaultLength,
                      axis: Axis.horizontal,
                      didChangeCount: (newl) {
                        context
                            .read<PassieBloc>()
                            .add(LengthChangedEvent(newl));
                      },
                    ),
                  ),
                  const SizedBox(height: 3),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
