import 'package:google_sign_in/google_sign_in.dart';

class GoogleProvider{


  Future<GoogleAuthData?> logOutGoogle() async {

    GoogleSignInAccount? account =  await GoogleSignIn().signOut();

    print("GoogleSignIn().signOut: $account");

    return null;
  }

  Future<GoogleAuthData?> loginGoogle() async {

    try {

      final GoogleSignInAccount? account = await GoogleSignIn().signIn();

      print("GoogleSignIn().signIn: $account");

      final googleAuth = await account!.authentication;

      print("GoogleSignIn().signIn: $googleAuth");

      return GoogleAuthData(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
          email: account.email,
          displayName: account.displayName,
          photoUrl: account.photoUrl
      );

    }catch(e){

      print("Error en login con google: $e");

      return null;
    }

  }

}


class GoogleAuthData{
  final String? idToken;
  final String? accessToken;
  final String? email;
  final String? displayName;
  final String? photoUrl;

  GoogleAuthData({this.idToken, this.accessToken, this.email, this.displayName, this.photoUrl});


  factory GoogleAuthData.fromJson(Map<String, dynamic> json){
    return GoogleAuthData(
        idToken: json['idToken'],
        accessToken: json['accessToken'],
        email: json['email'],
        displayName: json['displayName'],
        photoUrl: json['photoUrl']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'idToken': idToken,
      'accessToken': accessToken,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl
    };
  }
}