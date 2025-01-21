## Chips

### Chips with Enum & Getx

#### Enum
```dart
enum ChipSelection { none, argosaronic, northAegean, sporades, chip4 }
```

#### Getx
```dart
class ChipSelectionController extends GetxController {
  // Enum to represent the chip selection
  ChipSelection selectedChip = ChipSelection.argosaronic;

  // Function to update the selected chip
  void selectChip(ChipSelection chip) {
    selectedChip = chip;
    update();  // Update the UI
  }
}
```

#### Integrate with Design
```dart
      SizedBox(
              height: 60, // Container height for the chips
              child: GetBuilder<ChipSelectionController>(builder: (_) {
                return ListView(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  children: List.generate(4, (index) {
                    ChipSelection chip =
                        ChipSelection.values[index + 1]; // Starts from Chip1
                    bool isSelected = chipController.selectedChip == chip;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          chipController
                              .selectChip(chip); // Update the selected chip
                        },
                        child: Chip(
                          label: Text(
                            formatChipText(chip),
                            // Format the text to insert spaces
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color:
                                  isSelected ? Colors.white : Color(0xff2D2D2D),
                            ),
                          ),
                          backgroundColor:
                              isSelected ? Color(0xFF2853AF) : Colors.white,
                          elevation: isSelected ? 5 : 0,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
```


#### For handling enums
```dart
//* Space on chips
String formatChipText(ChipSelection chip) {
  String enumValue = chip.toString().split('.').last;
  return GetStringUtils(enumValue.replaceAllMapped(
    RegExp(r'([a-z])([A-Z])'),
    (match) => '${match.group(1)} ${match.group(2)}',
  )).capitalizeFirst!;
}

//* Making first latter upper case
extension StringCapitalization on String {
  String get capitalizeFirst {
    return this[0].toUpperCase() + this.substring(1);
  }
}
```


#### Image of the Chip
![chips](https://github.com/user-attachments/assets/e4718f17-afe4-4c28-8df2-bd2d2bd084f4)


----------------------------------------------------------------




