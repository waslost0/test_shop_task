part of 'exceptions.dart';

sealed class LocalServiceException extends TlException {
  const LocalServiceException({super.message});
}

final class ObjectNotFoundException extends LocalServiceException {
  const ObjectNotFoundException({super.message});
}

final class ObjectCastException extends LocalServiceException {
  const ObjectCastException({super.message});
}

final class FileNotFoundException extends LocalServiceException {
  const FileNotFoundException({super.message});
}
