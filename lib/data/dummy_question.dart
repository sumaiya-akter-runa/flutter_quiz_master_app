import '../models/quiz_model.dart';

final List<QuizQuestion> dummyQuestions = [
  // Sports (5 Questions)
  QuizQuestion(
    question: "What is the national sport of Bangladesh?",
    options: ["Cricket", "Football", "Kabaddi", "Hockey"],
    correctAnswerIndex: 2,
    category: "Sports",
  ),
  QuizQuestion(
    question: "Who is known as the 'God of Cricket'?",
    options: ["Virat Kohli", "Sachin Tendulkar", "MS Dhoni", "Rohit Sharma"],
    correctAnswerIndex: 1,
    category: "Sports",
  ),
  QuizQuestion(
    question: "How many players are there in a cricket team?",
    options: ["9", "10", "11", "12"],
    correctAnswerIndex: 2,
    category: "Sports",
  ),
  QuizQuestion(
    question: "Which country won the FIFA World Cup 2022?",
    options: ["Brazil", "France", "Argentina", "Germany"],
    correctAnswerIndex: 2,
    category: "Sports",
  ),
  QuizQuestion(
    question: "What is the length of a cricket pitch?",
    options: ["20 yards", "22 yards", "24 yards", "25 yards"],
    correctAnswerIndex: 1,
    category: "Sports",
  ),

  // Science (5 Questions)
  QuizQuestion(
    question: "What is the chemical symbol of Water?",
    options: ["H2", "O2", "H2O", "CO2"],
    correctAnswerIndex: 2,
    category: "Science",
  ),
  QuizQuestion(
    question: "What planet is known as the Red Planet?",
    options: ["Venus", "Mars", "Jupiter", "Saturn"],
    correctAnswerIndex: 1,
    category: "Science",
  ),
  QuizQuestion(
    question: "What is the speed of light?",
    options: ["3×10^8 m/s", "3×10^6 m/s", "3×10^10 m/s", "3×10^5 m/s"],
    correctAnswerIndex: 0,
    category: "Science",
  ),
  QuizQuestion(
    question: "What is the hardest natural substance on Earth?",
    options: ["Gold", "Iron", "Diamond", "Platinum"],
    correctAnswerIndex: 2,
    category: "Science",
  ),
  QuizQuestion(
    question: "What gas do plants absorb from the atmosphere?",
    options: ["Oxygen", "Nitrogen", "Carbon Dioxide", "Hydrogen"],
    correctAnswerIndex: 2,
    category: "Science",
  ),

  // Technology (5 Questions)
  QuizQuestion(
    question: "Who founded Microsoft?",
    options: ["Steve Jobs", "Bill Gates", "Mark Zuckerberg", "Elon Musk"],
    correctAnswerIndex: 1,
    category: "Technology",
  ),
  QuizQuestion(
    question: "What does CPU stand for?",
    options: ["Central Processing Unit", "Computer Personal Unit", "Central Power Unit", "Control Processing Unit"],
    correctAnswerIndex: 0,
    category: "Technology",
  ),
  QuizQuestion(
    question: "Which company made the first iPhone?",
    options: ["Samsung", "Apple", "Nokia", "Google"],
    correctAnswerIndex: 1,
    category: "Technology",
  ),
  QuizQuestion(
    question: "What is the full form of AI?",
    options: ["Automatic Intelligence", "Artificial Intelligence", "Advanced Information", "Automated Interface"],
    correctAnswerIndex: 1,
    category: "Technology",
  ),
  QuizQuestion(
    question: "Who is the founder of Tesla?",
    options: ["Jeff Bezos", "Elon Musk", "Mark Zuckerberg", "Bill Gates"],
    correctAnswerIndex: 1,
    category: "Technology",
  ),

  // History (5 Questions)
  QuizQuestion(
    question: "Who was the first President of Bangladesh?",
    options: ["Sheikh Mujibur Rahman", "Ziaur Rahman", "Iajuddin Ahmed", "Abdul Hamid"],
    correctAnswerIndex: 0,
    category: "History",
  ),
  QuizQuestion(
    question: "In which year did Bangladesh get independence?",
    options: ["1970", "1971", "1972", "1969"],
    correctAnswerIndex: 1,
    category: "History",
  ),
  QuizQuestion(
    question: "Who was the first Prime Minister of India?",
    options: ["Sardar Vallabhbhai Patel", "Jawaharlal Nehru", "Mahatma Gandhi", "Subhas Chandra Bose"],
    correctAnswerIndex: 1,
    category: "History",
  ),
  QuizQuestion(
    question: "When did World War II end?",
    options: ["1944", "1945", "1946", "1947"],
    correctAnswerIndex: 1,
    category: "History",
  ),

  // General Knowledge (5 Questions)
  QuizQuestion(
    question: "What is the capital of France?",
    options: ["London", "Berlin", "Paris", "Madrid"],
    correctAnswerIndex: 2,
    category: "General Knowledge",
  ),
  QuizQuestion(
    question: "What is the largest ocean in the world?",
    options: ["Atlantic Ocean", "Indian Ocean", "Pacific Ocean", "Arctic Ocean"],
    correctAnswerIndex: 2,
    category: "General Knowledge",
  ),
  QuizQuestion(
    question: "How many continents are there?",
    options: ["5", "6", "7", "8"],
    correctAnswerIndex: 2,
    category: "General Knowledge",
  ),
  QuizQuestion(
    question: "What is the currency of Japan?",
    options: ["Yuan", "Yen", "Won", "Ringgit"],
    correctAnswerIndex: 1,
    category: "General Knowledge",
  ),
  QuizQuestion(
    question: "What is the tallest mountain in the world?",
    options: ["K2", "Mount Everest", "Kangchenjunga", "Lhotse"],
    correctAnswerIndex: 1,
    category: "General Knowledge",
  ),
];