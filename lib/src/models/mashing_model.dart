class MashingModel {
  final String title;
  final String image;
  final bool status;
  final String? workingHours;
  final String size;

  const MashingModel(
    this.title, {
    required this.image,
    required this.status,
    this.workingHours,
    required this.size,
  });
}
