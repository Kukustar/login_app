import 'package:flutter/cupertino.dart';
import 'package:login_app/generated/l10n.dart';

const String EMPTY_FIELD = 'EMPTY_FIELD';
const String THERE_IS_NO_SUCH_USER = 'THERE_IS_NO_SUCH_USER';
const String WRONG_PASSWORD = 'WRONG_PASSWORD';
const String INCORRECT_RECOVERY_KEY = 'INCORRECT_RECOVERY_KEY';
const String USER_EXIST = 'USER_EXIST';
const String PASSWORDS_NOT_MATCH = 'PASSWORDS_NOT_MATCH';


String getErrorTranslation(BuildContext context, errorKey) {
  final Map<String, String> errorStringMapper = Map.from({
    EMPTY_FIELD: S.of(context).emptyField,
    THERE_IS_NO_SUCH_USER: S.of(context).thereIsNoSuchUser,
    WRONG_PASSWORD: S.of(context).wrongPassword,
    INCORRECT_RECOVERY_KEY: S.of(context).incorrectRecoveryKey,
    USER_EXIST: S.of(context).userExist,
    PASSWORDS_NOT_MATCH: S.of(context).passwordsNotMatch,
  });

  return errorStringMapper[errorKey].toString();
}