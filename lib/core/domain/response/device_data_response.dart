class KidDeviceResponse{
   bool status;
   String message;
   String name;
   String image;
   String devicedate;
   String devicetime;
   String devicelocation;
   String batteryperformance;
   String condition;

  KidDeviceResponse({
    required this.status,
    required this.message,
    required this.name,
    required this.image,
    required this.devicedate,
    required this.devicetime,
    required this.devicelocation,
    required this.batteryperformance,
    required this.condition
  });
}