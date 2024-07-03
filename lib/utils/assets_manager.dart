class AssetsManager {
  static const String defaultIconsDirectory = "assets/icons";
  static const String defaultIcon = "default";
  static const ImageType defaultIconType = ImageType.svg;

  static String iconify(
    String icon, {
    String directory = defaultIconsDirectory,
    ImageType type = defaultIconType,
  }) {
    if (icon.isEmpty) {
      return "$defaultIconsDirectory/$defaultIcon.${defaultIconType.name}";
    }
    return "$directory/$icon.${type.name}";
  }

  static const String defaultImagesDirectory = "assets/images";
  static const String defaultImage = "default";
  static const ImageType defaultImageType = ImageType.png;

  static String imagify(
    String image, {
    String directory = defaultImagesDirectory,
    ImageType type = defaultImageType,
  }) {
    if (image.isEmpty) {
      return "$defaultImagesDirectory/$defaultImage.${defaultImageType.name}";
    }
    return "$directory/$image.${type.name}";
  }

  static String assetify(
    String file, {
    required directory,
    String? type,
  }) {
    return "$directory/$file.${type ?? ""}";
  }
}

enum ImageType { png, svg }
