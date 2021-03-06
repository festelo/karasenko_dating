abstract class VkBridge {
  Future<dynamic> send(String call, Map<String, dynamic> params);
}

enum VkAuthScope { friends, status, groups }

extension VkAuthScopeExtension on VkAuthScope {
  String get name {
    switch (this) {
      case VkAuthScope.friends:
        return 'friends';
      case VkAuthScope.status:
        return 'status';
      case VkAuthScope.groups:
        return 'groups';
    }
  }
}

class VkException implements Exception {
  final dynamic? source;

  VkException({this.source});
}

class VkAuthTokenException extends VkException {
  final String type;
  final String data;

  VkAuthTokenException({
    required this.type,
    required this.data,
    dynamic? source,
  }) : super(source: source);
}
