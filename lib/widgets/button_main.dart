import '../../config.dart';

class ButtonMain extends StatelessWidget {
  final String title;
  final double? padding, margin, radius, height, fontSize, width;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final Color color, fontColor;
  final Widget? icon;
  final VoidCallback? onPressed;
  final FontWeight? fontWeight;

  const ButtonMain(
      {super.key,
      required this.title,
      this.padding,
      this.margin = 0,
      this.radius = AppRadius.r2,
      this.height = 60,
      this.fontSize = FontSizes.f30,
      this.onTap,
      this.style,
      required this.color,
      this.onPressed,
      required this.fontColor,
      this.icon,
      this.width,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: height,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(color),
                shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))))),
            onPressed: onPressed,
            child: Text(
              title,
              style: appCss.jakartaMedium16.textColor(fontColor),
            )));
  }
}
