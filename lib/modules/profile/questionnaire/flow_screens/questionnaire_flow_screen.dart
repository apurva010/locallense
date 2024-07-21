import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/process_header_widget.dart';
import 'package:locallense/modules/profile/questionnaire/flow_screens/questionnaire_flow_store.dart';
import 'package:locallense/modules/profile/questionnaire/flow_screens/widgets/questionnaire_flow_widget.dart';
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
    store.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 44,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 36.5,
              ),
              child: Center(
                child: Text(
                  str.completeYourProfile,
                  style: context.textStyleTheme.bodyXLargeSemiBold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Observer(
              builder: (context) {
                return ProcessHeaderWidget(
                  title: store.questionnaireFlowName,
                  step: store.currentPage,
                  totalStep: store.totalPage,
                );
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
                  store.questionnaire.length,
                  (index) {
                    final questionnaire = store.questionnaire;
                    return QuestionnaireFlowWidget(
                      title: questionnaire[index].value.question,
                      questionnaire: questionnaire[index].value,
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
