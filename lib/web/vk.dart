@JS()
library vk;

import 'dart:html';

import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'vk.types.dart';

@JS('vkBridge')
external _VkBridgeInterop bridgeProd;

@JS('vkBridgeMock')
external _VkBridgeInterop bridgeMock;

@JS()
class _VkBridgeInterop {
  @JS('send')
  external dynamic send(String call, Object params);
}

class VkBridgeWeb implements VkBridge {
  _VkBridgeInterop interop;
  VkBridgeWeb(this.interop);

  @override
  Future send(String call, Map<String, dynamic> params) {
    final jsParams = mapToJsObject(params);
    return promiseToFutureAsMap(
        interop.send(call, jsParams).then((e) => e, (e) {
      print(e);
      return e;
    }));
  }

  Object mapToJsObject(Map map) {
    var object = newObject();
    map.forEach((k, v) {
      if (v is Map) {
        setProperty(object, k, mapToJsObject(v));
      } else {
        setProperty(object, k, v);
      }
    });
    return object;
  }
}

class Vk {
  VkBridge bridge;

  Vk({bool mocked = false})
      : bridge = mocked ? VkBridgeWeb(bridgeMock) : VkBridgeWeb(bridgeProd);

  Future<void> init() async {
    await bridge.send('VKWebAppInit', {});
  }

  Future<String> email() async {
    final res = await bridge.send('VKWebAppGetEmail', {});
    return res['email'];
  }

  Future<String> token({
    required String appId,
    required Set<VkAuthScope> scope,
  }) async {
    final res = await bridge.send('VKWebAppGetAuthToken', {
      "app_id": 6909581,
      "scope": scope.map((e) => e.name).join(','),
    });
    if (res['error_type'] != null) {
      throw VkAuthTokenException(
        type: res['error_type'],
        data: res['error_data'],
        source: res,
      );
    }
    return res['access_token'];
  }
}
