import 'package:flutter/material.dart';  

void main() {  
  runApp(  
    MaterialApp( // Tambahkan MaterialApp di sini
      home: Scaffold( // Tambahkan Scaffold untuk struktur dasar aplikasi
        body: ListView(
          padding: const EdgeInsets.all(8), 
          children: <Widget>[ 
            Container( 
              height: 50, 
              color: Colors.amber[600], 
              child: const Center(child: Text('Entry A')), 
            ), 
            Container( 
              height: 50, 
              color: Colors.amber[500], 
              child: const Center(child: Text('Entry B')), 
            ), 
            Container( 
              height: 50, 
              color: Colors.amber[100], 
                child: const Center(child: Text('Entry C')), 
            ), 
          ],
        )
      ),  
    ),  
  );  
}
