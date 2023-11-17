import 'package:flutter/material.dart';

class CoinSingleScreen extends StatefulWidget {
  const CoinSingleScreen({super.key});

  @override
  State<CoinSingleScreen> createState() => _CoinSingleScreenState();
}

class _CoinSingleScreenState extends State<CoinSingleScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...')),
    );
  }
}