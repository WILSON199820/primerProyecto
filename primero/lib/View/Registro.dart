import'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
class Registro extends StatefulWidget{
  @override
  RegistroApp createState() => RegistroApp();
}

class RegistroApp extends State<Registro>{
  TextEditingController nombre=TextEditingController();
  TextEditingController identidad=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController telefono=TextEditingController();
  TextEditingController contrasena=TextEditingController();
  final firebase=FirebaseFirestore.instance;
  insertarDatos()async{
   try{
     await firebase.collection('Usuarios').doc().set({
       'NombreUsuario':nombre.text,
       'Identidad':identidad.text,
       'EmailUsuario':email.text,
       'Telefono':telefono.text,
       'Contrasenaid':contrasena.text,
     });
     print('envio correcto');
   }
   catch(e){
     print('error'+ e.toString());
   }
  }
  @override
  Widget build( BuildContext context){

    return Scaffold(
        appBar:AppBar(
          title:Text('Registro de usuarios'),
          backgroundColor: Colors.blue,

        ),
        body:SingleChildScrollView(
          child:Column(
            children:[
              Padding(padding: EdgeInsets.only(top:20,left:10,right:10),
                child: TextField(
                  controller: nombre,
                  decoration:InputDecoration(
                    labelText: 'Nombre'

                  ),
                  style:TextStyle(
                    color: Color(0xFF0097ff)
                  )
                ),
              ),
              Padding(padding: EdgeInsets.only(top:20,left:10,right:10),
                child: TextField(
                    controller: identidad,
                    decoration:InputDecoration(
                        labelText: 'Identificación'

                    ),
                    style:TextStyle(
                        color: Color(0xFF0097ff)
                    )
                ),
              ),
              Padding(padding: EdgeInsets.only(top:20,left:10,right:10),
                child: TextField(
                    controller: email,
                    decoration:InputDecoration(
                        labelText: 'Email'

                    ),
                    style:TextStyle(
                        color: Color(0xFF0097ff)
                    )
                ),
              ),
              Padding(padding: EdgeInsets.only(top:20,left:10,right:10),
                child: TextField(
                    controller: telefono,
                    decoration:InputDecoration(
                        labelText: 'Telefono'

                    ),
                    style:TextStyle(
                        color: Color(0xFF0097ff)
                    )
                ),
              ),
              Padding(padding: EdgeInsets.only(top:20,left:10,right:10),
                child: TextField(
                    controller: contrasena,
                    decoration:InputDecoration(
                        labelText: 'contraseña'

                    ),
                    style:TextStyle(
                        color: Color(0xFF0097ff)
                    )
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(top:20,left: 10,right: 10),
                  child:ElevatedButton(
                      onPressed:(){
                        insertarDatos();

                      },
                      child: Text('Registrar')

                  )
              ),



            ]
          )
        )
    );

    }
}