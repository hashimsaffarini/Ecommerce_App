import 'package:ecommerce_app/views/widgets/profile_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  String img = 'assets/images/me.jpg';
  ProfileCubit() : super(ProfileInitial());
  void getProfileData() async {
    emit(ProfileLoading());
    try {
      final profile = profileList;
      await Future.delayed(const Duration(seconds: 1));
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
