class AppwriteConstants {
  static const String databaseId = '6443e920c18eefda36dd';
  static const String projectId = '6443e4fd40cd53b65bed';
  static const String endPoint = 'http://192.168.1.4/v1';
  //http://IPV4_USER/v1

  static const String usersCollection = '6443ee9ad69ca8ac1c33';
  static const String tweetsCollection = '6443eec316470fd634a6';
  static const String notificationsCollection = '6443eebcd86f279766fe';

  static const String storageBucket = '6443eeca614a0c048a54';

  static String imageUrl(String imageId) {
    return '$endPoint/storage/buckets/$storageBucket/files/$imageId/view?project=$projectId&mode=admin';
  }
}
