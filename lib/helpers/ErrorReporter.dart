
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'SessionManager.dart';

class ErrorReporter {

  static reportError(error, stackTrace) {
    try {
      Crashlytics.instance.setUserEmail(SessionManager.email);
      Crashlytics.instance.setUserIdentifier(
          "User id: ${SessionManager.userId}");
      Crashlytics.instance.setUserName("${SessionManager.firstName} ${SessionManager.lastName}");
      Crashlytics.instance.recordError(error, stackTrace);
    } catch(error) {

    }
  }
}
