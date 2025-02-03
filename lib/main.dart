import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff000000),
          leading: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) => RadialGradient(
              center: Alignment.topCenter,
              stops: [.5, 1],
              colors: [
                Color(0xdb6e00ff),
                Color(0xffff00fb),
              ],
            ).createShader(bounds),
            child: Icon(
              Icons.account_box,
              size: 30,
            ),
          ),
          title: GradientText(
            'Festival of Colours',
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold), // Fixed fontWeight error
            gradient: LinearGradient(colors: [
              Color(0xffaf00ff),
              Color(0xff2b35f6),
            ]),
          ),
        ),
        body: const Input(),
      ),
    );
  }
}

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _Allinput();
}

class _Allinput extends State<Input> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneNumController.dispose();
    super.dispose();
  }

  void handleSubmit() {
    String name = nameController.text;
    String phoneNum = phoneNumController.text;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: GradientText(
            'Confirmation',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold), // Fixed fontWeight error
            gradient: LinearGradient(colors: [
              Color(0xffff00d1),
              Color(0xffff0008),
            ]),
          ),
          content: Text("ชื่อ-นามสกุล : $name\nเบอร์โทรศัพท์ : $phoneNum"),
          actions: <Widget>[
            TextButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) => RadialGradient(
                      center: Alignment.topCenter,
                      stops: [.5, 1],
                      colors: [
                        Color(0xffff0000),
                        Color(0xffff9600),
                      ],
                    ).createShader(bounds),
                    child: Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 1.0),
                  const Text(
                    'ยกเลิก',
                    style: TextStyle(color: Color(0xff000000), fontSize: 14),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) => RadialGradient(
                      center: Alignment.topCenter,
                      stops: [.5, 1],
                      colors: [
                        Color(0xfff3ff00),
                        Color(0xff51ff00),
                      ],
                    ).createShader(bounds),
                    child: Icon(
                      Icons.check_rounded,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 1.0),
                  const Text(
                    'ยืนยัน',
                    style: TextStyle(color: Color(0xff000000), fontSize: 14),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GradientText(
              'กรอกข้อมูล',
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold), // Fixed fontWeight error
              gradient: LinearGradient(colors: [
                Color(0xffcc00ff),
                Color(0xc1ff00d1),
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ชื่อ-นามสกุล',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneNumController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'เบอร์โทรศัพท์',
              ),
            ),
            const SizedBox(height: 16),
            RawMaterialButton(
              onPressed: handleSubmit,
              fillColor: const Color(0xff000000),
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) => RadialGradient(
                      center: Alignment.topCenter,
                      stops: [.5, 1],
                      colors: [
                        Color(0xdbf800ff),
                        Color(0xffaf00ff),
                      ],
                    ).createShader(bounds),
                    child: Icon(
                      Icons.add_circle_outline_outlined,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 7.0),
                  const Text(
                    'Check',
                    style: TextStyle(color: Color(0xffffffff), fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
