import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock_view.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    bool isActive = false;
    var now = DateTime.now();
    var formattedTime = DateFormat('hh:mm').format(now);

    var formattedDate = DateFormat('EEE, d MMM').format(now);

    return  Container(
      alignment: Alignment.center,
      color: const Color(0xff2D2F41),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          const Text(
            'Clock ',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Text(
            formattedTime,
            style: TextStyle(color: Colors.white, fontSize: 64),
          ),
          Text(
            formattedDate,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 15),
          Stack(
            children: [
              ClockView(),
              Positioned(
                bottom: 53,
                right: 129,
                child: Text(
                  'mo5',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          const Text(
            'Alarm',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            height: 310,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff8c2c90),
                          Color(0xff178af6),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff178af6),
                            blurRadius: 8,
                            spreadRadius: 2)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  height: 115,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: const [
                            Icon(Icons.label, color: Colors.white),
                            Text(
                              'Alarm',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ]),
                          Switch(
                            value: isActive,
                            onChanged: (bool value) {
                              setState(() {
                                isActive = value;
                                value = !isActive;
                                print('a');
                              });
                            },
                            activeColor: Colors.white,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formattedTime,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline_outlined,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
