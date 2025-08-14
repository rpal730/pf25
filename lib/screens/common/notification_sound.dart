import 'package:web/web.dart' as web;

void playNotificationSound() {
  final audio = web.HTMLAudioElement()
    ..src = 'assets/sounds/notification_sound.wav'
    ..autoplay = true;
  audio.play();
}