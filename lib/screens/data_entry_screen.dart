import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/base_card.dart';
import '../widgets/ic_button.dart';
import '../constants.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({Key? key}) : super(key: key);

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  int itemOneQuantity = 1;
  int itemTwoQuantity = 1;

  int itemOneSize = 0;
  int itemTwoSize = 0;

  int itemOnePrice = 0;
  int itemTwoPrice = 0;

  double itemOneUnitPerBaht = 0;
  double itemTwoUnitPerBaht = 0;
  double resultPercent = 0;

  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kNavBarColor,
        title: const Center(child: Text('WHICH IS CHEAPER?')),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      BaseCard(
                        theColor: kItemOneBaseCardColor,
                        theChild: const Text(
                          "Item 1",
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ),
                      BaseCard(
                        theColor: kItemOneBaseCardColor,
                        theChild: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            setState(() {
                              result = '';
                              itemOneSize = int.parse(text);
                            });
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Item 1 volume',
                          ),
                        ),
                      ),
                      BaseCard(
                        theColor: kItemOneBaseCardColor,
                        theChild: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Text(
                                  'Quantity: ',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  itemOneQuantity.toString(),
                                  style: const TextStyle(fontSize: 30.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                IcButton(
                                    theColor: kButtonColor,
                                    theIconData: Icons.remove,
                                    theOnPressedFunc: () {
                                      setState(() {
                                        result = '';
                                        itemOneQuantity--;
                                        if (itemOneQuantity < 1) {
                                          itemOneQuantity = 1;
                                        }
                                      });
                                    }),
                                IcButton(
                                    theColor: kButtonColor,
                                    theIconData: Icons.add,
                                    theOnPressedFunc: () {
                                      setState(() {
                                        result = '';
                                        itemOneQuantity++;
                                      });
                                    })
                              ],
                            ),
                          ],
                        ),
                      ),
                      BaseCard(
                        theColor: kItemOneBaseCardColor,
                        theChild: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            setState(() {
                              result = '';
                              itemOnePrice = int.parse(text);
                            });
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Item 1 total price',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      BaseCard(
                        theColor: kItemOneBaseCardColor,
                        theChild: const Text(
                          "Item 2",
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ),
                      BaseCard(
                        theColor: kItemOneBaseCardColor,
                        theChild: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            setState(() {
                              result = '';
                              itemTwoSize = int.parse(text);
                            });
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Item 2 volume',
                          ),
                        ),
                      ),
                      BaseCard(
                        theColor: kItemOneBaseCardColor,
                        theChild: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Text(
                                  'Quantity: ',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  itemTwoQuantity.toString(),
                                  style: const TextStyle(fontSize: 30.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                IcButton(
                                    theColor: kButtonColor,
                                    theIconData: Icons.remove,
                                    theOnPressedFunc: () {
                                      setState(() {
                                        itemTwoQuantity--;
                                        result = '';
                                        if (itemTwoQuantity < 1) {
                                          itemTwoQuantity = 1;
                                        }
                                      });
                                    }),
                                IcButton(
                                    theColor: kButtonColor,
                                    theIconData: Icons.add,
                                    theOnPressedFunc: () {
                                      setState(() {
                                        itemTwoQuantity++;
                                        result = '';
                                      });
                                    })
                              ],
                            ),
                          ],
                        ),
                      ),
                      BaseCard(
                        theColor: kItemOneBaseCardColor,
                        theChild: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            setState(() {
                              result = '';
                              itemTwoPrice = int.parse(text);
                            });
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Item 2 total price',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BaseCard(
                    theColor: kCheckButton,
                    theChild: const Text(
                      "COMPARE!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    theOnTapFunc: () {
                      itemOneUnitPerBaht =
                          (itemOneSize * itemOneQuantity) / itemOnePrice;
                      itemTwoUnitPerBaht =
                          (itemTwoSize * itemTwoQuantity) / itemTwoPrice;

                      if (itemOneUnitPerBaht > itemTwoUnitPerBaht) {
                        setState(() {
                          resultPercent =
                              ((itemOneUnitPerBaht - itemTwoUnitPerBaht) /
                                      itemOneUnitPerBaht) *
                                  100;
                          result = 'item 1 is ' +
                              resultPercent.toStringAsFixed(2).toString() +
                              '% cheaper';
                        });
                      } else if (itemOneUnitPerBaht == itemTwoUnitPerBaht) {
                        setState(() {
                          result = 'The prices are equal';
                        });
                      } else {
                        setState(() {
                          resultPercent =
                              ((itemTwoUnitPerBaht - itemOneUnitPerBaht) /
                                      itemTwoUnitPerBaht) *
                                  100;
                          result = 'item 2 is ' +
                              resultPercent.toStringAsFixed(2).toString() +
                              '% cheaper';
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: BaseCard(
                          theColor: kResultBox,
                          theChild: Text(
                            result.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          )
        ],
      ),
    );
  }
}
