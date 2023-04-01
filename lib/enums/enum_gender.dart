enum EnumGender {
  male(ko: '남자', initial: 'M'),
  female(ko: '여자', initial: 'F');

  final String ko;
  final String initial;

  const EnumGender({
    required this.ko,
    required this.initial,
  });
}
