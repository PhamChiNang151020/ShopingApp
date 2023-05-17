import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

import '../../data.dart';

abstract class AbstractHttpRequest {
  final String path;

  final Map<String, dynamic>? parameters;
  final dynamic body;
  final Map<String, dynamic>? header;
  final String? baseUrl;
  const AbstractHttpRequest(
    this.path, {
    this.parameters,
    this.header,
    this.body,
    this.baseUrl,
  });
}

// final logger = Logger(GlobalApp.logz.toString());

abstract class AbstractHttpClient {
  Future<dynamic> get<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
    ProgressCallback onReceiveProgress,
  });
  Future<dynamic> post<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
  Future<dynamic> postFile<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
  Future<dynamic> put<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
  Future<dynamic> patch<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
  Future<dynamic> head<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
  });
  Future<dynamic> delete<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
  });
}

@module
abstract class RegisterModule {
  @injectable
  Dio get dio => Dio();
}

abstract class AbstractDioHttpClient extends AbstractHttpClient {
  final Dio client;
  AbstractDioHttpClient({required this.client});
  void addOptions(BaseOptions options);
  void addInterceptor(Interceptor interceptor);
}

@LazySingleton(as: AbstractDioHttpClient)
class ApiClient extends AbstractDioHttpClient {
  ApiClient({required Dio client}) : super(client: client);

  @override
  void addInterceptor(Interceptor interceptor) =>
      client.interceptors.add(interceptor);

  @override
  void addOptions(BaseOptions options) {
    client.options = options;
  }

  @override
  Future<dynamic> get<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await client.get(
        request.path,
        queryParameters: request.parameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: request.header,
        ),
      );
      // final info = LogzInfoRequest(
      //   method: "GET",
      //   api: request.path,
      //   body: request.body,
      //   response: response,
      // );

      // LogzHelper.sentLogzInfo(infoRequest: info);
      return factory != null ? factory(response.data) : response.data;
    } on DioError catch (e) {
      var a = NetworkExceptions.exceptionToError(e);
      var err = NetworkExceptions.getErrorMessage(a);
      // if (globalServer.getTokenExpires == true) {
      //   await DataBoxHelper.reFreshToken();
      // } else
      {
        // var error = ErrClient(
        //   error: err,
        //   api: request.path,
        //   body: request.body,
        // );
        // LogzHelper.sentLogzError(errClient: error, type: 1);
        throw NetworkExceptions.exceptionToError(e);
      }
    } on SocketException catch (e) {
      // var error = ErrClient(
      //   error: e,
      //   api: request.path,
      //   body: request.body,
      // );
      // LogzHelper.sentLogzError(errClient: error, type: 2);
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      // var error = ErrClient(
      //   error: e,
      //   api: request.path,
      //   body: request.body,
      // );
      // LogzHelper.sentLogzError(errClient: error, type: 3);
      // logger.severe(
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> post<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await client.post(
        request.path,
        queryParameters: request.parameters,
        data: request.body,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: request.header,
        ),
      );
      // final info = LogzInfoRequest(
      //   method: "POST",
      //   api: request.path,
      //   body: request.body,
      //   response: response,
      // );

      // LogzHelper.sentLogzInfo(infoRequest: info);
      return factory == null ? response : factory(response.data);
    } on DioError catch (e) {
      var a = NetworkExceptions.exceptionToError(e);
      var err = NetworkExceptions.getErrorMessage(a);
      // if (globalServer.getTokenExpires == true) {
      //   await DataBoxHelper.reFreshToken();
      // } else
      {
        // var error = ErrClient(
        //   error: err,
        //   api: request.path,
        //   body: request.body,
        // );
        // LogzHelper.sentLogzError(errClient: error, type: 1);
        throw NetworkExceptions.exceptionToError(e);
      }
    } on SocketException catch (e) {
      // var error = ErrClient(
      //   error: e,
      //   api: request.path,
      //   body: request.body,
      // );
      // LogzHelper.sentLogzError(errClient: error, type: 2);
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      // var error = ErrClient(
      //   error: e,
      //   api: request.path,
      //   body: request.body,
      // );
      // LogzHelper.sentLogzError(errClient: error, type: 3);
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> put<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await client.put(
        request.path,
        queryParameters: request.parameters,
        data: request.body,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(headers: request.header),
      );
      return factory == null ? response : factory(response.data);
    } on DioError catch (e) {
      throw NetworkExceptions.exceptionToError(e);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> delete<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.delete(
        request.path,
        queryParameters: request.parameters,
        data: request.body,
        cancelToken: cancelToken,
        options: Options(headers: request.header),
      );
      return factory == null ? response : factory(response.data);
    } on DioError catch (e) {
      throw NetworkExceptions.exceptionToError(e);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> head<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.head(
        request.path,
        queryParameters: request.parameters,
        data: request.body,
        options: Options(headers: request.header),
      );
      return factory == null ? response : factory(response.data);
    } on DioError catch (e) {
      throw NetworkExceptions.exceptionToError(e);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> patch<T>(
    AbstractHttpRequest request,
    T Function(dynamic data)? factory, {
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await client.patch(
        request.path,
        queryParameters: request.parameters,
        data: request.body,
        options: Options(headers: request.header),
      );
      return factory == null ? response : factory(response.data);
    } on DioError catch (e) {
      throw NetworkExceptions.exceptionToError(e);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future postFile<T>(
      AbstractHttpRequest request, T Function(dynamic data)? factory,
      {CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await client.get(
        request.path,
        queryParameters: request.parameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: request.header,
        ),
      );
      // final infor = LogzInfoRequest(
      //   method: "GET",
      //   api: request.path,
      //   body: request.body,
      //   response: response,
      // );

      // LogzHelper.sentLogzInfo(infoRequest: infor);
      return factory != null ? factory(response.data) : response.data;
    } on DioError catch (e) {
      var a = NetworkExceptions.exceptionToError(e);
      var err = NetworkExceptions.getErrorMessage(a);
      // var error = ErrClient(
      //   error: err,
      //   api: request.path,
      //   body: request.body,
      // );
      // LogzHelper.sentLogzError(errClient: error, type: 1);
      throw NetworkExceptions.exceptionToError(e);
    } on SocketException catch (e) {
      // var error = ErrClient(
      //   error: e,
      //   api: request.path,
      //   body: request.body,
      // );
      // LogzHelper.sentLogzError(errClient: error, type: 2);
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      // var error = ErrClient(
      //   error: e,
      //   api: request.path,
      //   body: request.body,
      // );
      // LogzHelper.sentLogzError(errClient: error, type: 3);
      // logger.severe(
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
