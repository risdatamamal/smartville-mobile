import 'package:flutter/material.dart';

class ListPengumuman extends StatefulWidget {
  const ListPengumuman({Key? key, required this.pengumumanList})
      : super(key: key);

  final List<String> pengumumanList;
  @override
  _ListPengumumanState createState() => _ListPengumumanState();
}

class _ListPengumumanState extends State<ListPengumuman> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) => ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xFF396AEA), Colors.transparent],
          stops: [
            0.0,
            0.7,
          ],
          tileMode: TileMode.clamp,
        ).createShader(bounds),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            child: Stack(children: [
              Image.network(
                'https://thispersondoesnotexist.com/image',
                fit: BoxFit.cover,
              ),
              Text('awdasd')
            ]),
          ),
        ),
      ),
      itemCount: widget.pengumumanList.length,
    );
  }
}
