class Usuario {
  final String imagePath;
  final String nome;
  final String email;
  final String cpf;
  final String cartaoSus;
  final String dataNascimento;
  final String cidade;
  final String endereco;

  const Usuario({
    required this.imagePath,
    required this.nome,
    required this.email,
    required this.cpf,
    required this.cartaoSus,
    required this.dataNascimento,
    required this.cidade,
    required this.endereco,
  });
}