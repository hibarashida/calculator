// import 'package:calculator/Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<Myprovider>(builder: (context, value, child) {
                return Expanded(
                  child: Container(
                      color: Colors.grey.shade50,
                      alignment: Alignment.bottomRight,
                      // height: 215,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(value.input,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.grey[600])),
                            SizedBox(height: 10,),
                            Text(value.text,
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold)),
                          ])),
                );
              }),
              //OutlinedButton(onPressed: (){}, child: Text("Button")),
              Consumer<Myprovider>(
                  builder: (context, value, child) {
                    return Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.black,
                        //height: 453,
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: value.buttons.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                            itemBuilder: ( context, index)
                            {
                              return OutlinedButton(
                                style: OutlinedButton.styleFrom(backgroundColor: Colors.black,
                                    //primary: Colors.black,
                                  //textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                //style: ButtonStyle(shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                //padding: EdgeInsets.all(25.0),
                                onPressed: () => value.btnClicked(value.buttons[index]),
                                child: Text(
                                  value.buttons[index],
                                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                                ),
                              );
                            }
                        ),
                      ),
                    );
                  }
              )
            ],
          )),
    );
  }
}