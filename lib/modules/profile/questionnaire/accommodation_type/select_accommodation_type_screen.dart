import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/process_header_widget.dart';
import 'package:locallense/modules/profile/questionnaire/accommodation_type/select_accommodation_store.dart';
import 'package:locallense/modules/profile/questionnaire/flow_screens/widgets/questionnaire_flow_widget.dart';
import 'package:locallense/utils/common_widgets/ll_scaffold.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/enumeration.dart';

class SelectAccommodationTypeScreen extends StatelessObserverWidget {
  const SelectAccommodationTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.provide<SelectAccommodationStore>();
    return LLScaffold(
      appBarTitle:
          store.isEditScreen ? 'PG Questionnaire' : str.completeYourProfile,
      automaticallyImplyLeading: store.isEditScreen,
      backButtonVisibility: store.isEditScreen,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Observer(
              builder: (context) {
                return ProcessHeaderWidget(
                  title: str.pgReferenceForm,
                  step: store.currentPage,
                  totalStep: store.totalPage,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: store.pgQuestionState.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : store.pgQuestionState.isFailed
                      ? Center(
                          child: Column(
                            children: [
                              const Text('Something went wrong'),
                              LocalLensButton(
                                onTap: store.getPGQuestions,
                                btnText: 'Retry',
                                buttonType: ButtonType.secondaryButton,
                              ),
                            ],
                          ),
                        )
                      : PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          padEnds: false,
                          controller: store.pageController,
                          onPageChanged: store.onPageChanged,
                          children: List.generate(
                            store.pgForm.value.length,
                            (index) {
                              return QuestionnaireFlowWidget(
                                title: store.pgForm.value[index].text,
                                questionnaire: store.pgForm.value[index],
                                onTap: store.selectOption,
                              );
                            },
                          ),
                        ),
            ),
            LocalLensButton(
              onTap: store.nextPage,
              btnText: str.continueTxt,
              enabled: store.continueBtnEnabled,
              isLoading: store.submitPGQuestionState.isLoading,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
