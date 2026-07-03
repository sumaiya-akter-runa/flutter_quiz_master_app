import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as Map<String, dynamic>? ?? {};
    final int score = args['score'] ?? 0;
    final int total = args['total'] ?? 10;
    final int wrong = total - score;
    final double percentage = total > 0 ? (score / total) * 100 : 0;
    final String category = args['category'] ?? 'General Knowledge';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Result"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                percentage >= 80 ? Icons.emoji_events : Icons.sentiment_satisfied,
                size: 100,
                color: percentage >= 70 ? Colors.amber : Colors.deepPurple,
              ),
              const SizedBox(height: 20),

              Text(
                "Your Result",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              _buildMetricRow("Total Questions", total.toString(), context),
              _buildMetricRow("Correct Answers", score.toString(), context),
              _buildMetricRow("Wrong Answers", wrong.toString(), context),
              _buildMetricRow("Final Score", "$score / $total", context, isHighlight: true),
              _buildMetricRow("Percentage", "${percentage.toStringAsFixed(0)}%", context, isHighlight: true),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.go('/'), // Back to Home
                      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                      child: const Text("Back to Home"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Play Again - Same Category এ নতুন করে শুরু
                        context.pushReplacement('/quiz/$category');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text("Play Again"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricRow(String label, String value, BuildContext context, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 18)),
          Text(
            value,
            style: TextStyle(
              fontSize: isHighlight ? 26 : 20,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.w600,
              color: isHighlight ? Colors.deepPurple : null,
            ),
          ),
        ],
      ),
    );
  }
}