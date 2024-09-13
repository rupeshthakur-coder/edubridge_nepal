import 'package:flutter/material.dart';

class QuizPage<QuizPageState> extends StatefulWidget {
  final String subject;

  const QuizPage({super.key, required this.subject});

  @override
  createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Map containing quiz questions for each subject
  final Map<String, List<Map<String, dynamic>>> subjectQuestions = {
    'Mathematics': [
      {
        'question': 'What is 5 + 3?',
        'options': ['7', '8', '9', '10'],
        'correctAnswer': '8'
      },
      {
        'question': 'What is the square root of 16?',
        'options': ['2', '3', '4', '5'],
        'correctAnswer': '4'
      },
      {
        'question': 'What is 10 * 10?',
        'options': ['50', '100', '150', '200'],
        'correctAnswer': '100'
      },
      {
        'question': 'What is 7 - 4?',
        'options': ['1', '2', '3', '4'],
        'correctAnswer': '3'
      },
      {
        'question': 'What is 9 / 3?',
        'options': ['2', '3', '4', '5'],
        'correctAnswer': '3'
      },
      {
        'question': 'What is 12 % 5?',
        'options': ['1', '2', '3', '4'],
        'correctAnswer': '2'
      },
      {
        'question':
            'What is the area of a rectangle with length 5 and width 3?',
        'options': ['8', '10', '15', '20'],
        'correctAnswer': '15'
      },
      {
        'question': 'What is the perimeter of a square with side length 4?',
        'options': ['12', '14', '16', '18'],
        'correctAnswer': '16'
      },
      {
        'question': 'What is 15 + 6 - 4?',
        'options': ['16', '17', '18', '19'],
        'correctAnswer': '17'
      },
      {
        'question': 'What is the value of π (pi) approximately?',
        'options': ['3.14', '2.71', '1.62', '1.41'],
        'correctAnswer': '3.14'
      },
      {
        'question': 'What is 3^3?',
        'options': ['6', '9', '27', '81'],
        'correctAnswer': '27'
      },
      {
        'question': 'What is the value of 5 factorial (5!)?',
        'options': ['120', '60', '24', '10'],
        'correctAnswer': '120'
      },
      {
        'question': 'What is 50 divided by 10?',
        'options': ['4', '5', '6', '7'],
        'correctAnswer': '5'
      },
      {
        'question':
            'What is the hypotenuse of a right triangle with legs of 3 and 4?',
        'options': ['5', '6', '7', '8'],
        'correctAnswer': '5'
      },
      {
        'question': 'What is the sum of angles in a triangle?',
        'options': ['180°', '360°', '90°', '120°'],
        'correctAnswer': '180°'
      },
      {
        'question': 'What is the product of 7 and 8?',
        'options': ['54', '56', '58', '60'],
        'correctAnswer': '56'
      },
      {
        'question': 'What is 100 - 37?',
        'options': ['63', '67', '73', '77'],
        'correctAnswer': '63'
      },
      {
        'question': 'What is 2^4?',
        'options': ['8', '12', '16', '20'],
        'correctAnswer': '16'
      },
      {
        'question': 'What is the volume of a cube with side length 3?',
        'options': ['9', '18', '27', '36'],
        'correctAnswer': '27'
      },
      {
        'question': 'What is the average of 8, 12, and 16?',
        'options': ['10', '12', '14', '16'],
        'correctAnswer': '12'
      },
      {
        'question': 'What is the value of 9 squared?',
        'options': ['81', '72', '90', '100'],
        'correctAnswer': '81'
      }
    ],
    'Science': [
      {
        'question': 'What planet is known as the Red Planet?',
        'options': ['Earth', 'Mars', 'Jupiter', 'Saturn'],
        'correctAnswer': 'Mars'
      },
      {
        'question': 'What is the chemical symbol for water?',
        'options': ['O', 'H', 'H2O', 'CO2'],
        'correctAnswer': 'H2O'
      },
      {
        'question': 'What is the force that pulls objects toward Earth?',
        'options': ['Magnetism', 'Gravity', 'Electricity', 'Friction'],
        'correctAnswer': 'Gravity'
      },
      {
        'question': 'What gas do plants use for photosynthesis?',
        'options': ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
        'correctAnswer': 'Carbon Dioxide'
      },
      {
        'question': 'What is the chemical symbol for gold?',
        'options': ['Au', 'Ag', 'Pb', 'Fe'],
        'correctAnswer': 'Au'
      },
      {
        'question': 'What is the largest organ in the human body?',
        'options': ['Heart', 'Liver', 'Skin', 'Lung'],
        'correctAnswer': 'Skin'
      },
      {
        'question': 'What is the primary source of energy for Earth?',
        'options': ['Moon', 'Sun', 'Wind', 'Water'],
        'correctAnswer': 'Sun'
      },
      {
        'question': 'What is the hardest natural substance on Earth?',
        'options': ['Gold', 'Iron', 'Diamond', 'Quartz'],
        'correctAnswer': 'Diamond'
      },
      {
        'question': 'What is the basic unit of life?',
        'options': ['Cell', 'Tissue', 'Organ', 'Organism'],
        'correctAnswer': 'Cell'
      },
      {
        'question': 'What is the powerhouse of the cell?',
        'options': [
          'Nucleus',
          'Mitochondria',
          'Ribosome',
          'Endoplasmic Reticulum'
        ],
        'correctAnswer': 'Mitochondria'
      },
      {
        'question': 'What are the building blocks of proteins?',
        'options': [
          'Carbohydrates',
          'Amino Acids',
          'Fatty Acids',
          'Nucleotides'
        ],
        'correctAnswer': 'Amino Acids'
      },
      {
        'question': 'What is the boiling point of water in Celsius?',
        'options': ['90°C', '100°C', '110°C', '120°C'],
        'correctAnswer': '100°C'
      },
      {
        'question': 'What is the chemical symbol for sodium?',
        'options': ['Na', 'N', 'So', 'S'],
        'correctAnswer': 'Na'
      },
      {
        'question': 'What is the process by which plants make their food?',
        'options': [
          'Respiration',
          'Photosynthesis',
          'Fermentation',
          'Digestion'
        ],
        'correctAnswer': 'Photosynthesis'
      },
      {
        'question': 'What is the main component of the Earth’s atmosphere?',
        'options': ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Argon'],
        'correctAnswer': 'Nitrogen'
      },
      {
        'question':
            'What type of blood vessel carries blood away from the heart?',
        'options': ['Veins', 'Arteries', 'Capillaries', 'Venules'],
        'correctAnswer': 'Arteries'
      },
      {
        'question': 'What is the smallest unit of an element?',
        'options': ['Atom', 'Molecule', 'Cell', 'Particle'],
        'correctAnswer': 'Atom'
      },
      {
        'question': 'What is the chemical symbol for silver?',
        'options': ['Si', 'Ag', 'Au', 'Pb'],
        'correctAnswer': 'Ag'
      },
      {
        'question':
            'What organ is responsible for pumping blood through the body?',
        'options': ['Liver', 'Lung', 'Kidney', 'Heart'],
        'correctAnswer': 'Heart'
      },
      {
        'question': 'What type of animal is a Komodo dragon?',
        'options': ['Mammal', 'Reptile', 'Bird', 'Fish'],
        'correctAnswer': 'Reptile'
      }
    ],
    'History': [
      {
        'question': 'Who was the first president of the United States?',
        'options': [
          'Abraham Lincoln',
          'George Washington',
          'John Adams',
          'Thomas Jefferson'
        ],
        'correctAnswer': 'George Washington'
      },
      {
        'question': 'In what year did World War II end?',
        'options': ['1940', '1942', '1945', '1948'],
        'correctAnswer': '1945'
      },
      {
        'question':
            'What was the name of the ship that brought the Pilgrims to America?',
        'options': ['Mayflower', 'Santa Maria', 'Titanic', 'Discovery'],
        'correctAnswer': 'Mayflower'
      },
      {
        'question': 'Who was the first man to walk on the Moon?',
        'options': [
          'Neil Armstrong',
          'Buzz Aldrin',
          'Yuri Gagarin',
          'Michael Collins'
        ],
        'correctAnswer': 'Neil Armstrong'
      },
      {
        'question': 'What ancient civilization built the pyramids?',
        'options': ['Mesopotamians', 'Egyptians', 'Greeks', 'Romans'],
        'correctAnswer': 'Egyptians'
      },
      {
        'question':
            'Who was the leader of the Soviet Union during World War II?',
        'options': [
          'Joseph Stalin',
          'Vladimir Lenin',
          'Nikita Khrushchev',
          'Leon Trotsky'
        ],
        'correctAnswer': 'Joseph Stalin'
      },
      {
        'question': 'In what year did the Titanic sink?',
        'options': ['1900', '1912', '1920', '1935'],
        'correctAnswer': '1912'
      },
      {
        'question':
            'Who was the first female Prime Minister of the United Kingdom?',
        'options': [
          'Margaret Thatcher',
          'Theresa May',
          'Ellen Johnson Sirleaf',
          'Golda Meir'
        ],
        'correctAnswer': 'Margaret Thatcher'
      },
      {
        'question': 'What was the main cause of the American Civil War?',
        'options': [
          'Economic Disputes',
          'Slavery',
          'Territorial Expansion',
          'Trade Restrictions'
        ],
        'correctAnswer': 'Slavery'
      },
      {
        'question': 'What was the Renaissance?',
        'options': [
          'A War',
          'A Rebellion',
          'A Period of Artistic and Cultural Revival',
          'A Political Movement'
        ],
        'correctAnswer': 'A Period of Artistic and Cultural Revival'
      },
      {
        'question': 'Who was the famous queen of ancient Egypt?',
        'options': ['Cleopatra', 'Nefertiti', 'Hatshepsut', 'Ramses'],
        'correctAnswer': 'Cleopatra'
      },
      {
        'question': 'What was the primary language of the Roman Empire?',
        'options': ['Latin', 'Greek', 'Hebrew', 'Aramaic'],
        'correctAnswer': 'Latin'
      },
      {
        'question': 'Who was the leader of the French Revolution?',
        'options': [
          'Napoleon Bonaparte',
          'Louis XVI',
          'Maximilien Robespierre',
          'Charles de Gaulle'
        ],
        'correctAnswer': 'Maximilien Robespierre'
      },
      {
        'question': 'What was the Cold War?',
        'options': [
          'A War Between the North and South',
          'A Conflict Between Capitalism and Communism',
          'A Trade Dispute',
          'A Scientific Race'
        ],
        'correctAnswer': 'A Conflict Between Capitalism and Communism'
      },
      {
        'question': 'Who discovered America in 1492?',
        'options': [
          'Christopher Columbus',
          'Ferdinand Magellan',
          'Marco Polo',
          'Vasco da Gama'
        ],
        'correctAnswer': 'Christopher Columbus'
      },
      {
        'question': 'What was the Berlin Wall?',
        'options': [
          'A Wall in Berlin',
          'A Symbol of the Cold War',
          'A Medieval Structure',
          'A Wall for Trade'
        ],
        'correctAnswer': 'A Symbol of the Cold War'
      },
      {
        'question': 'Who was the first emperor of China?',
        'options': ['Qin Shi Huang', 'Liu Bang', 'Wudi', 'Yao'],
        'correctAnswer': 'Qin Shi Huang'
      },
      {
        'question': 'What was the Treaty of Versailles?',
        'options': [
          'A Treaty Ending World War I',
          'A Treaty Ending World War II',
          'A Trade Agreement',
          'A Peace Treaty'
        ],
        'correctAnswer': 'A Treaty Ending World War I'
      },
      {
        'question':
            'Who was the leader of the Confederate Army during the American Civil War?',
        'options': [
          'Robert E. Lee',
          'Ulysses S. Grant',
          'William Tecumseh Sherman',
          'Stonewall Jackson'
        ],
        'correctAnswer': 'Robert E. Lee'
      },
      {
        'question': 'What event triggered World War I?',
        'options': [
          'The Assassination of Archduke Franz Ferdinand',
          'The Signing of the Treaty of Versailles',
          'The Invasion of Poland',
          'The Bombing of Pearl Harbor'
        ],
        'correctAnswer': 'The Assassination of Archduke Franz Ferdinand'
      }
    ],
    'Geography': [
      {
        'question': 'What is the largest continent?',
        'options': ['Africa', 'Asia', 'Europe', 'Australia'],
        'correctAnswer': 'Asia'
      },
      {
        'question': 'Which country has the most population?',
        'options': ['India', 'United States', 'China', 'Russia'],
        'correctAnswer': 'China'
      },
      {
        'question': 'Which is the longest river in the world?',
        'options': ['Amazon', 'Nile', 'Yangtze', 'Mississippi'],
        'correctAnswer': 'Nile'
      },
      {
        'question': 'What is the smallest country in the world?',
        'options': ['Vatican City', 'Monaco', 'San Marino', 'Liechtenstein'],
        'correctAnswer': 'Vatican City'
      },
      {
        'question': 'Which country is known as the Land of the Rising Sun?',
        'options': ['China', 'Japan', 'Thailand', 'South Korea'],
        'correctAnswer': 'Japan'
      },
      {
        'question': 'What is the capital city of Australia?',
        'options': ['Sydney', 'Melbourne', 'Brisbane', 'Canberra'],
        'correctAnswer': 'Canberra'
      },
      {
        'question': 'Which desert is the largest in the world?',
        'options': ['Sahara', 'Gobi', 'Kalahari', 'Arctic'],
        'correctAnswer': 'Sahara'
      },
      {
        'question': 'Which river flows through Egypt?',
        'options': ['Amazon', 'Nile', 'Yangtze', 'Danube'],
        'correctAnswer': 'Nile'
      },
      {
        'question': 'Which mountain range separates Europe and Asia?',
        'options': ['Himalayas', 'Rockies', 'Andes', 'Ural'],
        'correctAnswer': 'Ural'
      },
      {
        'question': 'What is the capital of Canada?',
        'options': ['Toronto', 'Vancouver', 'Ottawa', 'Montreal'],
        'correctAnswer': 'Ottawa'
      },
      {
        'question': 'Which ocean is the largest?',
        'options': [
          'Atlantic Ocean',
          'Indian Ocean',
          'Arctic Ocean',
          'Pacific Ocean'
        ],
        'correctAnswer': 'Pacific Ocean'
      },
      {
        'question': 'Which country is known as the Emerald Isle?',
        'options': ['Scotland', 'Ireland', 'Wales', 'New Zealand'],
        'correctAnswer': 'Ireland'
      },
      {
        'question': 'What is the largest island in the world?',
        'options': ['Greenland', 'New Guinea', 'Borneo', 'Madagascar'],
        'correctAnswer': 'Greenland'
      },
      {
        'question': 'Which city is known as the City of Light?',
        'options': ['New York', 'London', 'Paris', 'Rome'],
        'correctAnswer': 'Paris'
      },
      {
        'question':
            'What is the name of the imaginary line that divides the Earth into Northern and Southern Hemispheres?',
        'options': [
          'Equator',
          'Prime Meridian',
          'Tropic of Cancer',
          'Tropic of Capricorn'
        ],
        'correctAnswer': 'Equator'
      },
      {
        'question': 'Which country is home to the Great Wall?',
        'options': ['China', 'India', 'Japan', 'Korea'],
        'correctAnswer': 'China'
      },
      {
        'question': 'What is the capital of Brazil?',
        'options': ['Rio de Janeiro', 'São Paulo', 'Brasília', 'Salvador'],
        'correctAnswer': 'Brasília'
      },
      {
        'question': 'Which African country is known for its pyramids?',
        'options': ['Egypt', 'Morocco', 'Nigeria', 'South Africa'],
        'correctAnswer': 'Egypt'
      },
      {
        'question': 'Which country is known as the Land of Fire and Ice?',
        'options': ['Iceland', 'Norway', 'Sweden', 'Finland'],
        'correctAnswer': 'Iceland'
      },
      {
        'question':
            'What is the name of the strait that separates Europe and Africa?',
        'options': [
          'Strait of Gibraltar',
          'Strait of Hormuz',
          'Strait of Dover',
          'Strait of Magellan'
        ],
        'correctAnswer': 'Strait of Gibraltar'
      }
    ],
    'Literature': [
      {
        'question': 'Who wrote "Romeo and Juliet"?',
        'options': [
          'Charles Dickens',
          'William Shakespeare',
          'Mark Twain',
          'Jane Austen'
        ],
        'correctAnswer': 'William Shakespeare'
      },
      {
        'question': 'What is the first book of the Bible?',
        'options': ['Genesis', 'Exodus', 'Matthew', 'John'],
        'correctAnswer': 'Genesis'
      },
      {
        'question': 'Who is the author of "1984"?',
        'options': [
          'George Orwell',
          'Aldous Huxley',
          'Ray Bradbury',
          'Kurt Vonnegut'
        ],
        'correctAnswer': 'George Orwell'
      },
      {
        'question': 'Who wrote "Pride and Prejudice"?',
        'options': [
          'Jane Austen',
          'Charlotte Brontë',
          'Emily Dickinson',
          'Louisa May Alcott'
        ],
        'correctAnswer': 'Jane Austen'
      },
      {
        'question':
            'What is the name of the fictional wizarding school in "Harry Potter"?',
        'options': ['Hogwarts', 'Ravenclaw', 'Durmstrang', 'Beauxbatons'],
        'correctAnswer': 'Hogwarts'
      },
      {
        'question': 'Who wrote "Moby Dick"?',
        'options': [
          'Herman Melville',
          'Mark Twain',
          'Nathaniel Hawthorne',
          'John Steinbeck'
        ],
        'correctAnswer': 'Herman Melville'
      },
      {
        'question':
            'What is the name of the main character in "The Catcher in the Rye"?',
        'options': [
          'Holden Caulfield',
          'Jay Gatsby',
          'Huck Finn',
          'Atticus Finch'
        ],
        'correctAnswer': 'Holden Caulfield'
      },
      {
        'question': 'Who wrote "To Kill a Mockingbird"?',
        'options': [
          'Harper Lee',
          'J.D. Salinger',
          'Ernest Hemingway',
          'F. Scott Fitzgerald'
        ],
        'correctAnswer': 'Harper Lee'
      },
      {
        'question': 'What is the title of the first "Lord of the Rings" book?',
        'options': [
          'The Fellowship of the Ring',
          'The Two Towers',
          'The Return of the King',
          'The Hobbit'
        ],
        'correctAnswer': 'The Fellowship of the Ring'
      },
      {
        'question': 'Who wrote "The Great Gatsby"?',
        'options': [
          'F. Scott Fitzgerald',
          'Ernest Hemingway',
          'John Steinbeck',
          'William Faulkner'
        ],
        'correctAnswer': 'F. Scott Fitzgerald'
      },
      {
        'question':
            'What novel begins with the line, "It was the best of times, it was the worst of times"?',
        'options': [
          'A Tale of Two Cities',
          'Great Expectations',
          'David Copperfield',
          'Bleak House'
        ],
        'correctAnswer': 'A Tale of Two Cities'
      },
      {
        'question': 'Who wrote "The Adventures of Tom Sawyer"?',
        'options': [
          'Mark Twain',
          'Herman Melville',
          'Charles Dickens',
          'Jane Austen'
        ],
        'correctAnswer': 'Mark Twain'
      },
      {
        'question':
            'What is the name of the author who wrote "Wuthering Heights"?',
        'options': [
          'Emily Brontë',
          'Charlotte Brontë',
          'Jane Austen',
          'Mary Shelley'
        ],
        'correctAnswer': 'Emily Brontë'
      },
      {
        'question': 'Who wrote "Frankenstein"?',
        'options': ['Mary Shelley', 'H.G. Wells', 'Bram Stoker', 'Jules Verne'],
        'correctAnswer': 'Mary Shelley'
      },
      {
        'question':
            'What is the title of the final book in the "Harry Potter" series?',
        'options': [
          'Harry Potter and the Deathly Hallows',
          'Harry Potter and the Half-Blood Prince',
          'Harry Potter and the Goblet of Fire',
          'Harry Potter and the Order of the Phoenix'
        ],
        'correctAnswer': 'Harry Potter and the Deathly Hallows'
      },
      {
        'question': 'Who is the author of "The Hobbit"?',
        'options': [
          'J.R.R. Tolkien',
          'C.S. Lewis',
          'J.K. Rowling',
          'J.D. Salinger'
        ],
        'correctAnswer': 'J.R.R. Tolkien'
      },
      {
        'question': 'What is the name of the protagonist in "Jane Eyre"?',
        'options': [
          'Jane Eyre',
          'Emma Woodhouse',
          'Elizabeth Bennet',
          'Catherine Earnshaw'
        ],
        'correctAnswer': 'Jane Eyre'
      },
      {
        'question': 'Who wrote "Dracula"?',
        'options': [
          'Bram Stoker',
          'Mary Shelley',
          'H.G. Wells',
          'J.R.R. Tolkien'
        ],
        'correctAnswer': 'Bram Stoker'
      },
      {
        'question':
            'What is the title of the novel that features the character Atticus Finch?',
        'options': [
          'To Kill a Mockingbird',
          'The Catcher in the Rye',
          'Pride and Prejudice',
          'The Great Gatsby'
        ],
        'correctAnswer': 'To Kill a Mockingbird'
      },
      {
        'question': 'Who wrote "Les Misérables"?',
        'options': [
          'Victor Hugo',
          'Charles Dickens',
          'Emile Zola',
          'Gustave Flaubert'
        ],
        'correctAnswer': 'Victor Hugo'
      },
      {
        'question':
            'What is the name of the dystopian novel written by Aldous Huxley?',
        'options': [
          'Brave New World',
          '1984',
          'Fahrenheit 451',
          'The Handmaid\'s Tale'
        ],
        'correctAnswer': 'Brave New World'
      }
    ]
  };

  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;

  void answerQuestion(String selectedAnswer) {
    final questions = subjectQuestions[widget.subject]!;
    if (selectedAnswer == questions[currentQuestionIndex]['correctAnswer']) {
      correctAnswers++;
    } else {
      incorrectAnswers++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Finished!'),
        content: Text(
            'Correct Answers: $correctAnswers\nIncorrect Answers: $incorrectAnswers'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.pop(context); // Go back to the subject selection page
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final questions = subjectQuestions[widget.subject]!;
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz on ${widget.subject}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              currentQuestion['question'],
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ...currentQuestion['options'].map((option) {
              return ElevatedButton(
                onPressed: () => answerQuestion(option),
                child: Text(option),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
