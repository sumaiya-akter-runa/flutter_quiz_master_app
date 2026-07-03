class UserStats {
  final int totalAttempts;
  final int highestScore;
  final int lastScore;
  final List<String> history;

  UserStats({
    this.totalAttempts = 0,
    this.highestScore = 0,
    this.lastScore = 0,
    this.history = const [],
  });

  UserStats copyWith({
    int? totalAttempts,
    int? highestScore,
    int? lastScore,
    List<String>? history,
  }) {
    return UserStats(
      totalAttempts: totalAttempts ?? this.totalAttempts,
      highestScore: highestScore ?? this.highestScore,
      lastScore: lastScore ?? this.lastScore,
      history: history ?? this.history,
    );
  }
}