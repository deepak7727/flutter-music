class GoogleUserModel {
  final String displayName;
  final String email;
  final bool isEmailVerified;
  final bool isAnonymous;
  final GoogleUserMetadata metadata;
  final String? phoneNumber;
  final String? photoURL;
  final List<GoogleUserInfo> providerData;
  final String? refreshToken;
  final String? tenantId;
  final String uid;

  GoogleUserModel({
    required this.displayName,
    required this.email,
    required this.isEmailVerified,
    required this.isAnonymous,
    required this.metadata,
    this.phoneNumber,
    this.photoURL,
    required this.providerData,
    this.refreshToken,
    this.tenantId,
    required this.uid,
  });

  factory GoogleUserModel.fromJson(Map<String, dynamic> json) {
    return GoogleUserModel(
      displayName: json['displayName'],
      email: json['email'],
      isEmailVerified: json['isEmailVerified'],
      isAnonymous: json['isAnonymous'],
      metadata: GoogleUserMetadata.fromJson(json['metadata']),
      phoneNumber: json['phoneNumber'],
      photoURL: json['photoURL'],
      providerData: (json['providerData'] as List)
          .map((item) => GoogleUserInfo.fromJson(item))
          .toList(),
      refreshToken: json['refreshToken'],
      tenantId: json['tenantId'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'email': email,
      'isEmailVerified': isEmailVerified,
      'isAnonymous': isAnonymous,
      'metadata': metadata.toJson(),
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
      'providerData': providerData.map((item) => item.toJson()).toList(),
      'refreshToken': refreshToken,
      'tenantId': tenantId,
      'uid': uid,
    };
  }
}

class GoogleUserMetadata {
  final DateTime creationTime;
  final DateTime lastSignInTime;

  GoogleUserMetadata({
    required this.creationTime,
    required this.lastSignInTime,
  });

  factory GoogleUserMetadata.fromJson(Map<String, dynamic> json) {
    return GoogleUserMetadata(
      creationTime: DateTime.parse(json['creationTime']),
      lastSignInTime: DateTime.parse(json['lastSignInTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'creationTime': creationTime.toIso8601String(),
      'lastSignInTime': lastSignInTime.toIso8601String(),
    };
  }
}

class GoogleUserInfo {
  final String displayName;
  final String email;
  final String? phoneNumber;
  final String? photoURL;
  final String providerId;
  final String uid;

  GoogleUserInfo({
    required this.displayName,
    required this.email,
    this.phoneNumber,
    this.photoURL,
    required this.providerId,
    required this.uid,
  });

  factory GoogleUserInfo.fromJson(Map<String, dynamic> json) {
    return GoogleUserInfo(
      displayName: json['displayName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      photoURL: json['photoURL'],
      providerId: json['providerId'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'email': email,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
      'providerId': providerId,
      'uid': uid,
    };
  }
}
