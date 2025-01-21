## Bottom Sheet

### Integrate with Design
```dart
void bottomSheet2() {
  Get.bottomSheet(
    Container(
      height: 400.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffFEFEFE), // Correctly set color here
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), // Curving the top left corner
          topRight: Radius.circular(20), // Curving the top right corner
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
        child: Column(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Container(
              height: 5.h,
              width: 60.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: Color(0xffE3E9ED)),
            ),
            SizedBox(
              height: 32,
            ),
            CustomizableText(
              title: "Filter By",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              colors: Color(0xff2D2D2D),
            ),
            SizedBox(
              height: 32.0,
            ),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
```
