import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/route/app_routes.dart';
import 'package:ecommerce_app/view_models/auth_cubit/auth_cubit.dart';
import 'package:ecommerce_app/view_models/cubit/profile/cubit/profile_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    final cubit = BlocProvider.of<ProfileCubit>(context);
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is ProfileLoaded ||
          current is ProfileError ||
          current is ProfileLoading,
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is ProfileError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is ProfileLoaded) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        cubit.img,
                      ),
                    ),
                    Positioned(
                      bottom: -3,
                      right: -5,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add_a_photo,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Hashim Saffarini',
                style: TextStyle(
                  color: AppColors.black.withOpacity(0.9),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                firebaseAuth.currentUser!.email.toString(),
                style: const TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 190,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: state.profile.length,
                  itemBuilder: (context, index) {
                    final item = state.profile[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 45,
                      ),
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            item.icon,
                            color: AppColors.primary,
                          ),
                        ),
                        title: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: const Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.grey,
                          ),
                        ),
                        onTap: index == state.profile.length - 1
                            ? () {
                                Navigator.of(context, rootNavigator: true)
                                    .pushReplacementNamed(AppRoutes.homeLogin);
                                authCubit.signOut();
                              }
                            : () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
