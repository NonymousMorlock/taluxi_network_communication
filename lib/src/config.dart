abstract class Config {
  const Config();

  static const oneSignalAppId = String.fromEnvironment('ONESIGNAL_APP_ID') ;
  /*'d93dc82d-6190-457a-bd68-ff5960ffc979'*/
  static const agoraAppId = String.fromEnvironment('AGORA_APP_ID') /*'0f1cac7cc1d14e048f633fee05875c34'*/;
}
