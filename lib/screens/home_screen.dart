import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/theme_provider.dart';
import '../core/constants.dart';
import '../data/dummy_question.dart';
import '../widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalAttempts = 0;
  int highestScore = 0;
  int lastScore = 0;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  // This is the key - it will refresh when returning from quiz
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadStats();
  }

  Future<void> _loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        totalAttempts = prefs.getInt(AppConstants.totalAttemptsKey) ?? 0;
        highestScore = prefs.getInt(AppConstants.highestScoreKey) ?? 0;
        lastScore = prefs.getInt(AppConstants.lastScoreKey) ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Master"),
        actions: [
          IconButton(
            icon: Icon(themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadStats,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome to Quiz Master!", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const Text("Test your knowledge and improve your learning skills.", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 30),

              const Text("Your Statistics", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildStatCard("Attempts", totalAttempts.toString()),
                  const SizedBox(width: 8),
                  _buildStatCard("Highest", "$highestScore/10"),
                  const SizedBox(width: 8),
                  _buildStatCard("Last", "$lastScore/10"),
                ],
              ),

              const SizedBox(height: 30),
              const Text("Categories", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.05,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final categories = ["Sports", "Science", "Technology", "History", "General Knowledge"];
                  final icons = [Icons.sports_basketball, Icons.science, Icons.computer, Icons.history, Icons.psychology];

                  return CategoryCard(
                    title: categories[index],
                    icon: icons[index],
                    questionCount: dummyQuestions.where((q) => q.category == categories[index]).length,
                    onTap: () => context.push('/quiz/${categories[index]}'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)],
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}