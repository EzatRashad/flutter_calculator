import 'dart:ffi';

import 'package:calc/core/themes/colors.dart';
import 'package:calc/core/utiles/utiles.dart';
import 'package:calc/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  Color color(String x) {
    if (x == '*' || x == '-' || x == '+' || x == '/' || x == '%') {
      return AppColors.orange;
    } else if (x == '=' || x == 'C') {
      return AppColors.green;
    } else if (x == 'Del') {
      return AppColors.red;
    } else {
      return AppColors.grey;
    }
  }

  logic(String symbols) {
    if (symbols == 'C') {
      setState(() {
        input = '';
        output = '';
      });
    } else if (symbols == 'Del') {
      setState(() {
        input = input.substring(0, input.length - 1);
      });
    } else if (symbols == 'Ans') {
      setState(() {
        input = output;
        output = '';
      });
    } else if (symbols == '/' ||
        symbols == '*' ||
        symbols == '+' ||
        symbols == '-' ||
        symbols == '%') {
      if (input.endsWith('/') ||
          input.endsWith('*') ||
          input.endsWith('+') ||
          input.endsWith('-') ||
          input.endsWith('%')) {
        Null;
      } else {
        setState(() {
          input += symbols;
        });
      }
    } else if (symbols == '=') {
      Expression exp = Parser().parse(input);
      double result = exp.evaluate(EvaluationType.REAL, ContextModel());
      setState(() {
        output = result.toString();
      });
      setState(() {});
    } else {
      setState(() {
        input += symbols;
      });
    }
  }

  Color textColor(String x) {
    if (x == '*' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == '/' ||
        x == 'C' ||
        x == 'Del' ||
        x == '%') {
      return AppColors.white;
    } else {
      return AppColors.black;
    }
  }

  List<String> symbols = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'Ans',
    '='
  ];
  String input = ' ';
  String output = ' ';
  bool mode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.back,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  mode ? Icons.dark_mode : Icons.light_mode,
                  color: AppColors.black,
                ),
                onPressed: () {
                  setState(() {
                    mode = !mode;
                    Utils.appMode = mode ? ThemeMode.light : ThemeMode.dark;
                  });
                },
              ),
              50.ph,
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: TextWidget(
                    input,
                    maxLines: 2,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              10.ph,
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: TextWidget(
                    output,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: AppColors.yellow,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: GridView.builder(
                  itemCount: symbols.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        logic(symbols[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: color(symbols[index]),
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: TextWidget(
                          symbols[index],
                          color: textColor(symbols[index]),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
