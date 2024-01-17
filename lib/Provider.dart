
import 'package:flutter/cupertino.dart';

class Myprovider extends ChangeNotifier
{
  var first, second;
  String res ="", text = "";
  String opp = "", input = "";

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'AC',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  void btnClicked(String btnText)
  {
    if (btnText == "C")
    {
      res = "";
      text = "";
      opp = "";
      first = 0;
      second = 0;
      input = "";

    }
    else if(btnText == "AC")
    {
      input =  input.substring(0, input.length-1);
      // text = res;
      //input = first.toString()+opp+second.toString();
      // equalpressed();

    }
    else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/")
    {
      first = int.parse(text);
      res = "";
      opp = btnText;
      input += btnText;

    }
    else if (btnText == "=")
    {
      equalpressed();

    }
    else
    {
      input += btnText;
      res = int.parse(text + btnText).toString();

    }
    text = res;
    //input = first.toString()+opp+second.toString();
    notifyListeners();

  }
  void equalpressed()
  {
    //res = "";
    second = int.parse(text);
    if (opp == "+")
    {
      res = (first + second).toString();

    }
    if (opp == "-")
    {
      res = (first - second).toString();

    }
    if (opp == "x")
    {
      res = (first * second).toString();

    }
    if (opp == "/")
    {
      res = (first ~/ second).toString();

    }
  }
}