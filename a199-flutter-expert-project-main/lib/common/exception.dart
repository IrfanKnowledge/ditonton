class ServerException implements Exception {}

class ParsingJsonException implements Exception {}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}
