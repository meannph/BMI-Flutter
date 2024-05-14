import 'package:flutter/material.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  

  @override

  Widget build(BuildContext context) {
   return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 160, 241),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 143, 208, 251),
                  Color.fromARGB(255, 255, 181, 238)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7]),
          ),
      
        child:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('assets/images/meen.jpg'),
              ),
              const Text(
                'Phanit Subsaithong',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 172, 99, 182),
                ),
              ),
              Text(
                '6321602949'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 144, 70, 160),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              const InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.school,
                      color: Color.fromARGB(255, 255, 64, 172),
                    ),
                    title:Text(
                      'Third-year Kasetsart U. ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 166, 92, 205)),
                    ),
                  ),
                ),
              ),
              const InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Color.fromARGB(255, 255, 64, 172),
                    ),
                    title: Text(
                      '091-730-2032',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 166, 92, 205)),
                    ),
                  ),
                ),
              ),
              const InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 255, 64, 172),
                    ),
                    title:Text(
                      'phanit.su@ku.th',
                      style: TextStyle(
                          fontSize: 20,
                          color:Color.fromARGB(255, 166, 92, 205)),
                    ),
                  ),
                ),
              ),
              const InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.cake,
                      color: Color.fromARGB(255, 255, 64, 172),
                    ),
                    title: Text(
                      '19/03/2002',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 166, 92, 205)),
                    ),
                  ),
                ),
              ),
              const InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 255, 64, 172),
                    ),
                    title: Text(
                      '1045/65 Mahachai, Samutsakhon 74000',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 166, 92, 205)),
                    ),
                  ),
                ),
              ),
               
            Center(
            child: SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: const Text('Close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
            ],
          ),
        ),
      ),
    ));
  }
}