import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool? isClicked_Numbers = true;
  bool? isClicked_SmallLetters = true;
  bool? isClicked_CapitalLetters = true;
  bool? isClicked_Symbols = true;
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
      appBar: const YaruWindowTitleBar(
        title: Text(
          "Passie",
        ),
        isMaximizable: false,
        isMinimizable: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                YaruCheckboxListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    value: isClicked_Numbers,
                    subtitle: const Text("Add Numbers to your password"),
                    onChanged: (newNum) {
                      setState(() {
                        isClicked_Numbers = newNum;
                      });
                    },
                    title: const Text("Numbers")),
                YaruCheckboxListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    subtitle:
                        const Text("Add Lower Case Letters to your password"),
                    value: isClicked_SmallLetters,
                    onChanged: (newSml) {
                      setState(() {
                        isClicked_SmallLetters = newSml;
                      });
                    },
                    title: const Text("Lower Letters")),
                YaruCheckboxListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    subtitle:
                        const Text("Add Capital Letters to your password"),
                    value: isClicked_CapitalLetters,
                    onChanged: (newCap) {
                      setState(() {
                        isClicked_CapitalLetters = newCap;
                      });
                    },
                    title: const Text("Capital Letters")),
                YaruCheckboxListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    subtitle: const Text("Add Symbols to your password"),
                    value: isClicked_Symbols,
                    onChanged: (newSym) {
                      setState(() {
                        isClicked_Symbols = newSym;
                      });
                    },
                    title: const Text("Symbols")),
              ],
            ),
          ),
          const SizedBox(
            width: 1,
            height: 10,
          ),
          SizedBox(
              width: 150,
              height: 40,
              child: CartStepperInt(
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
            width: 1,
            height: 10,
          ),
          SizedBox(
            child: OutlinedButton(
                onPressed: () {
                  final password = Password(
                      isClicked_Numbers,
                      isClicked_Symbols,
                      isClicked_CapitalLetters,
                      isClicked_SmallLetters,
                      l);
                  paco.text = password;
                },
                child: const Text("Generate Password")),
          ),
          const SizedBox(
            width: 1,
            height: 20,
          ),
          SizedBox(
            width: 400,
            height: 50,
            child: TextField(
              controller: paco,
              style: const TextStyle(
                fontSize: 20,
              ),
              readOnly: true,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                  suffix: YaruIconButton(
                    icon: const Icon(Icons.copy),
                    tooltip: 'Copy to Clipboard',
                    onPressed: () {
                      final copy = ClipboardData(text: paco.text);
                      Clipboard.setData(copy).then((result) {
                        CopySnack;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(CopySnack);
                    },
                  ),
                  border: const OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
