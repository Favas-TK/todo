import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async{
     if (event is LoginEvent) {
        final auth = FirebaseAuth.instance;
        try {
           await auth.signInWithEmailAndPassword(
                          email: event.email,
                          password:event.password,
                        );
                        emit(LoginSuccess());
        }  on FirebaseAuthException  catch (e) {
          
          emit(LoginFailed(message: e.code));
         
        }
     }
    });
  }
}



 // onPressed: () async {
                    //  
                    //   try {
                       

                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => HomeScreen()));
                    //   } (e) {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //         const SnackBar(
                    //             content: Text('invalid email or password')));
                    //     // print(e.code);
                    //     // print('login failed');
                    //   }
                    // },