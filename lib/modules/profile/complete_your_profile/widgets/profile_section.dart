import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/profile/complete_your_profile/basic_details_store.dart';
import 'package:locallense/utils/common_validator/common_validator.dart';
import 'package:locallense/utils/common_widgets/ll_text_form_field.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/constants.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final store = context.provide<BasicDetailsStore>();
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              InkWell(
                onTap: store.pickProfilePic,
                splashFactory: NoSplash.splashFactory,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        100,
                      ),
                    ),
                    child: Observer(
                      builder: (context) {
                        if (store.profileState.isLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: context.themeColor.primaryColor2,
                            ),
                          );
                        }

                        return store.profilePicture != null
                            ? Image.file(
                                store.profilePicture!,
                                fit: BoxFit.fill,
                              )
                            : Assets.images.user.image();
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 1,
                bottom: 2,
                child: Container(
                  height: 26,
                  width: 28,
                  decoration: BoxDecoration(
                    color: context.themeColor.primaryColor2,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                  ),
                  child: IconButton(
                    onPressed: store.pickProfilePic,
                    splashRadius: 1,
                    padding: const EdgeInsets.all(2),
                    icon: const Icon(
                      Icons.edit,
                      size: 18,
                    ),
                    color: context.themeColor.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Form(
          key: store.formKey,
          child: Column(
            children: [
              const LocalLensTextFormField(
                borderRadius: 10,
                label: 'Full name',
                maxLength: Constants.maxLengthOfName,
                validator: CommonValidator.nameValidator,
              ),
              const SizedBox(
                height: 16,
              ),
              const LocalLensTextFormField(
                borderRadius: 10,
                label: 'Email',
                maxLength: Constants.maxLengthOfEmail,
                validator: CommonValidator.emailValidator,
              ),
              const SizedBox(
                height: 16,
              ),
              LocalLensTextFormField(
                borderRadius: 10,
                label: 'Date of birth',
                controller: store.datePickerController,
                validator: CommonValidator.dateOfBirthValidator,
                readOnly: true,
                onTap: () => store.onTapFunction(context: context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
