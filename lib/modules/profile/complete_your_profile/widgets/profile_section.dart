import 'package:cached_network_image/cached_network_image.dart';
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
                  return store.profilePicture != null
                      ? CachedNetworkImage(
                          imageUrl: store.profilePicture!,
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) =>
                              Assets.images.user.image(),
                        )
                      : Assets.images.user.image();
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Form(
          key: store.formKey,
          child: Column(
            children: [
              LocalLensTextFormField(
                borderRadius: 10,
                label: 'First Name',
                controller: store.firstNameController,
                maxLength: Constants.maxLengthOfName,
                validator: CommonValidator.nameValidator,
              ),
              const SizedBox(
                height: 16,
              ),
              LocalLensTextFormField(
                borderRadius: 10,
                label: 'Last Name',
                controller: store.lastNameController,
                maxLength: Constants.maxLengthOfName,
                validator: CommonValidator.nameValidator,
              ),
              const SizedBox(
                height: 16,
              ),
              LocalLensTextFormField(
                borderRadius: 10,
                label: 'Email',
                maxLength: Constants.maxLengthOfEmail,
                initialText: store.emailAddress,
                validator: CommonValidator.emailValidator,
                enabled: false,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
