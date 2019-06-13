//Name: Sharib Khan
//Email: SkSharibKhan@gmail.com
//Contact: +91-9720763887;
//Location: Delhi - India

import 'dart:async';
import 'dart:convert';
import 'dart:io';


void main() {
 
  loadData(); //Function for getting the data from file (data.txt);
}





Future loadData() async {
  String jsonData = await readAsset(); // File is read as String
  parseJsonForData(jsonData); //Resultant String sent for parsing
}

Future<String> readAsset() async {
  return await new File("data.txt").readAsString();  //Reads the file as a String.
}

void parseJsonForData(String jsonString) {
  try{
    Map decoded = JSON.decode(jsonString); //Decodes the String as JSON.
  var x1, x2, y1, y2;
  x1 = decoded["plane"]["topLeft"]["x"];  //Get the value of specific.
  y1 = decoded["plane"]["topLeft"]["y"];
  x2 = decoded["plane"]["bottomRight"]["x"];
  y2 = decoded["plane"]["bottomRight"]["y"];
  for (var cords in decoded['hitPoints']) {   // loop for getting all the hit points.
    hitpointCheck(x1, x2, y1, y2, cords['x'], cords['y']);
  }
  }catch(e){
    
  }
  
}

void hitpointCheck(var x1,x2,y1,y2,h1,h2){   //function to check if the hit point lies on the plane.
  if(h1 < x1 || h1 > x2 || h2 < y1 || h2 > y2  ){
    print(false);
  }else{
    print(true);
  }
}
