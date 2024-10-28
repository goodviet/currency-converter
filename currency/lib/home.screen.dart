import 'package:currency/service/service.app.dart';
import 'package:currency/widget/button.widget.dart';
import 'package:currency/widget/textfield.widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'widget/dropdown.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppService appService = AppService();

  String fromCurrency = "USD";
  String toCurrency = "VND";
  double rate = 0.0;
  double total = 0.0;
  TextEditingController amount = TextEditingController();
  List<String> currencies = [];
  final NumberFormat _formatter = NumberFormat('#,##0');
  final NumberFormat _formatterTotal = NumberFormat('#,##0.000');
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCurrencies();
  }

  Future<void> _loadCurrencies() async {
    try {
      currencies = await appService.getCurrencies();
      rate = await appService.getRate(fromCurrency, toCurrency);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void _swapCurrencies() {
    setState(() {
      String temp = fromCurrency;
      fromCurrency = toCurrency;
      toCurrency = temp;
      _loadCurrencies().then((_) {
        double amount =
            double.tryParse(_controller.text.replaceAll(',', '')) ?? 0.0;
        total = amount * rate;
      });
    });
  }

  void _onCurrencyChanged(String? newValue) {
    setState(() {
      fromCurrency = newValue!;
    });
  }

  void _updateToCurrency(String? newValue) {
    setState(() {
      toCurrency = newValue!;
      _loadCurrencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          "Currency Exchange",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black),
        ),
      ),
      body: GestureDetector(
        onTap: () {
           FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                TextFieldWidget(
                  hintText: "0.000",
                  textController: _controller,
                  onChange: (value) {
                    setState(() {
                      if (value.isNotEmpty) {
                        String cleanedValue = value.replaceAll(',', '');
                        double amount = double.tryParse(cleanedValue) ?? 0.0;
                        total = amount * rate;
          
                        String formattedValue = _formatter.format(amount);
                        _controller.value = TextEditingValue(
                          text: formattedValue,
                          selection: TextSelection.collapsed(
                              offset: formattedValue.length),
                        );
                      } else {
                 
                        total = 0.0;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownCurrencyWidget(
                      value: fromCurrency,
                      items: currencies,
                      onChanged: _onCurrencyChanged,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(60)),
                      child: Center(
                        child: IconButton(
                            onPressed: _swapCurrencies,
                            icon: FaIcon(
                              FontAwesomeIcons.retweet,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    ),
                    DropdownCurrencyWidget(
                        value: toCurrency,
                        items: currencies,
                        onChanged: _updateToCurrency),
                  ],
                ),
                SizedBox(height: 60),
                Text(
                  "Rate $rate",
                  style: TextStyle(fontSize: 24, color: Colors.red),
                ),
                SizedBox(height: 50),
                Text(
                  '${_formatterTotal.format(total)} $toCurrency',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ButtonCustomWidget(
                    onTap: () {
                      setState(() {
                        fromCurrency = "USD";
                        toCurrency = "VND";
                        rate = 0.0;
                        total = 0.0;
                        _controller.clear();
                        _loadCurrencies();
                      });
                    },
                    text: "Reset")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
