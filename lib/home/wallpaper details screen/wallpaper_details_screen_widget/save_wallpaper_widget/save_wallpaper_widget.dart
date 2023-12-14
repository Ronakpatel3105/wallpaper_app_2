import 'package:wallpaper/wallpaper.dart';

void setWallpaper(String img,double mWidth,double mHeight){
  var downloadStream = Wallpaper.imageDownloadProgress(img);

  downloadStream.listen((event) {
    print(event.toString());
  }, onDone:() async{
    print("Wallpaper downloaded in app cache..");
    //set wallpaper here
    var check = await Wallpaper.homeScreen(
        width: mWidth,
        height: mHeight,
        options: RequestSizeOptions.RESIZE_EXACT
    );
    print("Wallpaper: $check");
  }, onError: (e){
    print("Error: $e");
  });
}