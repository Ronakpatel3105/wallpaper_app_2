import 'package:gallery_saver/gallery_saver.dart';

void downloadWallpaper(String img) async{
  GallerySaver.saveImage(img).then((value){
    print(value);
  });
}