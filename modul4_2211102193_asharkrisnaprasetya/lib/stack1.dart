import 'package:flutter/material.dart';  

void main() {  
  runApp(  
    MaterialApp( // Tambahkan MaterialApp di sini
      home: Scaffold( // Tambahkan Scaffold untuk struktur dasar aplikasi
        body: Stack(  
            children: <Widget>[ 
    Container( 
      width: 100, 
      height: 100, 
      color: Colors.red, 
    ), 
    Container( 
      width: 90, 
      height: 90, 
      color: Colors.green, 
    ), 
    Container( 
      width: 80, 
      height: 80, 
      color: Colors.blue, 
    ), 
  ],
        ),  
      ),  
    ),  
  );  
}
