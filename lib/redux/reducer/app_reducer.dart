import 'package:redux_strucuture/redux/action/reducer_action_common/reducer_action_common.dart';
import 'package:redux_strucuture/redux/appstate.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    loginLoader: loginLoaderReducer(state.loginLoader, action), //login loader
  );}