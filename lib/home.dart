import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:passie/password.dart';

import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:passie/copymessage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClicked_Numbers = true;
  bool isClicked_SmallLetters = true;
  bool isClicked_CapitalLetters = true;
  bool isClicked_Symbols = true;
  TextEditingController pacoforsymbols = TextEditingController();
  @override
  void initState() {
    super.initState();
    pacoforsymbols = new TextEditingController(text: SymbolsValue);
  }

  var SymbolsValue = '@!#{}[]":%^&*()';
  int l = 15;
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
                        title: Text("More Info"),
                        isClosable: true,
                      ),
                      content: SizedBox(
                        height: 300,
                        width: 300,
                        child: Column(
                          children: [
                            const YaruSection(
                                child: YaruTile(
                              title: Text('Created By:'),
                              trailing: Text("Peter Kal"),
                            )),
                            const SizedBox(height: 10),
                            YaruSection(
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
                            const SizedBox(height: 10),
                            YaruSection(
                                child: SizedBox(
                              child: TextField(
                                controller: pacoforsymbols,
                                enabled: true,
                                decoration: InputDecoration(
                                  suffix: YaruIconButton(
                                    tooltip: 'Restore',
                                    icon: const Icon(Icons.restore),
                                    onPressed: () {
                                      SymbolsValue = '@!#{}[]":%^&*()';
                                      pacoforsymbols.text = SymbolsValue;
                                    },
                                  ),
                                  labelText: 'Symbols',
                                ),
                                onSubmitted: (newsym) {
                                  newsym = pacoforsymbols.text;
                                  SymbolsValue = pacoforsymbols.text;
                                },
                                onChanged: (newsym) {
                                  newsym = pacoforsymbols.text;
                                  SymbolsValue = pacoforsymbols.text;
                                },
                              ),
                            ))
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
                  enableInteractiveSelection: false,
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
                child: FilledButton(
                    onPressed: () {
                      var password = Password(
                          isClicked_Numbers,
                          isClicked_Symbols,
                          isClicked_CapitalLetters,
                          isClicked_SmallLetters,
                          l,
                          SymbolsValue);
                      paco.text = password;
                    },
                    child: const Text("Generate Password")),
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              YaruSection(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(8),
                child: Column(children: [
                  YaruSwitchListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      value: isClicked_Numbers,
                      subtitle: const Text("Add Numbers to your password"),
                      onChanged: (newNum) {
                        setState(() {
                          isClicked_Numbers = newNum;
                        });
                      },
                      title: const Text("Numbers")),
                  YaruSwitchListTile(
                      subtitle:
                          const Text("Add Lower Case Letters to your password"),
                      value: isClicked_SmallLetters,
                      onChanged: (newSml) {
                        setState(() {
                          isClicked_SmallLetters = newSml;
                        });
                      },
                      title: const Text("Lower Letters")),
                  YaruSwitchListTile(
                      subtitle:
                          const Text("Add Capital Letters to your password"),
                      value: isClicked_CapitalLetters,
                      onChanged: (newCap) {
                        setState(() {
                          isClicked_CapitalLetters = newCap;
                        });
                      },
                      title: const Text("Capital Letters")),
                  YaruSwitchListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      subtitle: const Text("Add Symbols to your password"),
                      value: isClicked_Symbols,
                      onChanged: (newSym) {
                        setState(() {
                          isClicked_Symbols = newSym;
                        });
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
                    value: l,
                    axis: Axis.horizontal,
                    didChangeCount: (value) {
                      setState(() {
                        l = value;
                        if (l < 5) {
                          // Make 5 the minimum
                          l = 5;
                        }
                        if (l > 100000) {
                          // Makes 100000 the maximum
                          l = 100000;
                        }
                      });
                    },
                  )),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        ));
  }
}
