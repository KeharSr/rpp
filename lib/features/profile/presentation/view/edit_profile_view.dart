import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/features/auth/domain/entity/auth_entity.dart';
import 'package:rpp/features/profile/presentation/view/profile_view.dart';
import 'package:rpp/features/profile/presentation/view_model/current_user_view_model.dart';
import 'package:rpp/features/profile/widgets/profile_form.dart';

import '../../../../app/theme/theme_data/theme_data.dart';

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
  late TextEditingController addressController;
  late TextEditingController zipcodeController;
  late TextEditingController birthdateController;

  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  String? profileImage = "assets/images/default_profile.png";

  @override
  void initState() {
    super.initState();

    fnameController = TextEditingController();
    lnameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    zipcodeController = TextEditingController();
    birthdateController = TextEditingController();

    final state = ref.read(currentUserViewModelProvider);
    fnameController.text = state.authEntity?.firstName ?? '';
    lnameController.text = state.authEntity?.lastName ?? '';
    emailController.text = state.authEntity?.email ?? '';
    phoneController.text = state.authEntity?.phone ?? '';
    addressController.text = state.authEntity?.address ?? '';
    zipcodeController.text = state.authEntity?.zipCode ?? '';
    birthdateController.text = state.authEntity?.birthday ?? '';

    // Extract the country name without emoji or codes
    String? country = state.authEntity?.country;
    selectedCountry = country?.split(RegExp(r'\s+')).last ?? "Select Country";
    selectedState =
        state.authEntity?.state ?? "Select State"; // Set state from data
    selectedCity = state.authEntity?.city ?? "Select City";
  }

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    zipcodeController.dispose();
    birthdateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final theme = isDarkMode ? KAppTheme.darkTheme : KAppTheme.lightTheme;

    print('Selected Country: $selectedCountry');
    print('Selected State: $selectedState');
    print('Selected City: $selectedCity');

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: theme.appBarTheme.iconTheme?.color),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileView())),
          ),
          title:
              Text('Update Profile', style: theme.appBarTheme.titleTextStyle),
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
                  Builder(builder: (context) {
                    return ProfileForm(
                      fnameController: fnameController,
                      lnameController: lnameController,
                      emailController: emailController,
                      phoneController: phoneController,
                      addressController: addressController,
                      zipcodeController: zipcodeController,
                      birthdateController: birthdateController,
                      profileImage: profileImage,
                      selectedCountry: selectedCountry,
                      selectedState: selectedState,
                      selectedCity: selectedCity,
                      onCountryChanged: (country) {
                        setState(() {
                          selectedCountry = country;
                          selectedState =
                              null; // Reset state when country changes
                          selectedCity =
                              'Select City'; // Reset city when country changes
                        });
                      },
                      onStateChanged: (state) {
                        setState(() {
                          selectedState = state;
                        });
                      },
                      onCityChanged: (city) {
                        setState(() {
                          selectedCity = city;
                        });
                      },
                      onSave: () {
                        ref
                            .read(currentUserViewModelProvider.notifier)
                            .updateUser(
                              AuthEntity(
                                id: ref
                                    .read(currentUserViewModelProvider)
                                    .authEntity!
                                    .id,
                                firstName: fnameController.text,
                                lastName: lnameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                address: addressController.text,
                                zipCode: zipcodeController.text,
                                birthday: birthdateController.text,
                                country:
                                    selectedCountry, // Save selected country
                                state: selectedState,
                                city: selectedCity,
                              ),
                            );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
