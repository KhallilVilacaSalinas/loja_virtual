String getErrorString(String code) {
  switch (code) {
    case 'weak-password':
      return 'Sua senha é muito fraca.';

    case 'invalid-email':
      return 'Seu e-mail é inválido.';

    case 'email-already-in-use':
      return 'Este email já existe.';

    case 'account-exists-with-different-credential':
      return 'E-mail já está sendo utilizado em outra conta.';

    case 'invalid-credential':
      return 'Seu e-mail é inválido.';

    case 'user-not-found':
      return 'Credenciais incorretas.';

    case 'wrong-password':
      return 'Sua senha está incorreta.';

    case 'user-disabled':
      return 'Este usuário foi desabilitado.';

    case 'operation-not-allowed':
      return 'Muitas solicitações. Tente novamente mais tarde.';

    case 'operation-not-allowed':
      return 'Operação não permitida.';

    default:
      return 'Um erro indefinido ocorreu.';
  }
}
