class PacoteDao {

databaseHelper databaseHelper = databaseHelper();
Database db = await databaseHelper.db;

cadastrarUsuario(){

String sql = ‘INSERT INTO  usuarios (nome, cpF, email, local, data_nascimento, sexo, senha, numero_cartao_sus) VALUES ('name', 'cpf', 'email', 'local', 'data_nascimento', 'sexo', 'senha', 'numero_cartao_sus')’;

final result = db.rawQuery(sql);


		}

cadastrarAgendamento(){

String sql = ‘INSERT INTO  agendamento (local_vac, dia_vac, horario) VALUES ('local_vac', 'dia_vac', 'horario')’;

final result = db.rawQuery(sql);
    }

visualizarAgendamento(){

String sql = ‘SELECT * FROM agendamento WHERE id_agendamento = 'id_agendamento'’;

final result = db.rawQuery(sql);
    }    
}

login(){

  String sql = ‘SELECT * FROM cadastro WHERE cpf = 'cpf_login' AND senha = 'senha_login'’;


}

