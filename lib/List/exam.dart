class ExamList {
  ExamList({
    required this.question,
    required this.option,
    required this.correctOption,
    this.selectedOptionIndex,
  });

  String correctOption;
  String question;
  List<OptionList> option;
  int? selectedOptionIndex;
}

class OptionList {
  OptionList({
    required this.selectedOption,
    required this.option,
  });

  String option;
  bool selectedOption;
}

List<ExamList> examList = [
  ExamList(
    correctOption:
        'B) The reaction is a chemical change because a new substance is formed and gas is released.',
    question:
        'During a science experiment, a student observes that when vinegar is added to baking soda, bubbles are produced, and the temperature of the mixture decreases. Based on this observation, which of the following conclusions can be made about the reaction?',
    option: [
      OptionList(
        option:
            'A) The reaction is a physical change because only bubbles are formed.',
        selectedOption: false,
      ),
      OptionList(
        option:
            'B) The reaction is a chemical change because a new substance is formed and gas is released.',
        selectedOption: false,
      ),
      OptionList(
        option:
            'C) The reaction is a physical change because the temperature change is temporary.',
        selectedOption: false,
      ),
      OptionList(
        option:
            'D) The reaction is neither physical nor chemical since no visible change occurs.',
        selectedOption: false,
      ),
    ],
  ),
  ExamList(
    correctOption: 'C) Solar Energy',
    question:
        'Which of the following is an example of a renewable energy source?',
    option: [
      OptionList(
        option: 'A) Coal',
        selectedOption: false,
      ),
      OptionList(
        option: 'B) Natural Gas',
        selectedOption: false,
      ),
      OptionList(
        option: 'C) Solar Energy',
        selectedOption: false,
      ),
      OptionList(
        option: 'D) Nuclear Energy',
        selectedOption: false,
      ),
    ],
  ),
  ExamList(
    correctOption: 'B) Energy production',
    question: 'What is the primary function of the mitochondria in a cell?',
    option: [
      OptionList(
        option: 'A) Protein synthesis',
        selectedOption: false,
      ),
      OptionList(
        option: 'B) Energy production',
        selectedOption: false,
      ),
      OptionList(
        option: 'C) Storing genetic information',
        selectedOption: false,
      ),
      OptionList(
        option: 'D) Transporting nutrients',
        selectedOption: false,
      ),
    ],
  ),
];
