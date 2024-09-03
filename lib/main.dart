import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override 
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String operations = "";
  var operationsList = List<String>.empty(growable: true);
  double? currentValue;
  int okleft = 0;
  int okright = 0;
  int nrl = 0;
  int nrr = 0;
  int hasPoint = 0;
  int decimals = 0;

  Widget GetBody(BuildContext context, AppBar appbar) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = appbar.preferredSize.height;
    double finalHeight = (screenHeight - appBarHeight) / 3;

    return Column(children: [
        Container(
          color: Color.fromARGB(255, 12, 194, 226),
          height: finalHeight,
          child: Stack( children: [
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Calculus: ${operations}",
                    style: TextStyle(fontSize: 30)
                  ),
                )
              ),
          ])
        ),
        Container(
          color: Colors.blue,
          height: finalHeight,
          child: Stack( children: [
              Positioned(
                top: 0.1 * finalHeight,
                bottom: 0.1 * finalHeight,
                left: 0.2 * screenWidth,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("pow"), child: Text("POW"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("sqrt"), child: Text("SQRT"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("log"), child: Text("LOG"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("exp"), child: Text("EXP")))
                  ])
              ),
              Positioned(
                top: 0.1 * finalHeight,
                bottom: 0.1 * finalHeight,
                left: 0.4 * screenWidth,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("sin"), child: Text("SIN"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("cos"), child: Text("COS"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("tan"), child: Text("TAN")))
                  ])
              ),
              Positioned(
                top: 0.1 * finalHeight,
                bottom: 0.1 * finalHeight,
                left: 0.6 * screenWidth,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("asin"), child: Text("ASIN"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("acos"), child: Text("ACOS"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("atan"), child: Text("ATAN")))
                  ])
              ),
              Positioned(
                top: 0.1 * finalHeight,
                bottom: 0.1 * finalHeight,
                left: 0.8 * screenWidth,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("("), child: Text("("))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations(")"), child: Text(")")))
                  ])
              )
          ])
        ),
        Container(
          color: Colors.blueGrey,
          height: finalHeight,
          child: Stack( children: [
              Positioned(
                bottom: 5,
                left: 0.1 * screenWidth,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("7"), child: Text("7"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("4"), child: Text("4"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("1"), child: Text("1"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("0"), child: Text("0")))
                  ])
              ),
              Positioned(
                bottom: 5,
                left: 0.3 * screenWidth,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("8"), child: Text("8"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("5"), child: Text("5"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("2"), child: Text("2"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("."), child: Text(".")))
                  ])
              ),
              Positioned(
                bottom: 5,
                left: 0.5 * screenWidth,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("9"), child: Text("9"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("6"), child: Text("6"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("3"), child: Text("3"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("eps"), child: Text("EPS")))
                  ])
              ),
              Positioned(
                bottom: 5,
                left: 0.7 * screenWidth,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("*"), child: Text("*"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("+"), child: Text("+"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("pi"), child: Text("PI")))
                  ])
              ),
              Positioned(
                bottom: 5,
                left: 0.9 * screenWidth,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("ac"), child: Text("AC"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("/"), child: Text("/"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("-"), child: Text("-"))),
                    Padding(padding: EdgeInsets.fromLTRB(2, 2, 2, 2), child:ElevatedButton(onPressed: () => createOperations("="), child: Text("=")))
                  ])
              )
          ])
        )
    ]);
  }

  @override  
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(title: Text("Hello world"));

    return MaterialApp(
      home: Scaffold(
            appBar: appbar,
            body: GetBody(context, appbar)
      )
    );
  }

  void additionAndSubtraction(List<String> op) {
    while(op.contains("+") || op.contains("-")) {
            int index1 = op.indexWhere((i) => i == "+");
            int index2 = op.indexWhere((i) => i == "-");
            if(index1 == -1) index1 = op.length;
            if(index2 == -1) index2 = op.length;
            int index;
            if(index1 < index2) index = index1;
            else index = index2;
            var var1 = double.parse(op[index - 1]);
            var var2 = double.parse(op[index + 1]);
            if(index == index1) op[index] = (var1 + var2).toString();
            else op[index] = (var1 - var2).toString();
            op.removeAt(index - 1);
            index = index - 1;
            op.removeAt(index + 1);
            // print(op);
          }
  }

  void multiplicationAndDivision(List<String> op) {
    while(op.contains("*") || op.contains("/")) {
            int index1 = op.indexWhere((i) => i == "*");
            int index2 = op.indexWhere((i) => i == "/");
            if(index1 == -1) index1 = op.length;
            if(index2 == -1) index2 = op.length;
            int index;
            if(index1 < index2) index = index1;
            else index = index2;
            var var1 = double.parse(op[index - 1]);
            var var2 = double.parse(op[index + 1]);
            if(index == index1) op[index] = (var1 * var2).toString();
            else op[index] = (var1 / var2).toString();
            op.removeAt(index - 1);
            index = index - 1;
            op.removeAt(index + 1);
            // print(op);
          }
  }

  void calculatePharantesis() {
    while(operationsList.contains("(") || operationsList.contains(")")) {
      int index1 = operationsList.lastIndexWhere((i) => i == "(");
      int index2 = operationsList.indexWhere((i) => i == ")");
      var sublist = operationsList.sublist(index1 + 1, index2);
      multiplicationAndDivision(sublist);
      additionAndSubtraction(sublist);
      // print(sublist);
      while(index1 <= index2) {
        operationsList.removeAt(index2);
        index2--;
      }
      operationsList.insert(index1, sublist[0]);
      // print(operationsList);
    }
  }

  void scientificFunctions(String operand, String number) {
    double nr = double.parse(number);

    switch(operand) {
      case "sin": {
        currentValue = sin(nr);
      }
      break;

      case "cos": {
        currentValue = cos(nr);
      }
      break;
      
      case "tan": {
        currentValue = tan(nr);
      }
      break;
       
      case "asin": {
        currentValue = asin(nr);
      }
      break;
      
      case "acos": {
        currentValue = acos(nr);
      }
      break;
 
      case "atan": {
        currentValue = atan(nr);
      }
      break;

      case "pow": {
        currentValue = nr * nr;
      }
      break;
      
      case "sqrt": {
        currentValue = sqrt(nr);
      }
      break;

      case "log": {
        currentValue = log(nr);
      }
      break;

      case "exp": {
        currentValue = exp(nr);
      }
      break;
    }
  }

  void functionForCharacters(String operand) {
    switch(operand) {
      case '1': {  
        if(currentValue != null && currentValue != e && currentValue != pi && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {
          if(hasPoint == 0) currentValue = currentValue! * 10 + 1; 
          else {
            decimals++;
            currentValue = currentValue! + 1 / pow(10, decimals);
          }
          okright = 1;
        }
        else if(currentValue == e || currentValue == pi || (operationsList.length >= 1 && operationsList[operationsList.length - 1] == ')')) operand = "";
        else {currentValue = 1; okright = 1;}
        operations = operations + operand;
      }
      break;

      case '2': {  
        if(currentValue != null && currentValue != e && currentValue != pi && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {
          if(hasPoint == 0) currentValue = currentValue! * 10 + 2; 
          else {
            decimals++;
            currentValue = currentValue! + 2 / pow(10, decimals);
          }
          okright = 1;
        }
        else if(currentValue == e || currentValue == pi || (operationsList.length >= 1 && operationsList[operationsList.length - 1] == ')')) operand = "";
        else {currentValue = 2; okright = 1;}
        operations = operations + operand;
      }
      break;

      case '3': {  
        if(currentValue != null && currentValue != e && currentValue != pi && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {
          if(hasPoint == 0) currentValue = currentValue! * 10 + 3; 
          else {
            decimals++;
            currentValue = currentValue! + 3 / pow(10, decimals);
          }
          okright = 1;
        }
        else if(currentValue == e || currentValue == pi || (operationsList.length >= 1 && operationsList[operationsList.length - 1] == ')')) operand = "";
        else {currentValue = 3; okright = 1;}
        operations = operations + operand;
      }
      break;

      case '4': {  
        if(currentValue != null && currentValue != e && currentValue != pi && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {
          if(hasPoint == 0) currentValue = currentValue! * 10 + 4; 
          else {
            decimals++;
            currentValue = currentValue! + 4 / pow(10, decimals);
          }
          okright = 1;
        }
        else if(currentValue == e || currentValue == pi || (operationsList.length >= 1 && operationsList[operationsList.length - 1] == ')')) operand = "";
        else {currentValue = 4; okright = 1;}
        operations = operations + operand;
      }
      break;

      case '5': {  
        if(currentValue != null && currentValue != e && currentValue != pi && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {
          if(hasPoint == 0) currentValue = currentValue! * 10 + 5; 
          else {
            decimals++;
            currentValue = currentValue! + 5 / pow(10, decimals);
          }
          okright = 1;
        }
        else if(currentValue == e || currentValue == pi || (operationsList.length >= 1 && operationsList[operationsList.length - 1] == ')')) operand = "";
        else {currentValue = 5; okright = 1;}
        operations = operations + operand;
      }
      break;

      case '6': {  
        if(currentValue != null && currentValue != e && currentValue != pi && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {
          if(hasPoint == 0) currentValue = currentValue! * 10 + 6; 
          else {
            decimals++;
            currentValue = currentValue! + 6 / pow(10, decimals);
          }
          okright = 1;
        }
        else if(currentValue == e || currentValue == pi || (operationsList.length >= 1 && operationsList[operationsList.length - 1] == ')')) operand = "";
        else {currentValue = 6; okright = 1;}
        operations = operations + operand;
      }
      break;

      case '7': {  
        if(currentValue != null && currentValue != e && currentValue != pi && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {
          if(hasPoint == 0) currentValue = currentValue! * 10 + 7; 
          else {
            decimals++;
            currentValue = currentValue! + 7 / pow(10, decimals);
          }
          okright = 1;
        }
        else if(currentValue == e || currentValue == pi || (operationsList.length >= 1 && operationsList[operationsList.length - 1] == ')')) operand = "";
        else {currentValue = 7; okright = 1;}
        operations = operations + operand;
      }
      break;

      case '8': {  
        if(currentValue != null && currentValue != e && currentValue != pi && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {
          if(hasPoint == 0) currentValue = currentValue! * 10 + 8; 
          else {
            decimals++;
            currentValue = currentValue! + 8 / pow(10, decimals);
          }
          okright = 1;
        }
        else if(currentValue == e || currentValue == pi || (operationsList.length >= 1 && operationsList[operationsList.length - 1] == ')')) operand = "";
        else {currentValue = 8; okright = 1;}
        operations = operations + operand;
      }
      break;

      case '9': {  
        if(currentValue != null && currentValue != e && currentValue != pi && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {
          if(hasPoint == 0) currentValue = currentValue! * 10 + 9; 
          else {
            decimals++;
            currentValue = currentValue! + 9 / pow(10, decimals);
          }
          okright = 1;
        }
        else if(currentValue == e || currentValue == pi || (operationsList.length >= 1 && operationsList[operationsList.length - 1] == ')')) operand = "";
        else {currentValue = 9; okright = 1;}
        operations = operations + operand;
      }
      break;

      case '0': {  
        if(currentValue != null && currentValue != e && currentValue != pi && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {
          if(hasPoint == 0) currentValue = currentValue! * 10 + 0; 
          else decimals++;
          okright = 1;
        }
        else operand = ""; 
        operations = operations + operand;
      }
      break;
      
      case "eps": {  
        if(currentValue == null && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {currentValue = e; okright = 1;}
        else operand = ""; 
        operations = operations + operand;
      }
      break;
    
      case "pi": {  
        if(currentValue == null && ((operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || operationsList.isEmpty)) {currentValue = pi; okright = 1;}
        else operand = ""; 
        operations = operations + operand;
      }
      break;

      case ".": {
        if(currentValue != null && currentValue!.toInt() == currentValue) {
          operations = operations + operand;
          hasPoint = 1;
        }
      }
      
      case "ac": {
        operations = "";
        operationsList.clear();
        currentValue = null;
        print(operationsList);
        okleft = okright = nrl = nrr = hasPoint = decimals = 0;
      }

      default: {
        if(['+', '-', '*', '/'].contains(operand)) {
          if((currentValue == null && operationsList.length >= 1 && operationsList[operationsList.length - 1] != ')') || (operationsList.length >= 1 && operationsList.last == '(' && currentValue == null) || (operations.length > 0 && operations[operand.length - 1] == '.')) operand = "";
          else {
            okleft = 1;
            okright = 0;
            if(currentValue != null) operationsList.add(currentValue.toString());
            operationsList.add(operand);
            currentValue = null;
            hasPoint = decimals = 0;
            operations = operations + operand;
            // print(operationsList);
          }
        }
        else if(operand == '(') {
          if(currentValue != null || okleft == 0 || (operations.length > 0 && operations[operand.length - 1] == '.')) operand = "";
          else {
            operationsList.add(operand);
            operations = operations + operand;
            // print(operationsList);
            okleft = 0;
            nrl += 1;
          }
        }
        else if(operand == ')') {
          if((currentValue == null && operationsList.length >= 1 && operationsList.last != ')') || (operationsList.length >= 1 && operationsList.last == '(') || (operations.length > 0 && operations[operand.length - 1] == '.') || okright == 0 || nrl <= nrr) operand = "";
          else {
            if(operationsList.last != ')') operationsList.add(currentValue.toString());
            operationsList.add(operand);
            operations = operations + operand;
            // print(operationsList);
            currentValue = null;
            hasPoint = decimals = 0;
            nrr += 1;
            okleft = 0;
          }
        }
        else if(operand == '=') {
          if((currentValue == null && operationsList.length >= 1 && operationsList.last != ')') || (operations.length > 0 && operations[operand.length - 1] == '.') || nrl != nrr || operationsList.isEmpty == true) operand = "";
          else {
            if(currentValue != null) operationsList.add(currentValue.toString());
            // print(operationsList);
            calculatePharantesis();
            multiplicationAndDivision(operationsList);
            additionAndSubtraction(operationsList);
            // operationsList.removeAt(1);
            if((double.parse(operationsList[0])).toInt() == double.parse(operationsList[0])) operations = (double.parse(operationsList[0])).toInt().toString();
            else operations = operationsList[0].toString();
            currentValue = double.parse(operationsList[0]);
            operationsList.clear();
            // print(currentValue);
            // print(operationsList);
            okright = 1;
          }
        }
        else {
          if(currentValue != null) {
            operationsList.add(currentValue.toString());
            calculatePharantesis();
            multiplicationAndDivision(operationsList);
            additionAndSubtraction(operationsList);
            // print("Remained:");
            // print(operationsList);
            scientificFunctions(operand, operationsList[0]);
            operationsList.clear();
            operations = currentValue.toString();
            // print("Modified:");
            // print(operationsList);
            okright = 1;
          }
          else operand = "";
        }
      }
      break;
    }
  }

  void createOperations(String operand) {

    setState(() {
        functionForCharacters(operand);
    });
  }
}