class PollItem {
 final String question;
  final List<String> options;
  final Map<String, int> votes;
  bool? allowMultipleAnswerts;
  PollItem( {
    required this.question,
    required this.options,
    Map<String, int>? votes,
    required bool allowMultipleAnswers,
  }) : votes = votes ?? {};



  void voteForOption(String option) {
    votes[option] = (votes[option] ?? 0) + 1;
  }

  @override
  String toString() {
    return '$question|${options.join(',')}|${votes.entries.map((e) => '${e.key}:${e.value}').join(',')}';
  }

  static PollItem fromString(String data) {
    final parts = data.split('|');
    final question = parts[0];
    final options = parts[1].split(',');
    final votes = parts[2].split(',').fold<Map<String, int>>({}, (map, pair) {
      final kv = pair.split(':');
      map[kv[0]] = int.parse(kv[1]);
      return map;
    });

    return PollItem(
        question: question,
        options: options,
        votes: votes,
        allowMultipleAnswers: false);
  }
}
