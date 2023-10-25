import 'package:dream/font.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Texte extends StatefulWidget {
  const Texte({super.key});

  @override
  State<Texte> createState() => _TexteState();
}

class _TexteState extends State<Texte> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
        return false; 
      },
      child: Container( decoration: const BoxDecoration(
          image: DecorationImage(
                image: AssetImage('assets/images/nw.jpeg'), fit: BoxFit.cover),
        ),
         child: Scaffold(
         backgroundColor: couleur1.withOpacity(.3),
          appBar: AppBar(
            backgroundColor: couleur2,
            title: Text('Niveau 3', style:  GoogleFonts.inter(  fontSize: 20, fontWeight: FontWeight.w900, color: blanc)),
            centerTitle: true,
          ),
          body:  SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                 const SizedBox( height: 20,),
                 Text('Consigne:\n\n ', style: GoogleFonts.inter( 
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.amber),),
                  Text('Saisissez la reponse correcte\n',
                   style:  GoogleFonts.inter(  fontSize: 17, fontWeight: FontWeight.w900, color: blanc)
                 ),
                 Text('BONNE CHANCE!!!', style: GoogleFonts.inter( 
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.amber),),
                 const SizedBox( height: 40,),
                 const SizedBox(height: 20,),
                 Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration( color: couleur2, borderRadius: BorderRadius.circular(15)),
                  child: IconButton(onPressed: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Result())));
                  }, 
                  icon:  Text('Validez', style: font1)),
                ),
                ],
              )
            ),
          ),
         ),),
    );
  }
}




