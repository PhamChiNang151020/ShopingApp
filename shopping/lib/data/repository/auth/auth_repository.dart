
// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:sprintf/sprintf.dart';

// import '../../../businesses_logics/api/endpoints.dart';
// import '../../../presentations/common/error.dart';
// import '../../data.dart';

// abstract class AbstractCommonRepository implements AbstractRepository {
//   Future<ApiResponse> getStdCodeWithType({required String typeStdCode});

//   Future<ApiResponse> getWorkFlow({required WorkFlowRequest content});
// }

// class CommonRepository implements AbstractCommonRepository {
//   AbstractDioHttpClient client;
//   CommonRepository({required this.client});

//   @override
//   Future<ApiResponse> getStdCodeWithType({required String typeStdCode}) async {
//     try {
//       final request = ModelRequest(sprintf(Endpoint.getStdcode, [typeStdCode]));
//       return await client.get(request,
//           (data) => ApiResponse.fromJson(data, endpoint: Endpoint.getStdcode));
//     } catch (e) {
//       return ApiResponse.fromJson(
//           ApiResponse(
//             success: false,
//             payload: null,
//             error: Error(
//               errorMessage:
//                   globalServer.getIs401 == true ? MyError.errString401 : "$e",
//               errorCode: globalServer.getIs401 == true ? MyError.err401 : 0,
//             ),
//           ).toJson(),
//           endpoint: Endpoint.getStdcode);
//     }
//   }

//   @override
//   Future<ApiResponse> getWorkFlow({
//     required WorkFlowRequest content,
//   }) async {
//     try {
//       final request = ModelRequest(
//         Endpoint.getWorkFlow,
//         body: content.toJson(),
//       );
//       return await client.post(request,
//           (data) => ApiResponse.fromJson(data, endpoint: Endpoint.getWorkFlow));
//     } catch (e) {
//       return ApiResponse.fromJson(
//           ApiResponse(
//             success: false,
//             payload: null,
//             error: Error(
//               errorMessage:
//                   globalServer.getIs401 == true ? MyError.errString401 : "$e",
//               errorCode: globalServer.getIs401 == true ? MyError.err401 : 0,
//             ),
//           ).toJson(),
//           endpoint: Endpoint.getWorkFlow);
//     }
//   }
// }
