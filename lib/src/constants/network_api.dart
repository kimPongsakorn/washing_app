class NetworkAPI {
  static const String baseURL =
      'http://student.crru.ac.th/601463027/blackend_washing';

  static const String register = '/user/post.php';
  static const String login = '/user/login.php';
  static const String home = '/washing/get.php';
  static const String payment = '/washing/payment.php';
  static const String cancel = '/washing/cancel.php';

  static const String baseLineURL = 'https://notify-api.line.me/api';
  static const String notify = '/notify';
}
