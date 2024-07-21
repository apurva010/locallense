import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/process_header_widget.dart';
import 'package:locallense/modules/profile/questionnaire/flow_screens/questionnaire_flow_store.dart';
import 'package:locallense/modules/profile/questionnaire/flow_screens/widgets/questionnaire_flow_widget.dart';
import 'package:locallense/utils/common_widgets/ll_scaffold.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';

class QuestionnaireFlowScreen extends StatefulObserverWidget {
  const QuestionnaireFlowScreen({super.key});

  @override
  State<QuestionnaireFlowScreen> createState() =>
      _QuestionnaireFlowScreenState();
}

class _QuestionnaireFlowScreenState extends State<QuestionnaireFlowScreen> {
  late QuestionnaireFlowStore store;

  @override
  void initState() {
    store = context.provide<QuestionnaireFlowStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LLScaffold(
      automaticallyImplyLeading: false,
      backButtonVisibility: false,
      appBarTitle: str.completeYourProfile,
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
                if (store.totalPage > 0) {
                  return ProcessHeaderWidget(
                    title: store.questionnaireFlowName,
                    step: store.currentPage,
                    totalStep: store.totalPage,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: store.pageController,
                onPageChanged: store.onPageChanged,
                children: List.generate(
                  store.questionnaire.value.length,
                  (index) {
                    final questionnaire = store.questionnaire;
                    return QuestionnaireFlowWidget(
                      title: questionnaire.value[index].text,
                      questionnaire: questionnaire.value[index],
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
              isLoading: store.submitQuestionnaireState.isLoading,
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
