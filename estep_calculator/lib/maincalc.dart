import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MainCalc extends StatefulWidget {
  const MainCalc({super.key});

  @override
  State<MainCalc> createState() => _MainCalcState();
}

class _MainCalcState extends State<MainCalc> {
  TextEditingController estepEditingController = TextEditingController();
  TextEditingController extrudedEditingController = TextEditingController();
  double estep = 0.0;
  int extr = 0;
  double result = 0.0;
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E-Step Calc")),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/ender.png',
                scale: 3,
              ),
              const Text(
                "E-STEP CALC",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: estepEditingController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                    hintText: "Enter Current E-Step",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: extrudedEditingController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                    hintText: "Extruded Filament Length (CM)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: calESTEP,
                  child: const Text("Calculate New ESTEP")),
              Text("NEW ESTEP VALUE: ${result.toStringAsFixed(2)}"),
            ],
          ),
        )),
      ),
    );
  }

  void calESTEP() {
    estep = double.parse(estepEditingController.text);
    extr = int.parse(extrudedEditingController.text);
    result = (estep / (110 - extr)) * 100;
    setState(() {});
    player.play(AssetSource("sounds/bell.wav"));
  }
}
