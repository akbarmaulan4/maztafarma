import 'package:flutter/material.dart';

class InvitationInfoWidget extends StatelessWidget {
  const InvitationInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15,left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Kunjungan Anda', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Row(
            children: [
              Expanded(child: Card(
                color: Colors.amber,
                child: Container(
                  height: 85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('120', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),),
                      Text('Kunjungan', style: TextStyle(fontSize: 15, color: Colors.white))
                    ],
                  ),
                ),
              )),
              Expanded(child: Card(
                color: Colors.lightBlue,
                child: Container(
                  height: 85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('120', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),),
                      Text('Kunjungan', style: TextStyle(fontSize: 15, color: Colors.white))
                    ],
                  ),
                ),
              )),
            ],
          ),
          Card(
            color: Colors.pinkAccent,
            child: Container(
              height: 85,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('120', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),),
                  Text('Kunjungan', style: TextStyle(fontSize: 15, color: Colors.white))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
