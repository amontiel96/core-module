

class TokenPushNotificationModel{
  final String clientId;
  final String token;
  final String phone;
  final String os;

  const TokenPushNotificationModel({
    required this.clientId,
    required this.token,
    required this.phone,
    required this.os,
  });

  factory TokenPushNotificationModel.withCountry({
    required String clientId,
    required String token,
    required String phone,
    required String os,
    required String countryCode,
  }) =>
      TokenPushNotificationModel(
        clientId: '$clientId-$countryCode',
        token: token,
        phone: phone,
        os: os,
      );

  Map<String, dynamic> toJson() =>
      {'clientId': clientId, 'token': token, 'phone': phone, 'os': os};

  @override
  List<Object?> get props => [clientId, token, phone, os];
}
