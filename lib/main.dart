import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() => runApp (MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan) ,
),
    home: const MyApp() ,
));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState  extends State<MyApp> {
late String studentName, nim, jurusan, fakultas;

getStudentName(name) {
  studentName = name;
}

getnim(nim) {
  this.nim = nim;
}

getjurusan(jurusan) {
  this.jurusan = jurusan;
}

getfakultas(fakultas) {
  this.fakultas = fakultas;
}

createData() {
  print("created");
  
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("MyStudent").doc(studentName);

  Map<String, dynamic> students = {
    "studentName": studentName,
    "nim": nim,
    "jurusan": jurusan,
    "fakultas": fakultas
  };

  documentReference.set(students).whenComplete(() {
    print("$studentName Created");
  });
}


readData() {
  print("readted");
}

updateData() {
  print("updated");
}

deleteData() {
  print("deleted");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter College"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )
                ),
                onChanged: (String name){
                  getStudentName(name);
  
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "NIM",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )
                ),
                onChanged: (String nim){
                  getnim(nim);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Jurusan",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )
                ),
                onChanged: (String jurusan){
                getjurusan(jurusan);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Fakultas",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )
                ),
                onChanged: (String fakultas){
                  getfakultas(fakultas);
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Expanded(
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
                ),
                ),
              onPressed: () {
                createData ();
                },
              child: const Text(
                    "Create",
                style: TextStyle(color: Colors.white),
                  ),
                  ),
                  ),
                Expanded(
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                    ),
                    ),
                onPressed: () {
                readData ();
                },
                child: const Text(
                        "Read",
                    style: TextStyle(color: Colors.white),
                    ),
                      ),
                      ),
                  Expanded(
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                    ),
                      ),
                  onPressed: () {
                  updateData ();
                  },
                  child: const Text(
                          "Update",
                  style: TextStyle(color: Colors.white),
                    ),
                    ),
                      ),
                  Expanded(
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  ),
                  ),
                  onPressed: () {
                    deleteData();
                  },
                    child: const Text(
                      "Delete",
                    style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
