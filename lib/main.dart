import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LaunchPad",
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Launched Pad',
              style: GoogleFonts.orbitron(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "1.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "2.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "3..mp3"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "4.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "5.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "6.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "7.mp3"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "8.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "9.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "10.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "11.mp3"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "12.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "13.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "14.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "15.mp3"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "16.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "17.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "18.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "19.mp3"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "20.wav"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "21.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "22.wav"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "23.wav"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "24.wav"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "25.wav"),
                Pad(Color(0xffff2525), Color(0xffc40050), "26.wav"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "27.wav"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "28.wav"),
              ],
            ),
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}

class Pad extends StatefulWidget {
  final colorCenter;
  final colorOutline;
  final note;
  const Pad(this.colorCenter, this.colorOutline, this.note, {super.key});

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  late Color _colorCenter;
  late Color _colorOutline;

  final player = AudioPlayer();
  @override
  void initState() {
    _colorCenter = widget.colorCenter;
    _colorOutline = widget.colorOutline;
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _colorCenter = Colors.white;
          _colorOutline = Colors.white;

          player.play(AssetSource(widget.note));
        });
        await Future.delayed(
          Duration(milliseconds: 500),
        );

        setState(() {
          _colorCenter = widget.colorCenter;
          _colorOutline = widget.colorOutline;
        });
      },
      child: Container(
        width: width / 4.3,
        height: height / 8.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            gradient: RadialGradient(
              colors: [_colorCenter, _colorOutline],
              radius: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.pink,
                blurRadius: 5.0,
              )
            ]),
      ),
    );
  }
}
