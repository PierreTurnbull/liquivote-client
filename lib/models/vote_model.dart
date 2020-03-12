class NewVote {
  final bool value;
  final int postId;

  NewVote({ this.value, this.postId });
}

class Vote {
  final int id;
  bool value;

  Vote({ this.id, this.value });

  factory Vote.fromObject(Map<String, dynamic> object) {
    if (object == null) { return null; }
    return Vote(
      id: object['id'],
      value: object['value'],
    );
  }
}