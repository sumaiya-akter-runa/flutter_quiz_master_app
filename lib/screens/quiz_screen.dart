import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/dummy_question.dart';
import '../models/quiz_model.dart';
import '../core/constants.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswerIndex;
  List<QuizQuestion> questions = [];

  @override
  void initState() {
    super.initState();
    _resetQuiz();
  }

  void _resetQuiz() {
    questions = dummyQuestions.where((q) => q.category == widget.category).toList();
    if (questions.isEmpty) {
      questions = dummyQuestions;
    }
    currentQuestionIndex = 0;
    score = 0;
    selectedAnswerIndex = null;
  }

  void _selectAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });
  }

  Future<void> _nextQuestion() async {
    if (selectedAnswerIndex == questions[currentQuestionIndex].correctAnswerIndex) {
      score++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
      });
    } else {
      await _saveResult();
      if (mounted) {
        context.pushReplacement('/result', extra: {
          'score': score,
          'total': questions.length,
          'category': widget.category
        });
      }
    }
  }

  Future<void> _saveResult() async {
    final prefs = await SharedPreferences.getInstance();
    int totalAttempts = prefs.getInt(AppConstants.totalAttemptsKey) ?? 0;
    int highestScore = prefs.getInt(AppConstants.highestScoreKey) ?? 0;

    totalAttempts++;
    if (score > highestScore) highestScore = score;

    await prefs.setInt(AppConstants.totalAttemptsKey, totalAttempts);
    await prefs.setInt(AppConstants.highestScoreKey, highestScore);
    await prefs.setInt(AppConstants.lastScoreKey, score);

    // Important: Notify HomeScreen to refresh
    if (mounted) {
      // This will trigger refresh when returning to home
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
            ),
            const SizedBox(height: 20),
            Text(
              "Question ${currentQuestionIndex + 1} of ${questions.length}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Text(question.question, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 30),

            ...List.generate(question.options.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  onTap: () => _selectAnswer(index),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: selectedAnswerIndex == index ? Colors.deepPurple.withOpacity(0.2) : null,
                      border: Border.all(
                        color: selectedAnswerIndex == index ? Colors.deepPurple : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(question.options[index], style: const TextStyle(fontSize: 18)),
                  ),
                ),
              );
            }),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedAnswerIndex == null ? null : _nextQuestion,
                child: Text(
                  currentQuestionIndex == questions.length - 1 ? "Finish Quiz" : "Next Question",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}