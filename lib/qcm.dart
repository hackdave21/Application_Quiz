import 'package:dream/font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'champDeTexte.dart';

class Question {
  final String questionText;
  final List<String> answers;
  final List<bool> correctAnswers;

  Question(this.questionText, this.answers, this.correctAnswers);
}

class Multiple extends StatefulWidget {
  const Multiple({super.key});

  @override
  State<Multiple> createState() => _MultipleState();
}

class _MultipleState extends State<Multiple> {
  int _currentQuestionIndex = 0;
  var _score = 0.0;
  final List<List<String>> _questions = [
    [
      "Quand le feu attaque la case du voisin, que doit-on faire?",
      "1-Commencer à mouiller sa case",
      "2-Sortir tout ce qu'on à comme de notre case",
      "3-Aider le voisin à eteindre son feu",
      "4-Fuire au plus vite"
    ],
    [
      "Comment agir quand une personne s'étouffe?",
      "1-Rester surtout très loin du sujet, on est jamais assez prudent",
      "2-Lui faire directement du bouche à bouche pour l'aider à mieux respirer",
      "3-Essayer de comprendre là cause de ce qui lui arrive et agir en consequence",
      "4-Appeler les secours au plus vite"
    ],
    [
      "Les personnes frappées par le malheur",
      "1-Les mauvaises personnes",
      "2-Les bonnes personnes"
    ],
    [
      "Lois faisant parties des 48 lois du pouvoir",
      "1-La réputation est la pierre angulaire du pouvoir",
      "2-Travailler très dur",
      "3-Ne surpassez jamais le maître",
      "4-Être très honnête"
    ],
    ["Les arts", "1-Musique", "2-Peinture", "3-Mathematiques", "4-Chimie"],
  ];
  final List<List<int>> _answers = [
    [0, 2],
    [2, 3],
    [0, 1],
    [0, 2],
    [0, 1]
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/nw.jpeg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: couleur1.withOpacity(.3),
          appBar: AppBar(
            backgroundColor: couleur2,
            title: Text('Niveau 2',
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
                    'A chaque question, deux reponses sont vraies.\n Si vous trouvez les deux bonnes reponses, vous avez la totalité des points.\n Par contre si vous trouvez une seule reponse vraie vous avez la moitié des points.\n Si vous trouvez une bonne reponse et une mauvaise reponse vous perdez la totalité des points.\n Si vous choisissez une fausse reponse vous avez -0,5 point sur votre note générale.\n Si vous avez choisis deux mauvaises vous avez -1 sur votre note générale.\n',
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
                _currentQuestionIndex < _questions.length+1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _questions[_currentQuestionIndex][0],
                            style: font1,
                          ),
                          const SizedBox(height: 20),
                          _buildAnswerButton(1),
                          const SizedBox(height: 10),
                          _buildAnswerButton(2),
                          const SizedBox(height: 10),
                          _buildAnswerButton(3),
                          const SizedBox(height: 10),
                          _buildAnswerButton(4),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            child: const Text('Valider'),
                            onPressed: () => _nextQuestion(),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Score: $_score',
                            style: font1,
                          ),
                        ],
                      )
                    : Text(
                        ' Votre score est de $_score',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            color: couleur1,
                            fontSize: 15),
                      ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerButton(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      height: 60,
      child: ElevatedButton(
        child: Text(
          _questions[_currentQuestionIndex][index],
          style: const TextStyle(fontSize: 16),
        ),
        onPressed: () => _selectAnswer(index),
      ),
    );
  }

  void _selectAnswer(int index) {
    List<int> correctAnswers = _answers[_currentQuestionIndex];
    if (correctAnswers.contains(index - 1)) {
      if (correctAnswers.length == 1) {
        setState(() {
          _score += 0.5;
        });
      } else {
        setState(() {
          _score += 1;
        });
      }
    } /*else if() {

    }*/
  }

  void _nextQuestion() {
    if ( _currentQuestionIndex < _questions.length) {
setState(() {
      _currentQuestionIndex++;
    });
    }
    
  }
}
