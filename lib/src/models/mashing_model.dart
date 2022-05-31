class MashingModel {
  final String title;
  final String image;
  final String? workingHours;
  final String size;

  const MashingModel(
    this.title, {
    required this.image,
    this.workingHours,
    required this.size,
  });
}
