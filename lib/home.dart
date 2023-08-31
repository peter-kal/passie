import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passie/password.dart';
import 'package:passie/provider.dart';
import 'package:provider/provider.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:passie/copymessage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController pacoforsymbols = TextEditingController();
  @override
  void initState() {
    super.initState();
    pacoforsymbols = new TextEditingController(text: SymbolsValue);
  }

  var SymbolsValue = '@!#{}[]":%^&*()';
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
              tooltip: 'More Info',
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      titlePadding: EdgeInsets.zero,
                      title: const YaruDialogTitleBar(
                        centerTitle: true,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            YaruIconButton(icon: Icon(Icons.info)),
                            SizedBox(
                              width: 5,
                            ),
                            Text("More Info")
                          ],
                        ),
                        isClosable: true,
                      ),
                      content: SizedBox(
                        height: 300,
                        width: 300,
                        child: Column(
                          children: [
                            const Card(
                              child: YaruSection(
                                  child: YaruTile(
                                title: Text('Created By:'),
                                trailing: Text("Peter Kal"),
                              )),
                            ),
                            const SizedBox(height: 10),
                            Card(
                              child: YaruSection(
                                  child: Column(children: [
                                const YaruTile(
                                  title: Text("License:"),
                                  trailing: SelectableText("MPL-2.0"),
                                ),
                                YaruTile(
                                    title: const Text("Source Code:"),
                                    trailing: ElevatedButton(
                                      onPressed: () {
                                        const copyforlink = ClipboardData(
                                            text:
                                                'https://github.com/peter-kal/passie');
                                        Clipboard.setData(copyforlink)
                                            .then((result) {
                                          copySnack;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(copySnack);
                                      },
                                      child: const Row(
                                        children: [
                                          Text("Copy Link"),
                                          SizedBox(width: 5),
                                          Icon(Icons.copy)
                                        ],
                                      ),
                                    )),
                              ])),
                            ),
                            const SizedBox(height: 10),
                            Consumer<ToCodeVariables>(
                              builder: (context, value, child) => Card(
                                child: YaruSection(
                                    child: SizedBox(
                                  child: TextField(
                                    controller: pacoforsymbols,
                                    enabled: true,
                                    decoration: InputDecoration(
                                      suffix: YaruIconButton(
                                        tooltip: 'Restore',
                                        icon: const Icon(Icons.restore),
                                        onPressed: () {
                                          pacoforsymbols.text =
                                              value.SymbolsValue;
                                        },
                                      ),
                                      labelText: 'Symbols',
                                    ),
                                    onSubmitted: (newsym) {
                                      newsym = pacoforsymbols.text;
                                      value.updateSymbolsValue(newsym);
                                    },
                                    onChanged: (newsym) {
                                      newsym = pacoforsymbols.text;
                                      value.updateSymbolsValue(newsym);
                                    },
                                  ),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              icon: const Icon(Icons.info),
            )),
        bottomNavigationBar: BottomAppBar(
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
                          final copy = ClipboardData(text: paco.text);
                          Clipboard.setData(copy).then((result) {
                            copySnack;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(copySnack);
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
                child: Consumer<ToCodeVariables>(
                  builder: (context, value, child) => FilledButton(
                      onPressed: () {
                        var password = Password(
                            value.isClicked_Numbers,
                            value.isClicked_Symbols,
                            value.isClicked_CapitalLetters,
                            value.isClicked_SmallLetters,
                            value.l,
                            value.SymbolsValue);
                        paco.text = password;
                      },
                      child: const Text("Generate Password")),
                ),
              )
            ],
          ),
        ),
        body: Consumer<ToCodeVariables>(
          builder: (context, value, child) => Center(
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
                        value: value.isClicked_Numbers,
                        subtitle: const Text("Add Numbers to your password"),
                        onChanged: (newNum) {
                          value.updateNumbers(newNum);
                        },
                        title: const Text("Numbers")),
                    YaruCheckboxListTile(
                        subtitle: const Text(
                            "Add Lower Case Letters to your password"),
                        value: value.isClicked_SmallLetters,
                        onChanged: (newSml) {
                          value.updateSmallLetters(newSml);
                        },
                        title: const Text("Lower Letters")),
                    YaruCheckboxListTile(
                        subtitle:
                            const Text("Add Capital Letters to your password"),
                        value: value.isClicked_CapitalLetters,
                        onChanged: (newCap) {
                          value.updateCapitalLetters(newCap);
                        },
                        title: const Text("Capital Letters")),
                    YaruCheckboxListTile(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        subtitle: const Text("Add Symbols to your password"),
                        value: value.isClicked_Symbols,
                        onChanged: (newSym) {
                          value.updateSymbols(newSym);
                        },
                        title: const Text("Symbols"))
                  ]),
                ),
                const SizedBox(
                  height: 3,
                ),
                Consumer<ToCodeVariables>(
                  builder: (context, value, child) => SizedBox(
                      width: 150,
                      height: 40,
                      child: CartStepperInt(
                        editKeyboardType: TextInputType.number,
                        size: 46,
                        value: value.l,
                        axis: Axis.horizontal,
                        didChangeCount: (newl) {
                          value.updatel(newl);
                        },
                      )),
                ),
                const SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
        ));
  }
}
