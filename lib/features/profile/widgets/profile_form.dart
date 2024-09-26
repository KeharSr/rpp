import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class ProfileForm extends StatelessWidget {
  final TextEditingController fnameController;
  final TextEditingController lnameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController zipcodeController;
  final TextEditingController birthdateController;
  final String? profileImage;
  final String? selectedCountry;
  final String? selectedState;
  final String? selectedCity;
  final Function(String) onCountryChanged;
  final Function(String?) onStateChanged;
  final Function(String?) onCityChanged;
  final VoidCallback onSave;

  const ProfileForm({
    Key? key,
    required this.fnameController,
    required this.lnameController,
    required this.emailController,
    required this.phoneController,
    required this.addressController,
    required this.zipcodeController,
    required this.birthdateController,
    this.profileImage,
    this.selectedCountry,
    this.selectedState,
    this.selectedCity,
    required this.onCountryChanged,
    required this.onStateChanged,
    required this.onCityChanged,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 3),
                      image: DecorationImage(
                        image: AssetImage(profileImage ??
                            "assets/images/default_profile.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Iconsax.camera,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildTextField(fnameController, 'First Name', Iconsax.user),
            _buildTextField(lnameController, 'Last Name', Iconsax.user_add),
            _buildTextField(emailController, 'E-Mail', Iconsax.sms),
            _buildTextField(phoneController, 'Phone No', Iconsax.call),
            _buildTextField(addressController, 'Address', Iconsax.location),
            _buildTextField(zipcodeController, 'Zip Code', Iconsax.code),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: _buildTextField(
                      birthdateController, 'Birthdate', Iconsax.calendar),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Country & State',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blue),
                  ),
                  const SizedBox(height: 16),
                  CSCPicker(
                    showCities: true,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    onCountryChanged: onCountryChanged,
                    onStateChanged: onStateChanged,
                    onCityChanged: onCityChanged,
                    countryDropdownLabel: selectedCountry ?? "Select Country",
                    stateDropdownLabel: selectedState ?? "Select State",
                    cityDropdownLabel: selectedCity ?? "Select City",
                    dropdownHeadingStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    dropdownItemStyle:
                        const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: Icon(icon, color: Colors.red),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      birthdateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }
}
