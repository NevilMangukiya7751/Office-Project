enum DeviceType {
  ios,
  android,
}

extension DeviceTypeExtension on DeviceType {
  String get deviceType {
    switch (this) {
      case DeviceType.ios:
        return 'Ios';
      case DeviceType.android:
        return 'Android';
    }
  }
}
