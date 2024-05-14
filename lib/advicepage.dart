// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'database/database.helper.dart';
import 'database/model.dart';

class FormHealthInfoPage extends StatefulWidget {
  FormHealthInfoPage({Key? key, required this.personName}) : super(key: key);

  String personName;

  @override
  State<FormHealthInfoPage> createState() => _FormHealthInfoPageState();
}

class _FormHealthInfoPageState extends State<FormHealthInfoPage> {
  List<Product> products = [];
  late DatabaseHelper dbHelper;
  // @override
  // void initState() {
  //   super.initState();
  // }
    double num1 = 0, num2 = 0,water = 0 ,bmi = 0;
    String condition = '';
  final _formKey = GlobalKey<FormState>();
  void showBMI() {
    setState(() {
       bmi = (num2/ ((num1/100) * (num1/100) )); 
    });
  }

   void showBMIdetile() {
    setState(() {
      if (bmi > 30) {
      condition ='Obese';
    } else if (bmi > 25) {
      condition ='Overweight';
    } else if (bmi > 18.5) {
      condition = 'Normal';
    } else {
      condition = 'UnderWeight';
    }
    });
  }
  
  void showtotal() {
    setState(() {
      water = (num2/2 *2.2 *30) ; 
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Font',
      primarySwatch: Colors.pink,),
    home: Scaffold(
        appBar: AppBar(
          title: Text('Advisory for ${widget.personName}'),
        ),
        body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(22, 20, 20, 0),
              alignment: Alignment.topLeft,
              child: const Text('Height'),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: '(m)',
                  hintText: 'กรอกส่วนสูง',
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 20.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                 keyboardType: TextInputType.number,
                onChanged: (value) {
                  num1 = double.parse(value) ;
                },
              
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(22, 20, 20, 0),
              alignment: Alignment.topLeft,
              child: const Text('Weight'),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: '(kg)',
                  hintText: 'กรอกน้ำหนัก',
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 20.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                 keyboardType: TextInputType.number,
                onChanged: (value) {
                  num2 = double.parse(value);
                  //Do something with this value
                },
               
              ),
            ),
           
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color.fromARGB(255, 62, 66, 179)),
                      ),
                      child: const Text('Submit'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showBMI();
                          showBMIdetile();
                          showtotal();
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                // Container(
                //       margin: const EdgeInsets.all(20),
                //       child: ElevatedButton(
                //           child: const Text('Add' ),
                //           onPressed: () async {
                //             var newProduct = Product(
                //                 bmi: bmi,
                //                 condition: condition,
                //                 water: water,
                //                );
                //             products.add(newProduct);
                //             await dbHelper.insertProduct(newProduct);
                //             Navigator.pop(context, products);
                //           }),
                //     ),
                  
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
                Text(
                 'ค่า BMI : $bmi \n',
                style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 100, 0, 201)),
              ),
                Text(
                 'น้ำหนักของคุณ : $condition\n',
                style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 148, 79)),
              ),
               Text(
                 'ปริมาณน้ำดื่ม/วัน : $water ลิตร ',
                style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 201, 47, 0)),
              ),
          ],
        ),
        ),
      ),
    )
    );
  }
}
