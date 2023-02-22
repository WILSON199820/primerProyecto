import'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'View/Registro.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home:Home());
    }
}
class Home extends StatefulWidget {
  @override
  HomeStart createState() =>HomeStart();
}

class HomeStart extends State<Home>{
  TextEditingController user =TextEditingController();
  TextEditingController pass =TextEditingController();
  validarDatos()async{
    try{
     CollectionReference ref=FirebaseFirestore.instance.collection('Usuarios');
     QuerySnapshot usuario=await ref.get();

     if(usuario.docs.length !=0){
  for(var cursor in usuario.docs){
    if(cursor.get('EmailUsuario')==user.text){
      print('usuario encontrado');
      print(cursor.get('Identidad'));
      if(cursor.get('Contrasenaid')==pass.text){
        print('***************Aceso aceptado*************');
        print('estado'+cursor.get('estado'));
      }
    }

  }

     }else{
       print('no hay documentos');
     }
    }catch(e){
      print('error'+e.toString()) ;

    }
  }
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Bienvenidos',
      home:Scaffold(
        appBar: AppBar(
          title:Text('App linea 2'),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top:10,left: 10,right: 10),
                child:Container(
                  width: 100,
                  height: 100,
                  child:Image.asset('img/6681204.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              child: TextField(
                controller: user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: 'email usuario',
                  hintText: 'digite email del usuario'
                ),
              ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: pass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: 'contraseña',
                      hintText: 'digite la contraseña'
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top:20,left: 10,right: 10),
                  child:ElevatedButton(
                    onPressed:(){
                      validarDatos();
                    },
                    child: Text('Enviar')

              )
              ),
              Padding(
                  padding: EdgeInsets.only(top:20,left: 10,right: 10),
                  child:TextButton(
                      onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder:(_)=>Registro()));

                      },
                      child: Text('Registrar')

                  )
              ),
            ],
          )
        ),
      ),

    );
  }
}