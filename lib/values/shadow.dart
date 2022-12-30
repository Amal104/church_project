part of values;

class Shadows {
  static const BoxShadow containerShadow = BoxShadow(
    color: AppColor.grey400,
    offset: Offset(5.0, 10.0),
    blurRadius: 10.0,
    spreadRadius: 0.0,
  );

  static customContainerShadow({
    Color color = AppColor.grey100,
    Offset offset = const Offset(0.0, 1.0),
    double blurRadius = 4.0,
  }) {
    return BoxShadow(
      color: color,
      offset: offset,
      blurRadius: blurRadius,
    );
  }
}
