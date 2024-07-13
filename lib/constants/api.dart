class ApiUrls {
  static String endpoint = 'https://doss-api.azurewebsites.net/api/v1/';
  static String getTicket = "${endpoint}ticket/residential/exist";
  static String generateTicket = "${endpoint}ticket";
  static String verificationChatMsgURL =
      'verification-request/chat/messages?ResidentialVerificationRequestId=';
  static String verificationchatURL = 'verification-request/chat';
  static String verificationAllURL = 'verification-request/all?';
}
