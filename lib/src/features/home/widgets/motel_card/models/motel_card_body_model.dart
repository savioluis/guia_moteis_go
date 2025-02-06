class MotelCardBodyModel {
  final String photoUrl;
  final String suiteName;
  final int remainingAmout;
  final List<String> categoriesImagesUrls;

  MotelCardBodyModel({
    required this.photoUrl,
    required this.suiteName,
    required this.remainingAmout,
    required this.categoriesImagesUrls,
  });
}
