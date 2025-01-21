## Slider

### Slider with Getx

#### Getx
```dart
class DistanceController extends GetxController {
  var distance = 1.0.obs; // Initial value set to 1.0 miles

  // Method to change the value of distance
  void changeDistance(double value) {
    distance.value = value;
  }
}
```

#### Integrate with Design
Text change based on slider change

```dart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Distance',
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff171725)),
                ),
              
                // Here text changing 
                Obx(() {
                  // Dynamically update the text based on the slider value
                  return Text(
                    '${controller.distance.value.toStringAsFixed(1)} miles - 10miles',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff636F85),
                    ),
                  );
                }),
              ],
            ),
            
            SizedBox(
              height: 4.0,
            ),

            //*Slider to change
            Obx(() {
              return SliderTheme(
                data: SliderThemeData(
                  trackHeight: 4.0,
                  // Decrease the height of the slider's track
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  // Adjust the size of the thumb
                  overlayShape: RoundSliderOverlayShape(
                      overlayRadius:
                          20.0), // Optional: Customize overlay when thumb is pressed
                ),
                child: Slider(
                  min: 1.0,
                  max: 10.0,
                  value: controller.distance.value,
                  onChanged: (newValue) {
                    controller.changeDistance(newValue);
                  },
                  activeColor: Colors.blue,
                  // Change the active color of the slider
                  inactiveColor: Colors.blue.withOpacity(0.3),
                  // Change the inactive color to a lighter blue
                  thumbColor: Colors.blue,
                  // Change the thumb (circular handle) color to blue
                  divisions:
                      9, // Optional: For adding divisions (e.g., 1, 2, 3, ...)
                ),
              );
            }),
```

#### Image of the slider:
![image](https://github.com/user-attachments/assets/fdb2a97c-d31f-4f8c-954b-5f6e3f006020)


