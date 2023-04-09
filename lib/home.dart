import 'package:flutter/material.dart';
import 'package:passie/password.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:cart_stepper/cart_stepper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? isClicked_Numbers = true;
  bool? isClicked_SmallLetters = true;
  bool? isClicked_CapitalLetters = true;
  bool? isClicked_Symbols = false;
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
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                YaruCheckboxListTile(
                    value: isClicked_Numbers,
                    subtitle: const Text("Add Numbers to your password"),
                    onChanged: (newNum) {
                      setState(() {
                        isClicked_Numbers = newNum;
                      });
                    },
                    title: const Text("Numbers")),
                YaruCheckboxListTile(
                    subtitle: const Text("Add Small Letters to your password"),
                    value: isClicked_SmallLetters,
                    onChanged: (newSml) {
                      setState(() {
                        isClicked_SmallLetters = newSml;
                      });
                    },
                    title: const Text("Small Letters")),
                YaruCheckboxListTile(
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
          SizedBox(
              width: 150,
              height: 35,
              child: CartStepperInt(
                size: 50,
                value: l,
                axis: Axis.horizontal,
                didChangeCount: (value) {
                  setState(() {
                    l = value;
                  });
                },
              )),
          const SizedBox(
            width: 1,
            height: 10,
          ),
          Container(
            alignment: Alignment.bottomCenter,
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
          SizedBox(
            width: 300,
            child: TextField(
              controller: paco,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
