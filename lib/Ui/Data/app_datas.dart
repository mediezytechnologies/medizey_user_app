final List loginScreenImages = [
  "assets/images/login image one.jpg",
  "assets/images/login image two.jpg",
  "assets/images/login image three.jpg"
];

final List locations = [
  "Thiruvananthapuram",
  "Kollam",
  "Alappuzha",
  "Pathanamthitta",
  "Kottayam",
  "Idukki",
  "Ernakulam",
  "Thrissur",
  "Palakkad",
  "Malappuram",
  "Kozhikode",
  "Wayanad",
  "Kannur",
  "Kasaragod"
];

//* health record
List<String> treatmentTypes = [
  "Pneumonia",
  "Tuberculosis",
  "Asthma",
  "Covid",
  "No",
  "Other"
];

List<String> dustAlleryTypes = ["Skin", "Cold"];

List<String> surgeryTypes = [
  "Angiogram",
  "Appendectomy",
  "Open Heart Surgery",
  "Fracture",
  "RGP-Stenting",
  "No",
  "Other"
];

class MedicineData {
  String medicineName;
  String illnessName;

  MedicineData({required this.medicineName, required this.illnessName});
}
