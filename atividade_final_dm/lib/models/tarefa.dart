class Tarefa {
  late int id;
  late String nome;
  late String descricao;
  late String status;

  Tarefa(
      {this.id = 0,
      this.nome = "",
      this.descricao = "",
      this.status = "A FAZER"});
}
