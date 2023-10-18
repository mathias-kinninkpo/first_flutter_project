import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String textpresentation = "Rien à afficher";
  final formKey =  GlobalKey<FormState>();

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController professioncontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Mon application Flutter", style: TextStyle(color: Colors.white,), textAlign: TextAlign.center,),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: namecontroller,
                keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Nom",
                    hintText: "Entrez votre nom & prénom"
                  ),
                  validator: (String? value) {
                    return (value == null || value == "") ? "Ce champ est obligatoire" : null;
                  },

                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: professioncontroller,
                  decoration: InputDecoration(
                      icon: Icon(Icons.work),
                      labelText: "Profession",
                      hintText: "Entrez votre Profession"
                  ),
                  validator: ( value) {
                    return (value == null || value.isEmpty ) ? "Ce champ est obligatoire" : null;
                  },

                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: agecontroller,
                  decoration: InputDecoration(
                      icon:  Icon(Icons.date_range),
                      labelText: "Age",
                      hintText: "Entrez votre age"
                  ),
                  validator: (String? value) {
                    return (value == null || value == "") ? "Ce champ est obligatoire" : null;
                  },

                )
              ],
            ),
          ),
          ElevatedButton(onPressed: () {
            if(formKey.currentState!.validate()){
            setState(() {
              textpresentation = "je m'appelle  " +namecontroller.text + ","+ "je suis  " + professioncontroller.text+ "et j'ai " + agecontroller.text + " ans";
            });
            }
          }, child: Text("Présentez-vous", style: TextStyle(color: Colors.green),)),
          Text(textpresentation, style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}

