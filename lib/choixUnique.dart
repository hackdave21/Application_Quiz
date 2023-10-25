import 'package:dream/font.dart';
import 'package:dream/modelUnique.dart';
import 'package:dream/qcm.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Unique extends StatefulWidget {
  const Unique({super.key});

  @override
  State<Unique> createState() => _UniqueState();
}

class _UniqueState extends State<Unique> {
  int currentQuestion = 0;

  List<String> questions = [
    'Le belier qui va foncer commence par reculer. Quelle est la source ?',
    'Nous avons un profil pour Dieu et un autre pour le diable',
    "Ils peuvent tuer toutes les hirondelles, il n'empecheront pas le printemps d'arriver",
    "Celui qui place un crapeau  à la tête d'un groupe ne doit pas se plaindre ensuite de sa manière de sauter",
    "Un chien reste un chien, serait-il élévé par des lions",
    "Vanités des vanité, tout est vanité, de quel livre de la bible tire-t-on cette phrase ?",
    "Sans respect, qu'y a t-il pour distinguer les hommes des bêtes ? De qui est cette phrase ?",
    "L'inspiration existe mais il faut qu'elle vous trouve au travail",
  ];

  List<List<String>> answers = [
    ['Baloulé', 'Chinois', 'Djoula', 'Togolais'],
    ['Anglais', 'Français', 'Afghan', 'Comore'],
    ['Afghan', 'Anglais', 'Coréen', 'Nigerien'],
    ['Anglais', 'Togolais', 'Ghanéen', 'Beninois'],
    ['Libanais', 'Algerien', 'Camerounais', 'Ivoirien'],
    ['Genèse', 'Esther', 'Eclesiaste', 'Psaumes'],
    ['Marc Aurele', 'Conficius', 'Aristote', 'Nitzsche'],
    ['Aristote', 'Pablo picasso', 'Leonardo de Vinci', 'Claude Monet'],
  ];
  List<int> correctAnswers = [0, 0, 0, 0, 0, 2, 1, 1];
  var score = 0.0;

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
            title: Text('Niveau 1',
                style: GoogleFonts.inter(
                    fontSize: 20, fontWeight: FontWeight.w900, color: blanc)),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Consigne:\n\n ',
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Colors.amber),
                    ),
                    Text(
                        'A chaque question, une seule reponse est vraie.\n Si vous trouvez la bonne reponse à la première tentative, vous avez la totalité des points.\n Par contre si vous faussez vous perdez la moitié des points et vous avez droit à une seconde tentative.\n Si vous échoué encore vous perdez le quart des points et vous avez droit à une troisième tentative.\n Si vous échouez à nouveau vous perdez la totalité des points.\n',
                        style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: blanc)),
                    Text(
                      'BONNE CHANCE!!!',
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Colors.amber),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * .9,
                      color: blanc,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      questions[currentQuestion],
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: blanc,
                          fontSize: 23),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        for (int i = 0;
                            i < answers[currentQuestion].length;
                            i++)
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            height: 60,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: ElevatedButton(
                              onPressed: () => checkAnswer(i),
                              child: Text(answers[currentQuestion][i]),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: couleur2,
                                textStyle: font1,
                              ),
                            ),
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Score: $score/${questions.length}',
                      style: font1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>  Multiple())));
                    }, child: Text('next'))
                  ]),
            ),
          ),
        ));
  }

  void checkAnswer(int answer) {
    if (answer == correctAnswers[currentQuestion]) {
      setState(() {
        score++;
        currentQuestion++;
      });
    } else if (answer != correctAnswers) {
      setState(() {
        score -= 0.5;
        return;
      });
    } else if (answer != correctAnswers) {
      setState(() {
        score--;
      });
    } else {
      setState(() {
        score = 0;
      });
    }

    if (currentQuestion == questions.length) {
      currentQuestion = 0;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => Multiple())));
    }
  }
}
