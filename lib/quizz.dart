import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Escolar',
      home: TelaRegistro(), 
    );
  }
}

class TelaRegistro extends StatefulWidget {
  @override
  _TelaRegistroState createState() => _TelaRegistroState();
}

class _TelaRegistroState extends State<TelaRegistro> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _registrar() {
    if (_formKey.currentState?.validate() ?? false) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TelaLogin(username, password)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Por favor, registre-se para iniciar o quiz.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Usuário'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira um usuário';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira uma senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: _registrar,
                child: Text('Registrar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TelaLogin extends StatefulWidget {
  final String registeredUsername;
  final String registeredPassword;

  TelaLogin(this.registeredUsername, this.registeredPassword);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_usernameController.text == widget.registeredUsername &&
          _passwordController.text == widget.registeredPassword) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TelaInicial()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário ou senha incorretos')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela de Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Por favor, faça login para iniciar o quiz.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Usuário'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira seu nome de usuário';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: _login,
                child: Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bem vindo ao Quiz Escolar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
             'data:image/jpeg;base64,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', 
              width: 250,
            ),
            SizedBox(height: 20),
            Text(
              'Olá, Bem-vindo ao Quiz Escolar!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()), 
                );
              },
              child: Text('Iniciar Quiz'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 100, 150, 233),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, Object>> questions = [
    {
      'question': 'Qual é a fórmula química da água?',
      'answers': ['H2O', 'CO2', 'O2', 'N2'],
      'correctAnswer': 'H2O',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQIpCKCr_N5QqfDOR4weTfugMdtCiygH7-ENguHoDp_vrNHuq_Oz5Q9dLXL0IiIjKZuSs&usqp=CAU',
    },
    {
      'question': 'Qual é o resultado de 8 * 9?',
      'answers': ['72', '64', '81', '63'],
      'correctAnswer': '72',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1dgii3_mzy03iYgO__ICdwwQu3DMFhF0Z7g&s',
    },
    {
      'question': 'Qual é o maior planeta do Sistema Solar?',
      'answers': ['Júpiter', 'Saturno', 'Marte', 'Terra'],
      'correctAnswer': 'Júpiter',
      'image': 'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/10EB2/production/_125689296_gettyimages-1128675063.jpg.webp',
    },
    {
      'question': 'Qual é a fórmula da área de um triângulo?',
      'answers': ['Base × Altura', 'Base × Altura / 2', 'Pi × Raio²', 'Lado × Lado'],
      'correctAnswer': 'Base × Altura / 2',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjuenfi02qOepzp8vfTCj10PqMK4FUt7-Mw4Xm-2S48MRlxq97UxZd6R7Yi5Sr9qa4GC0&usqp=CAU',
    },
    {
      'question': 'Qual é o maior oceano do planeta?',
      'answers': ['Oceano Atlântico', 'Oceano Índico', 'Oceano Ártico', 'Oceano Pacífico'],
      'correctAnswer': 'Oceano Pacífico',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB0u8yHvTTiWwC4H0X0TfK-F6G0vRQ6uK9eA&s',
    },
    {
      'question': 'Quem pintou a Mona Lisa?',
      'answers': ['Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Claude Monet'],
      'correctAnswer': 'Leonardo da Vinci',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU8RIryTH_MJYFsiNEXESBZ3P0sTn_cTwA8w&s',
    },
    {
      'question': 'Qual é o maior continente do mundo em termos de área?',
      'answers': ['Ásia', 'África', 'América do Norte', 'Europa'],
      'correctAnswer': 'Ásia',
      'image': 'https://atlasescolar.ibge.gov.br/images/mapas/mundo/1920/continentes.jpg',
    },
    { 'question': 'Qual é o menor país do mundo em termos de área?',
      'answers': ['Mônaco', 'Vaticano', 'Nauru', 'San Marino'],
      'correctAnswer': 'Vaticano',
      'image': 'https://www.laciviltacattolica.it/wp-content/uploads/2019/09/VATICANO.jpg',
    },
    {
      'question': 'O que foi a Guerra Fria?',
      'answers': ['Um conflito armado entre os EUA e a União Soviética', 
      'Uma disputa ideológica e política entre os blocos capitalista e socialista', 
      'Uma guerra travada entre a Alemanha e os Estados Unidos', 
      'Uma guerra entre os países da União Europeia e a União Soviética'],
      'correctAnswer': 'Uma disputa ideológica e política entre os blocos capitalista e socialista',
      'image': 'https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2023/04/24/1169018795-guerra-fria.jpg',

    },
    {
      'question': 'O que é a fotossíntese?',
      'answers': ['Processo de respiração das plantas', 'Processo de produção de energia nas plantas usando luz', 'Transporte de água nas plantas', 'Reprodução das plantas'],
      'correctAnswer': 'Processo de produção de energia nas plantas usando luz',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiA61GujfHXinRpVw3KA2rth6ZCa058-BvfR66rcpgxrUgYnBqSMrp35vDIF4dMOAJ84w&usqp=CAU',
    },
  ];

  int currentQuestionIndex = 0;
  int score = 0;
  String message = '';
  Color messageColor = Colors.black;
  bool answerSelected = false;

  void checkAnswer(String answer) {
    if (!answerSelected) {
      setState(() {
        answerSelected = true;
        if (answer == questions[currentQuestionIndex]['correctAnswer']) {
          score += 10;
          message = 'Resposta correta!';
          messageColor = const Color.fromARGB(255, 3, 250, 85);
        } else {
          message = 'Resposta errada!';
          messageColor = const Color.fromARGB(255, 248, 3, 3);
        }
      });
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        resetMessage();
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScorePage(score: score, onRestart: resetQuiz),
        ),
      );
    }
  }

  void resetMessage() {
    message = '';
    messageColor = Colors.black;
    answerSelected = false;
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      resetMessage();
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz de Esportes')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              questions[currentQuestionIndex]['image'] as String,
              height: 300,
              width: 300,
            ),
            SizedBox(height: 20),
            if (currentQuestionIndex < questions.length) ...[
              Text(
                questions[currentQuestionIndex]['question'] as String,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ...(questions[currentQuestionIndex]['answers'] as List<String>).map((answer) {
                return ElevatedButton(
                  onPressed: () => checkAnswer(answer),
                  child: Text(answer),
                );
              }).toList(),
              SizedBox(height: 20),
              Text(message, style: TextStyle(fontSize: 20, color: messageColor)),
              if (answerSelected)
                ElevatedButton(
                  onPressed: nextQuestion,
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.deepPurple),
                  child: Text('Próxima Pergunta'),
                ),
            ]
          ],
        ),
      ),
    );
  }
}

class ScorePage extends StatelessWidget {
  final int score;
  final VoidCallback onRestart;

  ScorePage({required this.score, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pontuação Final')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sua Pontuação Total: $score pontos', style: TextStyle(fontSize: 24, color: Colors.blue)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: onRestart, child: Text('Deseja refazer este Quiz?')),
          ],
        ),
      ),
    );
  }
}