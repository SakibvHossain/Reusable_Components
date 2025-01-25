# Range Slider

### Controller
```dart
// Controller to manage slider values using GetX
class PriceSliderController extends GetxController {
  var lowerValue = 0.0.obs;
  var upperValue = 80.0.obs;

  void updateValues(RangeValues values) {
    lowerValue.value = values.start;
    upperValue.value = values.end;
  }
}
```

### Design Implementation
```dart
// Design Implementation
class PriceSliderWidget extends StatelessWidget {
  const PriceSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PriceSliderController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Price',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₦${controller.lowerValue.toInt()}-\$${controller.upperValue.toInt()}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black38,
              ),
            ),
          ],
        )),
        const SizedBox(height: 4),
        Obx(() => SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.blue.shade900,
            inactiveTrackColor: Colors.grey.shade300,
            trackHeight: 3,
            thumbColor: Colors.blue.shade900,
            overlayColor: Colors.blue.withOpacity(0.1),
            rangeThumbShape: const CustomThumbShape(),
          ),
          child: RangeSlider(
            min: 0,
            max: 100,
            values: RangeValues(
              controller.lowerValue.value,
              controller.upperValue.value,
            ),
            divisions: 100,
            onChanged: (values) {
              controller.updateValues(values);
            },
          ),
        )),
      ],
    );
  }
}
```

### Paint the thumb shape
```dart
// Paint the thumb shape
class CustomThumbShape extends RangeSliderThumbShape {
  final double thumbRadius;

  const CustomThumbShape({this.thumbRadius = 10});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        bool isDiscrete = false,
        bool isEnabled = true,
        bool isOnTop = false,
        bool isPressed = false,
        required SliderThemeData sliderTheme,
        TextDirection textDirection = TextDirection.ltr,
        Thumb? thumb,
      }) {
    final Canvas canvas = context.canvas;

    // Draw the outer blue circle
    final Paint outerPaint = Paint()
      ..color = Colors.blue.shade900
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, outerPaint);

    // Draw the inner white circle
    final Paint innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius * 0.6, innerPaint);
  }
}
```
