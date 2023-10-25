import 'package:dream/choixUnique.dart';
import 'package:dream/font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
              image: AssetImage('assets/images/nw.jpeg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
         backgroundColor: couleur1.withOpacity(.3),
        appBar: AppBar(
          backgroundColor: couleur2,
          title:Text('Test de niveau', style: GoogleFonts.inter( 
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: blanc)),
          centerTitle: true,
        ),

        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     
                        const SizedBox( width: 80,),
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/images/employe.jpg')),
                                              color: Colors.white12,
                                              shape: BoxShape.circle),
                                        ),
                                      
                                   
                                     const SizedBox( width: 20),
                                    Column(
                                      children: [ 
                                       Text('MAMADOU', style: GoogleFonts.inter( 
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: blanc)),
                                      
                                        Text('Bineta', style: GoogleFonts.inter( 
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: blanc))],
                                    )
                    ],
                  ),
                
                 const SizedBox( height: 50,),
                 Container(
                                      height: 2,
                                      width: MediaQuery.of(context).size.width * .9,
                                      color: blanc,
                                     ),
                                      const SizedBox( height: 10),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.500,
                                        child: Column(
                                          children: [
                                            Text('A savoir avant de débuter le test:\n', style: GoogleFonts.inter( 
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.amber),),
                                       Text('Vous serez confronté à trois niveaux.', style: GoogleFonts.inter( 
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: blanc),),
                                      Text('Niveau 1: Questions à choix unique.\n Niveau 2: Questions à choix multiples.\n Niveau 3: Questions à champ de texte.\n', style: GoogleFonts.inter( 
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.amber)  ,),
                                       Text('Chaque question vaut 1 point et vous etes noté sur 15.\n BONNE CHANCE!!!', style: GoogleFonts.inter( 
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: blanc),),
                                          ],
                                        ),
                                      ),
                                     const SizedBox( height: 50,),
                 Text('Veuillez cliquer le bouton ci-dessous pour commenncer le test!!!', style: GoogleFonts.inter( 
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.amber)  ,),
                 const SizedBox( height: 20),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration( color: couleur2, borderRadius: BorderRadius.circular(15)),
                  child: IconButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>  Unique())));
                  }, 
                  icon:  Text('QUIZ', style: font1)),
                ),
               
              ],
            ),
          ),
        

        
      ),
    );
  }
}