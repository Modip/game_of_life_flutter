import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_of_life/sceens/blank_pixel.dart';
import 'package:game_of_life/sceens/cells_pixel.dart';
import 'package:game_of_life/themes/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int rowSize = 11;

  int totalSquare = 121;

  List<int> cells = [0, 1, 2];

  void startGame() {
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        // add a new
        cells.add(cells.last + 1);

        // remove cell
        cells.removeAt(0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text(
          "Game of life",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: rowSize,
                ),
                itemCount: totalSquare,
                itemBuilder: (context, index) {
                  if (cells.contains(index)) {
                    return const CellPixel();
                  } else {
                    return const BlankPixel();
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: MainColor.buttomColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: MaterialButton(
                            child: const Text(
                              "Start",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: startGame,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                            color: MainColor.buttomColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: const [
                            Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
