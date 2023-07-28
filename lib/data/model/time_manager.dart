import 'package:intl/intl.dart';

class TimeManager {
  // 게시글 작성 시간 계산하여 케이스별로 다르게 표시
  Map<String, String> convertWrittenTimeToFormat(String timeData) {
    String _formattedTime = ''; // 보여줄 작성 시간 형태
    DateTime _today = DateTime.now().toLocal(); // 오늘 시간
    DateTime _writtenDate = DateTime.parse(timeData).toLocal(); // 작성 시간

    // 흐른 시간에 따라 다르게 표시
    // ~1hr: N분 전
    int _dateDifferenceInMinutes = _today
        .difference(_writtenDate)
        .inMinutes; // 작성 시간으로부터 흐른 분
    if (_dateDifferenceInMinutes <= 60) {
      _formattedTime = '$_dateDifferenceInMinutes분 전';
    } else {
      // 1~24hr: N시간 전
      int _dateDifferenceInHours = _today
          .difference(_writtenDate)
          .inHours; // 작성 시간으로부터 흐른 시간
      if (_dateDifferenceInHours <= 24) {
        _formattedTime = '$_dateDifferenceInHours시간 전';
      } else {
        // 1~7D: N일 전
        int _dateDifferenceInDays = _today
            .difference(_writtenDate)
            .inDays; // 작성 시간으로부터 흐른 일수
        if (_dateDifferenceInDays <= 7) {
          _formattedTime = '$_dateDifferenceInDays일 전';
        } else if (_dateDifferenceInDays > 7 && _dateDifferenceInDays <= 70) {
          // 1~10W: N주 전
          _formattedTime = '${(_dateDifferenceInDays / 7).floor()}주 전';
        } else {
          // YYYY.MM.DD 표기
          _formattedTime = DateFormat('yyyy.MM.dd').format(_writtenDate);
        }
      }
    }
    return {'text': _formattedTime, 'dateTime': timeData};
  }
}