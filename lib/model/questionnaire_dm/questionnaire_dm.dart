class QuestionnaireDm {
  QuestionnaireDm({
    required this.question,
    required this.optionDm,
    this.isFilterChipContent = false,
    this.isMultiSelected = false,
  });

  final String question;
  final List<OptionDm> optionDm;
  final bool isFilterChipContent;
  final bool isMultiSelected;
}

class OptionDm {
  OptionDm({
    required this.option,
    this.isSelected = false,
  });

  final String option;
  bool isSelected;
}
