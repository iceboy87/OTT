import 'dart:io'; // Added import for File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class qwerty extends StatefulWidget {
  const qwerty({Key? key}) : super(key: key); // Fixed constructor call

  @override
  State<qwerty> createState() => _qwertyState();
}

class _qwertyState extends State<qwerty> {
  List<String> Name = ['Bhuvanesh'];



//theme start
  bool icon = false;
  Future<void> change() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      icon = (preferences.getBool('dark') ?? false);
    });
  }

  void mode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      icon = !(preferences.getBool('dark') ?? false);
      preferences.setBool('dark', icon);
    });
  }
//theme end



  String? imgPath;
  File? imgFile;

  void getImg() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if( pickedImage != null )
    {
      saveData(pickedImage.path.toString());   // path cache
      setState(()
      {
        imgFile = File(pickedImage.path);
      });
    }
  }

  Future<void> saveData(String val)  async {
   SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString('path', val);
    getData();
  }

  void getData() async {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    setState(()
    {
      imgPath = preferences.getString('path');
    });
  }
  @override
  void initState() {
    super.initState();
    change();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: icon ? ThemeData.light() : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.headphones_outlined),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                'Help & Support',
                style: TextStyle(),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Center(
                  child: Stack(
                    children: [
                      imgPath != null
                          ? CircleAvatar(
                        radius: 55,
                        backgroundImage: FileImage(File(imgPath!)),
                      )
                          : CircleAvatar(
                        backgroundImage: AssetImage('img/pic.png'),
                        radius: 55,
                      ),
                      Positioned(
                        child: IconButton(
                          onPressed: () {
                            getImg(); // Fixed function invocation
                          },
                          icon: Icon(
                            Icons.add_a_photo_rounded,
                          ),
                        ),
                        bottom: -10,
                        left: 75,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0, top: 10),
                    child: Text(
                      '${Name[0]}',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _editName(context, 0);
                      },
                      icon: Icon(Icons.edit))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 165.0),
              //   child: ElevatedButton(onPressed: () {
              //     getData();
              //   }, child: Text('Save')),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          '    Subscribe    ',
                          style: TextStyle(color: Colors.blueAccent),
                        )),
                    OutlinedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Contact'),
                                content: Container(
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Text('Email: bhuvanesh2k03@gmail.com'),
                                        Text('Phone No.: +91 8428401295'),
                                      ],
                                    )),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          '      Contact      ',
                          style: TextStyle(fontSize: 14),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 30),
                child: Text(
                  'Activities',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(
                      'Data Usage',
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Per week Basis',
                      style: TextStyle(color: Colors.black38),
                    ),
                    trailing: Text(
                      '4.6GB',
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.people,
                      color: Colors.blueAccent,
                      size: 25,
                    ),
                  ),
                  Text(
                    'Account Settings',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.blueAccent,
                      size: 25,
                    ),
                  ),
                  Text(
                    'General Settings',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.payment_outlined,
                      color: Colors.blueAccent,
                      size: 25,
                    ),
                  ),
                  Text(
                    'Payments',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.wb_sunny,
                      color: Colors.blueAccent,
                      size: 25,
                    ),
                  ),
                  Text(
                    'Light mode',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Transform.scale(
                      scaleX: 1,
                      scaleY: 0.9,
                      child: Switch(
                        value: icon,
                        activeColor: Colors.blueAccent,
                        onChanged: (value) {
                          mode();
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.login,
                      color: Colors.blueAccent,
                      size: 25,
                    ),
                  ),
                  Text(
                    'logout',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editName(BuildContext context, int index) {
    // Display dialog for editing the name
    showDialog(
      context: context,
      builder: (context) {
        String newName = Name[index]; // Initialize with current name
        return AlertDialog(
          title: Text('Edit Name'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter new name'),
            onChanged: (value) {
              newName = value; // Update newName as user types
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  Name[index] = newName; // Update name in the list
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
