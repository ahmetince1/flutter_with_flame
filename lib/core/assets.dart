/// Oyun varlıkları (resimler, sesler, animasyonlar) için yollar
class GameAssets {
  // Resim yolları
  static const String imagesPath = 'assets/images/';
  static const String playerSprite = '${imagesPath}player.svg';
  static const String enemySprite = '${imagesPath}enemy.svg';
  static const String backgroundSprite = '${imagesPath}background.svg';

  // Ses yolları
  static const String soundsPath = 'assets/sounds/';
  static const String backgroundMusic = '${soundsPath}background_music.mp3';
  static const String jumpSound = '${soundsPath}jump.wav';
  static const String collectSound = '${soundsPath}collect.wav';

  // Animasyon yolları
  static const String animationsPath = 'assets/animations/';
  static const String playerIdle = '${animationsPath}player_idle.json';
  static const String playerRun = '${animationsPath}player_run.json';
  static const String playerJump = '${animationsPath}player_jump.json';

  // Tüm varlıkları döndüren getter'lar
  static List<String> get allImages => [playerSprite, enemySprite, backgroundSprite];

  static List<String> get allSounds => [backgroundMusic, jumpSound, collectSound];

  static List<String> get allAnimations => [playerIdle, playerRun, playerJump];

  // Varlık var mı kontrol et
  static bool hasImage(String imageName) {
    return allImages.any((path) => path.contains(imageName));
  }

  static bool hasSound(String soundName) {
    return allSounds.any((path) => path.contains(soundName));
  }

  static bool hasAnimation(String animationName) {
    return allAnimations.any((path) => path.contains(animationName));
  }
}
