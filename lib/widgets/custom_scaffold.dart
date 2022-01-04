import 'package:flutter/material.dart';

import '../common/text_styles.dart';

class CustomScaffold extends StatelessWidget {
  final String textAppbar;
  final List<Widget> children;
  const CustomScaffold({
    Key? key,
    required this.textAppbar,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF70C7BA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 15.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 33,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  textAppbar,
                  style: whiteText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
