import 'package:flutter/material.dart';

class ListPengumuman extends StatefulWidget {
  const ListPengumuman({Key? key}) : super(key: key);

  @override
  _ListPengumumanState createState() => _ListPengumumanState();
}

class _ListPengumumanState extends State<ListPengumuman> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Container(
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.red]).createShader(bounds),
          child: Container(),
        ),
      ),
    );
  }
}
