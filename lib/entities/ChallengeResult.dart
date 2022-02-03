class ChallengeResult {
  final String challengeType;
  final int correctAnswerCount;
  final int incorrectAnswerCount;
  final String resultColor;
  final String user;
  ChallengeResult(this.challengeType, this.correctAnswerCount,
      this.incorrectAnswerCount, this.resultColor, this.user);
}
