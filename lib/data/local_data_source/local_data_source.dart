import 'package:flutter_clean_architecture/data/network/error_handler.dart';
import 'package:flutter_clean_architecture/data/responses/base_response.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 minute cache in millis
const CACHE_STORE_DETAILS_INTERVAL = 60 * 1000;
const CACHE_STORE_DETAILS_KEY = "CACHE_STORE_DETAILS_KEY";

abstract class LocalDataSource {

  Future<HomeResponse> getHomeData();

  Future<void> saveHomeDataIntoCache(HomeResponse homeResponse);

  void clearCache();

  void removeFromCache(String key);

  Future<StoreDetailsResponse> getStoreDetails();

  Future<void> saveStoreDetailsToCache(StoreDetailsResponse response);
}

class LocalDataSourceImpl implements LocalDataSource{
  // Adding runtime caching
  Map<String,CachedItem> cachedHomeData = {};

  @override
  Future<HomeResponse> getHomeData() async {
    CachedItem? cachedItem = cachedHomeData[CACHE_HOME_KEY];
    if(cachedItem !=null && cachedItem.isValid(CACHE_HOME_INTERVAL)){
      return cachedItem.data;
    }else{
      throw ErrorHandler.handleError(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveHomeDataIntoCache(HomeResponse homeResponse) async{
    cachedHomeData[CACHE_HOME_KEY] = CachedItem(homeResponse);
  }

  @override
  void clearCache() {
    cachedHomeData.clear();
  }

  @override
  void removeFromCache(String key) {
    cachedHomeData.remove(CACHE_HOME_KEY);
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async{
    CachedItem? cachedItem = cachedHomeData[CACHE_STORE_DETAILS_KEY];

    if (cachedItem != null &&
        cachedItem.isValid(CACHE_STORE_DETAILS_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handleError(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveStoreDetailsToCache(StoreDetailsResponse response) async{
    cachedHomeData[CACHE_STORE_DETAILS_KEY] = CachedItem(response);
  }

}

class CachedItem{
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;
  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem{
  bool isValid(int expirationTimeInMillis){
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;

    bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
    // expirationTimeInMillis -> 60 sec
    // currentTimeInMillis -> 1:00:00
    // cacheTime -> 12:59:30
    // valid -> till 1:00:30
    return isValid;
  }
}