import "package:flutter/material.dart";
import "dart:math";

// void main() => runApp(MaterialApp(
//     title: 'EMI Calc',
//     theme: ThemeData(
//       colorSchemeSeed: Colors.redAccent,
//     ),
//     home: EmiCalculator()));

class EmiCalculator extends StatefulWidget {
  const EmiCalculator({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<EmiCalculator> {
  List _tenureTypes = ['Month(s)', 'Year(s)'];
  String _tenureType = "Year(s)";
  String _emiResult = "";

  final TextEditingController _principalAmount = TextEditingController();
  final TextEditingController _interestRate = TextEditingController();
  final TextEditingController _tenure = TextEditingController();

  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("EMI Calculator"),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
              child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _principalAmount,
                    decoration: const InputDecoration(
                        labelText: "Enter Principal Amount"),
                    keyboardType: TextInputType.number,
                  )),
              Container(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _interestRate,
                    decoration:
                        const InputDecoration(labelText: "Interest Rate"),
                    keyboardType: TextInputType.number,
                  )),
              Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: TextField(
                            controller: _tenure,
                            decoration:
                                const InputDecoration(labelText: "Tenure"),
                            keyboardType: TextInputType.number,
                          )),
                      Flexible(
                          flex: 1,
                          child: Column(children: [
                            Text(_tenureType,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Switch(
                                activeColor: Colors.redAccent,
                                value: _switchValue,
                                onChanged: (bool value) {
                                  print(value);

                                  if (value) {
                                    _tenureType = _tenureTypes[1];
                                  } else {
                                    _tenureType = _tenureTypes[0];
                                  }

                                  setState(() {
                                    _switchValue = value;
                                  });
                                })
                          ]))
                    ],
                  )),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30, right: 20, bottom: 30, left: 8),
                  child: ElevatedButton(
                    onPressed: _handleCalculation,
                    child: const Text("Calculate"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent),
                  ),
                ),
              ),
              emiResultsWidget(_emiResult)
            ],
          )),
        ));
  }

  void _handleCalculation() {
    //  Amortization
    //  A = Payemtn amount per period
    //  P = Initial Printical (loan amount)
    //  r = interest rate
    //  n = total number of payments or periods

    double A = 0.0;
    int P = int.parse(_principalAmount.text);
    double r = int.parse(_interestRate.text) / 12 / 100;
    int n = _tenureType == "Year(s)"
        ? int.parse(_tenure.text) * 12
        : int.parse(_tenure.text);

    A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

    _emiResult = A.toStringAsFixed(2);

    setState(() {});
  }

  Widget emiResultsWidget(emiResult) {
    bool canShow = false;
    String _emiResult = emiResult;

    if (_emiResult.length > 0) {
      canShow = true;
    }
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: canShow
            ? Column(children: [
                const Text("Your Total EMI is",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Container(
                    child: Text(_emiResult,
                        style: const TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold)))
              ])
            : Container());
  }
}
