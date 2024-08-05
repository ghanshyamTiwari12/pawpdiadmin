
import 'package:flutter/foundation.dart';

class LoaderProvider extends ChangeNotifier{
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isImageLoader = false;
  bool get isImageLoader => _isImageLoader;
  bool _isIdImageLoader = false;
  bool get isIDImagLoader => _isIdImageLoader;


  loading(bool isStarted) {
    _isLoading = isStarted;
    notifyListeners();
  }

  imageLoader(bool isStarted){
    _isImageLoader = isStarted;
    notifyListeners();
  }

  imageIdLoader(bool isStarted){
    _isIdImageLoader = isStarted;
    notifyListeners();
  }

}