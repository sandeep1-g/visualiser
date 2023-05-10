class ProblemData {
  Map data = {};
  Map<String, double> problemtag = {};
  Map<String, int> problemrating = {};
  ProblemData({required this.data});
  void problemRating() {
    List len = data['result'];
    var se = <String>{};
    for (int i = 0; i < len.length; i++) {
      if (len[i]['verdict'] == 'OK' &&
          !se.contains(len[i]['problem']['contestId'].toString() +
              len[i]['problem']['index'].toString())) {
        se.add(len[i]['problem']['contestId'].toString() +
            len[i]['problem']['index'].toString());
        problemrating.update(
          len[i]['problem']['rating'].toString(),
          (value) => ++value,
          ifAbsent: () => 1,
        );
        for (int j = 0; j < len[i]['problem']['tags'].length; j++) {
          problemtag.update(
            len[i]['problem']['tags'][j].toString(),
            (value) => ++value,
            ifAbsent: () => 1.0,
          );
        }
      }
      problemrating.remove('null');
      problemrating = Map.fromEntries(problemrating.entries.toList()
        ..sort((e1, e2) => int.parse(e1.key).compareTo(int.parse(e2.key))));
    }
  }
}
