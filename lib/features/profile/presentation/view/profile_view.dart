import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rpp/app/constants/colors.dart';
import 'package:rpp/features/profile/presentation/view/edit_profile_view.dart';
import 'package:rpp/features/profile/presentation/view_model/current_user_view_model.dart';
import 'package:rpp/features/profile/widgets/my_curved_edges.dart';
import 'package:rpp/features/profile/widgets/my_profile_view.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(currentUserViewModelProvider.notifier).getCurrentUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUserState = ref.watch(currentUserViewModelProvider);
    final theme = Theme.of(context);

    if (currentUserState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (currentUserState.authEntity == null) {
      return const Center(child: Text('No user found'));
    } else {
      final authEntity = currentUserState.authEntity!;

      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: MyCurvedEdges(),
                    child: Container(
                      height: 260,
                      color: TColors.primary,
                    ),
                  ),
                  const Positioned(
                    top: 40,
                    left: 16,
                    child: Text(
                      'My Profile',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: TColors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 16,
                    child: IconButton(
                      icon: const Icon(Iconsax.edit, color: TColors.white),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const EditProfileView();
                          },
                        ));
                      },
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 16,
                    right: 16,
                    child: Column(
                      children: [
                        // Removed CircleAvatar with profilePicture reference
                        const SizedBox(height: 8),
                        Text(
                          '${authEntity.firstName} ${authEntity.lastName}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: TColors.white,
                          ),
                        ),
                        Text(
                          authEntity.email,
                          style: TextStyle(
                            fontSize: 14,
                            color: TColors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProfileDetails(
                  authEntity: authEntity,
                  ref: ref,
                  onMyCartTap: () {},
                  onMyOrdersTap: () {},
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
