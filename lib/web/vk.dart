@JS()
library vk;

import 'package:js/js.dart';
import 'vk.types.dart';

@JS('vkBridge')
external VkBridge bridge;

class Vk {
  static Future<void> init() async {
    await bridge.send('VKWebAppInit', {});
  }

  static Future<String> email() async {
    final data = await bridge.send('VKWebAppGetEmail', {});
    return data['email'];
  }

  static Future<String> token({
    required String appId,
    required Set<VkAuthScope> scope,
  }) async {
    final res = await bridge.send('VKWebAppGetAuthToken', {
      "app_id": 6909581,
      "scope": scope.map((e) => e.name).join(','),
    });
    final type = res['type'];
    if (type == 'VKWebAppGetAuthTokenFailed') {
      throw VkAuthTokenException(
        type: res['data']['error_type'],
        data: res['data']['error_data'],
        source: res,
      );
    }
    return res['data']['access_token'];
  }
}
