import 'package:dio/dio.dart';
import 'package:flutter_cinema/common/configs/configurations.dart';
import 'package:flutter_cinema/common/constants/string_constants.dart';
import 'package:flutter_cinema/common/injector/injector.dart';
import 'package:flutter_cinema/common/network/http/dio_config.dart';
import 'package:flutter_cinema/presentation/bloc/loader_bloc/bloc.dart';
import 'package:flutter_cinema/presentation/bloc/snackbar_bloc/bloc.dart';
import 'package:flutter_cinema/presentation/bloc/snackbar_bloc/snackbar_type.dart';

class DioInterceptor extends Interceptor {
  final _snackBarBloc = Injector.container<SnackbarBloc>();
  final _loaderBloc = Injector.container<LoaderBloc>();

  @override
  Future onResponse(Response response) {
    if (response.request.baseUrl == Configurations.facebookApi) {
      return Future.value(response.data);
    }
    if (response.data['data'] != null) {
      return Future.value(response.data['data']);
    }
    return Future.value(true);
  }

  @override
  Future onError(DioError err) {
    try {
      if (err.request.baseUrl == Configurations.facebookApi) {
        final error = err.response?.data['error']['message'];
        if (error != null && error is String) {
          _snackBarBloc
              .add(ShowSnackbar(title: error, type: SnackBarType.error));
        } else {
          _snackBarBloc.add(ShowSnackbar(
              title: StringConstants.errorSomethingWentWrong,
              type: SnackBarType.error));
        }
      } else {
        // final errorCode =
        //     ErrorCodeEnum.getErrorCode(err.response?.data['error_code']);
        // if (err.response.statusCode == 401 && errorCode == null) {
        //   /// handle refresh token
        //   return _handleRefreshToken(err);
        // } else if (errorCode != null) {
        //   if (errorCode == ErrorCode.errorCode_001_001_401) {
        //     /// handle refresh token
        //     return _handleRefreshToken(err);
        //   } else if (errorCode.showErrorMessage) {
        //     _snackBarBloc.add(ShowSnackbar(
        //         title: errorCode.message, type: SnackBarType.error));
        //   }
        // } else {
        //   _snackBarBloc.add(ShowSnackbar(
        //       title: StringConstants.errorSomethingWentWrong,
        //       type: SnackBarType.error));
        // }
      }
    } catch (e) {
      _snackBarBloc.add(ShowSnackbar(
          title: StringConstants.errorServerError,
          type: SnackBarType.error));
    }

    _loaderBloc.add(FinishLoading());
    return super.onError(err);
  }

  // Future _handleRefreshToken(DioError err) async {
  //   RequestOptions options = err.response.request;
  //   final refreshToken =
  //       await Injector.container<AppPreference>().getRefreshToken();
  //   final response = await Injector.container<AuthenticationRepository>()
  //       .refreshToken(RefreshTokenRequest(
  //           grantType: AuthenticationGrantType.refresh_token.key,
  //           refreshToken: refreshToken));
  //   final tokenModel = LoginModel.parseModel(response);
  //   Injector.container<AppPreference>()
  //       .saveToken(tokenModel.accessToken, tokenModel.refreshToken);
  //   options.headers[Configurations.authentication] =
  //       Configurations.getBearerAuth(response.accessToken);
  //   return dio.request(options.path, options: options);
  // }
}
