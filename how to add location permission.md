## How to add location permission on any page

### Steps
1. **Add dependency in** `pubspec.yaml`:
```dart
dependencies:
  permission_handler: ^11.3.1 # Check latest version on pub.dev
```

2. **Update** `AndroidManifest.xml`:
```java
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
<uses-feature android:name="android.hardware.location.gps"/>
```

3. **Logic using Getx:** Just add the controller on the page that your trying to request for the location permission.
```dart
import 'dart:async';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../auth/screens/sign_in_screen.dart';

class SplashController extends GetxController {
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();

    if (status.isGranted) {
      print("Location permission granted");
      startTimer();
    } else if (status.isDenied) {
      print("Location permission denied");
      // You can show a dialog or keep asking
      // requestLocationPermission(); // Uncomment if you want to retry
    } else if (status.isPermanentlyDenied) {
      print("Permission permanently denied. Opening app settings...");
      openAppSettings();
    }
  }

  void startTimer() {
    timer = Timer(const Duration(seconds: 3), () {
      Get.to(() => SignInScreen());
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
```
