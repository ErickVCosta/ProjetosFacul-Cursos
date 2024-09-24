-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE alunos (
id_alunos INTEGER PRIMARY KEY,
nome_alun VARCHAR(255),
cpf_alun VARCHAR(255),
data_nasc_alun VARCHAR(25),
email_prim_alun VARCHAR(255),
email_sec_alun VARCHAR(255),
telefone_alun VARCHAR(13),
rua VARCHAR(255),
numero VARCHAR(255),
bairro VARCHAR(255),
cep VARCHAR(8),
cidade VARCHAR(255),
curso_id INTEGER
)

CREATE TABLE cursos (
id_curso INTEGER PRIMARY KEY,
nome_curso VARCHAR(255),
duracao_curso VARCHAR(255),
coorde_curso VARCHAR(255)
)

CREATE TABLE materias (
id_materia INTEGER PRIMARY KEY,
nome_materia VARCHAR(255),
carga_horaria VARCHAR(255),
professor_id INTEGER,
curso_id INTEGER,
FOREIGN KEY(curso_id) REFERENCES cursos (id_curso)
)

CREATE TABLE professores (
id_prof INTEGER PRIMARY KEY,
nome_prof VARCHAR(255),
email_prim VARCHAR(255),
email_sec VARCHAR(255),
cpf_prof VARCHAR(11),
telefone_prof VARCHAR(13),
formacao_prof VARCHAR(255)
)

CREATE TABLE turmas (
id_turma INTEGER PRIMARY KEY,
nome_turma VARCHAR(255),
curso_id INTEGER,
professor_id INTEGER,
materia_id INTEGER,
FOREIGN KEY(curso_id) REFERENCES cursos (id_curso),
FOREIGN KEY(professor_id) REFERENCES professores (id_prof),
FOREIGN KEY(materia_id) REFERENCES materias (id_materia)
)

CREATE TABLE notas (
id_nota INTEGER PRIMARY KEY,
aluno_id INTEGER,
turma_id INTEGER,
FOREIGN KEY(aluno_id) REFERENCES alunos (id_alunos),
FOREIGN KEY(turma_id) REFERENCES turmas (id_turma)
)

CREATE TABLE cursam (
id_curso INTEGER,
id_alunos INTEGER,
FOREIGN KEY(id_curso) REFERENCES cursos (id_curso),
FOREIGN KEY(id_alunos) REFERENCES alunos (id_alunos)
)

CREATE TABLE cursos_materias (
id_materia INTEGER,
id_curso INTEGER,
FOREIGN KEY(id_materia) REFERENCES materias (id_materia),
FOREIGN KEY(id_curso) REFERENCES cursos (id_curso)
)

CREATE TABLE leciona (
id_materia INTEGER,
id_prof INTEGER,
FOREIGN KEY(id_materia) REFERENCES materias (id_materia),
FOREIGN KEY(id_prof) REFERENCES professores (id_prof)
)

CREATE TABLE tem (
id_materia INTEGER,
id_turma INTEGER,
FOREIGN KEY(id_materia) REFERENCES materias (id_materia),
FOREIGN KEY(id_turma) REFERENCES turmas (id_turma)
)

CREATE TABLE prof_turmas (
id_turma INTEGER,
id_prof INTEGER,
FOREIGN KEY(id_turma) REFERENCES turmas (id_turma),
FOREIGN KEY(id_prof) REFERENCES professores (id_prof)
)

CREATE TABLE alun_notas (
id_nota INTEGER,
id_alunos INTEGER,
FOREIGN KEY(id_nota) REFERENCES notas (id_nota),
FOREIGN KEY(id_alunos) REFERENCES alunos (id_alunos)
)

CREATE TABLE turmas_notas (
id_nota INTEGER,
id_turma INTEGER,
FOREIGN KEY(id_nota) REFERENCES notas (id_nota),
FOREIGN KEY(id_turma) REFERENCES turmas (id_turma)
)

ALTER TABLE alunos ADD FOREIGN KEY(curso_id) REFERENCES cursos (id_curso)
ALTER TABLE materias ADD FOREIGN KEY(professor_id) REFERENCES professores (id_prof)
