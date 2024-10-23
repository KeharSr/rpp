import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rpp/app/constants/colors.dart';
import 'package:rpp/features/auth/domain/entity/auth_entity.dart';

class ProfileDetails extends StatelessWidget {
  final AuthEntity authEntity; // Specify the exact type if possible
  final WidgetRef ref;
  final VoidCallback onMyCartTap;
  final VoidCallback onMyOrdersTap;

  const ProfileDetails({
    required this.authEntity,
    required this.ref,
    super.key,
    required this.onMyCartTap,
    required this.onMyOrdersTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Title(
            color: Colors.black,
            child: Text('Account',
                style: Theme.of(context).textTheme.headlineSmall)),
        ListTile(
          leading: const Icon(Iconsax.money3, color: TColors.primary),
          title: const Text('Donation',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.shopping_cart, color: TColors.primary),
          title: const Text('My Cart',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: const Icon(Icons.chevron_right),
          onTap: onMyCartTap,
        ),
        ListTile(
          leading: const Icon(Iconsax.shopping_bag, color: TColors.primary),
          title: const Text('My Orders',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: const Icon(Icons.chevron_right),
          onTap: onMyOrdersTap,
        ),
        ListTile(
          leading: const Icon(Iconsax.bank, color: TColors.primary),
          title: const Text('Bank Account',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.ticket, color: TColors.primary),
          title: const Text('My Coupons',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.notification, color: TColors.primary),
          title: const Text('Notifications',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.shield_tick, color: TColors.primary),
          title: const Text('Account Privacy',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        const SizedBox(height: 24),
        Text('App Settings', style: Theme.of(context).textTheme.bodyLarge),
        ListTile(
          leading: const Icon(Iconsax.cloud_add, color: TColors.primary),
          title: const Text('Load Data',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.map, color: TColors.primary),
          title: const Text('Geolocation',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: Switch(value: true, onChanged: (_) {}),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.language_circle, color: TColors.primary),
          title: const Text('Language',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.security, color: TColors.primary),
          title: const Text('Safe Mode',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: Switch(value: false, onChanged: (_) {}),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.image, color: TColors.primary),
          title: const Text('HD Image Quality',
              style: TextStyle(color: TColors.textPrimary)),
          trailing: Switch(value: false, onChanged: (_) {}),
          onTap: () {},
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: TColors.white,
            backgroundColor: TColors.primary,
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
