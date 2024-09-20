// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:rpp/app/theme/theme_data/theme_data.dart';
// import 'package:rpp/features/auth/domain/entity/auth_entity.dart';
// import 'package:rpp/features/profile/presentation/view_model/current_user_view_model.dart';

// class EditProfileView extends ConsumerStatefulWidget {
//   const EditProfileView({super.key});

//   @override
//   _EditProfileViewState createState() => _EditProfileViewState();
// }

// class _EditProfileViewState extends ConsumerState<EditProfileView> {
//   late TextEditingController fnameController;
//   late TextEditingController lnameController;
//   late TextEditingController emailController;
//   late TextEditingController phoneController;
//   late TextEditingController usernameController;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize the controllers with empty strings initially
//     fnameController = TextEditingController();
//     lnameController = TextEditingController();
//     emailController = TextEditingController();
//     phoneController = TextEditingController();
//     usernameController = TextEditingController();

//     // Set the initial values after the controllers are initialized
//     final state = ref.read(currentUserViewModelProvider);
//     fnameController.text = state.authEntity?.firstName ?? '';
//     lnameController.text = state.authEntity?.lastName ?? '';
//     emailController.text = state.authEntity?.email ?? '';
//     phoneController.text = state.authEntity?.phone ?? '';
//     usernameController.text = state.authEntity?.address ?? '';
//   }

//   @override
//   void dispose() {
//     fnameController.dispose();
//     lnameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     usernameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final brightness = MediaQuery.of(context).platformBrightness;
//     final isDarkMode = brightness == Brightness.dark;
//     final theme = isDarkMode ? KAppTheme.darkTheme : KAppTheme.lightTheme;

//     return Theme(
//       data: theme,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back,
//                 color: theme.appBarTheme.iconTheme?.color),
//             onPressed: () => Navigator.pop(context),
//           ),
//           title: Text(
//             'Update Profile',
//             style: theme.appBarTheme.titleTextStyle,
//           ),
//           backgroundColor: theme.appBarTheme.backgroundColor,
//           elevation: theme.appBarTheme.elevation,
//         ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 40),
//                   _buildForm(theme),
//                   const SizedBox(height: 20),
//                   _buildSaveButton(theme),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildForm(ThemeData theme) {
//     return Column(
//       children: [
//         _buildTextField(
//             icon: Icons.person,
//             hintText: 'First Name',
//             controller: fnameController,
//             theme: theme),
//         const SizedBox(height: 20),
//         _buildTextField(
//             icon: Icons.person,
//             hintText: 'Last Name',
//             controller: lnameController,
//             theme: theme),
//         const SizedBox(height: 20),
//         _buildTextField(
//             icon: Icons.email,
//             hintText: 'E-Mail',
//             controller: emailController,
//             theme: theme),
//         const SizedBox(height: 20),
//         _buildTextField(
//             icon: Icons.phone,
//             hintText: 'Phone No',
//             controller: phoneController,
//             theme: theme),
//         const SizedBox(height: 20),
//         _buildTextField(
//             icon: Icons.person,
//             hintText: 'Username',
//             controller: usernameController,
//             theme: theme),
//       ],
//     );
//   }

//   Widget _buildTextField({
//     required IconData icon,
//     required String hintText,
//     required TextEditingController controller,
//     required ThemeData theme,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: theme.iconTheme.color),
//         hintText: hintText,
//       ),
//     );
//   }

//   Widget _buildSaveButton(ThemeData theme) {
//     return ElevatedButton(
//       onPressed: () {
//         ref.read(currentUserViewModelProvider.notifier).updateUser(
//               AuthEntity(
//                 id: ref.read(currentUserViewModelProvider).authEntity!.id,
//                 firstName: fnameController.text,
//                 lastName: lnameController.text,
//                 email: emailController.text,
//                 phone: phoneController.text,
//               ),
//             );
//       },
//       style: theme.elevatedButtonTheme.style,
//       child: const Text('Save Changes'),
//     );
//   }
// }

import 'package:csc_picker/csc_picker.dart'; // Import the csc_picker package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/app/theme/theme_data/theme_data.dart';
import 'package:rpp/features/auth/domain/entity/auth_entity.dart';
import 'package:rpp/features/profile/presentation/view_model/current_user_view_model.dart';

class EditProfileView extends ConsumerStatefulWidget {
  const EditProfileView({super.key});

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends ConsumerState<EditProfileView> {
  late TextEditingController fnameController;
  late TextEditingController lnameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController usernameController;

  String? selectedCountry; // Initialize without default value
  String? selectedState; // Initialize without default value

  @override
  void initState() {
    super.initState();

    // Initialize the controllers with empty strings initially
    fnameController = TextEditingController();
    lnameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    usernameController = TextEditingController();

    // Set the initial values after the controllers are initialized
    final state = ref.read(currentUserViewModelProvider);
    fnameController.text = state.authEntity?.firstName ?? '';
    lnameController.text = state.authEntity?.lastName ?? '';
    emailController.text = state.authEntity?.email ?? '';
    phoneController.text = state.authEntity?.phone ?? '';
    usernameController.text = state.authEntity?.address ?? '';

    // Set initial country and state if available
    selectedCountry = state.authEntity?.country;
    selectedState = state.authEntity?.state;
  }

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final theme = isDarkMode ? KAppTheme.darkTheme : KAppTheme.lightTheme;

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: theme.appBarTheme.iconTheme?.color),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Update Profile',
            style: theme.appBarTheme.titleTextStyle,
          ),
          backgroundColor: theme.appBarTheme.backgroundColor,
          elevation: theme.appBarTheme.elevation,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  _buildForm(theme),
                  const SizedBox(height: 20),
                  _buildCSCPicker(), // CSC Picker for country and state
                  const SizedBox(height: 20),
                  _buildSaveButton(theme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(ThemeData theme) {
    return Column(
      children: [
        _buildTextField(
          icon: Icons.person,
          hintText: 'First Name',
          controller: fnameController,
          theme: theme,
        ),
        const SizedBox(height: 20),
        _buildTextField(
          icon: Icons.person,
          hintText: 'Last Name',
          controller: lnameController,
          theme: theme,
        ),
        const SizedBox(height: 20),
        _buildTextField(
          icon: Icons.email,
          hintText: 'E-Mail',
          controller: emailController,
          theme: theme,
        ),
        const SizedBox(height: 20),
        _buildTextField(
          icon: Icons.phone,
          hintText: 'Phone No',
          controller: phoneController,
          theme: theme,
        ),
        const SizedBox(height: 20),
        _buildTextField(
          icon: Icons.person,
          hintText: 'Username',
          controller: usernameController,
          theme: theme,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hintText,
    required TextEditingController controller,
    required ThemeData theme,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: theme.iconTheme.color),
        hintText: hintText,
      ),
    );
  }

  // CSC Picker Widget for selecting country and state
  Widget _buildCSCPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Country & State',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        CSCPicker(
          showCities: false, // Disable city selection if it's not required
          onCountryChanged: (country) {
            setState(() {
              selectedCountry = country; // Update selected country
              selectedState = null; // Reset state when country changes
              // Print statements for debugging
              print('Selected Country: $selectedCountry');
            });
          },
          onStateChanged: (state) {
            setState(() {
              selectedState = state; // Update selected state
              // Print statements for debugging
              print('Selected State: $selectedState');
            });
          },
          countryDropdownLabel: selectedCountry ?? "Select Country",
          stateDropdownLabel: selectedState ?? "Select State",
          dropdownHeadingStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          dropdownItemStyle: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildSaveButton(ThemeData theme) {
    return ElevatedButton(
      onPressed: () {
        // Ensure country and state are selected before saving
        if (selectedCountry == null || selectedState == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select a country and state')),
          );
          return;
        }

        ref.read(currentUserViewModelProvider.notifier).updateUser(
              AuthEntity(
                id: ref.read(currentUserViewModelProvider).authEntity!.id,
                firstName: fnameController.text,
                lastName: lnameController.text,
                email: emailController.text,
                phone: phoneController.text,
                country: selectedCountry, // Save selected country
                state: selectedState, // Save selected state
              ),
            );
      },
      style: theme.elevatedButtonTheme.style,
      child: const Text('Save Changes'),
    );
  }
}
