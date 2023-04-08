import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  const AuthRepository(this._auth);

  final FirebaseAuth _auth;
  // 認証のトークンの状態を監視している
  Stream<User?> get authStateChange => _auth.idTokenChanges();
  // Login
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('指定したメールアドレスは登録されていません');
      } else if (e.code == 'wrong-password') {
        throw AuthException('パスワードが違います');
      } else if (e.code == 'user-disabled') {
        throw AuthException('指定したメールアドレスは使用できません');
      } else if (e.code == 'invalid-email') {
        throw AuthException('メールアドレスのフォーマットが正しくありません');
      } else {
        throw AuthException('エラーが発生しました。正しく入力がされていません');
      }
    }
  }
  // SignUp
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('指定したメールアドレスは登録されていません');
      } else if (e.code == 'wrong-password') {
        throw AuthException('パスワードが違います');
      } else if (e.code == 'user-disabled') {
        throw AuthException('指定したメールアドレスは使用できません');
      } else if (e.code == 'invalid-email') {
        throw AuthException('メールアドレスのフォーマットが正しくありません');
      } else {
        throw AuthException('エラーが発生しました。正しく入力がされていません');
      }
    }
  }
  // logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

// ErrorMessageを他のページに渡す
class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}
