create database db_acme_filmes_turma_ba;

use db_acme_filmes_turma_ba;

-- -----------------------------------------------------
-- Table `tbl_classificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_classificacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `nome_completo` VARCHAR(100) NOT NULL,
  `descricao` TEXT NOT NULL,
  `icone` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `tbl_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_genero` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `nome`));

-- -----------------------------------------------------
-- Table `tbl_nacionalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_nacionalidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gentilico` VARCHAR(100) NOT NULL,
  `sigla` VARCHAR(45) NOT NULL,
  `bandeira` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `tbl_filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_filme` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `sinopse` TEXT NOT NULL,
  `duracao` TIME NOT NULL,
  `data_lancamento` DATE NOT NULL,
  `data_relancamento` DATE NULL,
  `foto_capa` VARCHAR(200) NOT NULL,
  `valor_unitario` FLOAT NULL,
  `classificacao_id` INT NOT NULL,
  `genero_id` INT NOT NULL,
  `nacionalidade_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_filme_classificacao`
    FOREIGN KEY (`classificacao_id`)
    REFERENCES `tbl_classificacao` (`id`),
    CONSTRAINT `fk_filme_genero`
    FOREIGN KEY (`genero_id`)
    REFERENCES `tbl_genero` (`id`),
  CONSTRAINT `fk_filme_nacionalidade`
    FOREIGN KEY (`nacionalidade_id`)
    REFERENCES `tbl_nacionalidade` (`id`));


-- -----------------------------------------------------
-- Table `tbl_ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_ator` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `nome_artistico` VARCHAR(100) NULL,
  `biografia` TEXT NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `data_falecimento` DATE NULL,
  `foto` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `tbl_ator_filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_ator_filme` (
  `id` INT NOT NULL auto_increment,
  `ator_id` INT NOT NULL,
  `filme_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_atorfilme_ator`
    FOREIGN KEY (`ator_id`)
    REFERENCES `tbl_ator` (`id`),
  CONSTRAINT `fk_atorfilme_filme`
    FOREIGN KEY (`filme_id`)
    REFERENCES `tbl_filme` (`id`));


-- -----------------------------------------------------
-- Table `tbl_diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_diretor` (
  `id` INT NOT NULL auto_increment,
  `nome` VARCHAR(100) NOT NULL,
  `nome_artistico` VARCHAR(100) NULL,
  `biografia` TEXT NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `data_falecimento` DATE NULL,
  `foto` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `tbl_diretor_filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_diretor_filme` (
  `id` INT NOT NULL auto_increment,
  `diretor_id` INT NOT NULL,
  `filme_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_diretorfilme_diretor`
    FOREIGN KEY (`diretor_id`)
    REFERENCES `tbl_diretor` (`id`),
  CONSTRAINT `fk_diretorfilme_filme`
    FOREIGN KEY (`filme_id`)
    REFERENCES `tbl_filme` (`id`));


-- -----------------------------------------------------
-- Table `tbl_ator_nacionalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_ator_nacionalidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ator_id` INT NOT NULL,
  `nacionalidade_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_atornacionalidade_ator`
    FOREIGN KEY (`ator_id`)
    REFERENCES `tbl_ator` (`id`),
  CONSTRAINT `fk_atornacionalidade_nacionalidade`
    FOREIGN KEY (`nacionalidade_id`)
    REFERENCES `tbl_nacionalidade` (`id`));


-- -----------------------------------------------------
-- Table `tbl_diretor_nacionalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_diretor_nacionalidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `diretor_id` INT NOT NULL,
  `nacionalidade_id` INT NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_diretornacionalidade_diretor`
    FOREIGN KEY (`diretor_id`)
    REFERENCES `tbl_diretor` (`id`),
  CONSTRAINT `fk_diretornacionalidade_nacionalidade`
    FOREIGN KEY (`nacionalidade_id`)
    REFERENCES `tbl_nacionalidade` (`id`));


-- -----------------------------------------------------
-- Table `tbl_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `tbl_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `tbl_filmes_salvos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_filmes_salvos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `filme_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_filmessalvos_filme`
    FOREIGN KEY (`filme_id`)
    REFERENCES `tbl_filme` (`id`),
  CONSTRAINT `fk_filmessalvos_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `tbl_usuario` (`id`));


-- -----------------------------------------------------
-- Table `tbl_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valor_total` FLOAT NOT NULL,
  `nome_cliente` VARCHAR(45) NOT NULL,
  `usuario_id` INT NOT NULL,
  `filme_id` INT NOT NULL,
  
	PRIMARY KEY (`id`, `valor_total`, `nome_cliente`),
    CONSTRAINT `fk_pedido_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `tbl_usuario` (`id`),
    CONSTRAINT `fk_pedido_filme`
    FOREIGN KEY (`filme_id`)
    REFERENCES `tbl_filme` (`id`));
    
insert into tbl_classificacao (
                                           nome,
                                           nome_completo,
                                           descricao,
                                           icone
									) values(
                                           'Livre',
                                           'Livre para todas as idades',
                                           'Arma sem violência; Morte sem Violência; Ossada ou esqueleto sem violência; Violência Fantasiosa.Nudez não erótica.Consumo moderado ou insinuado de droga lícita.',
                                           'https://pt.wikipedia.org/wiki/Ficheiro:DJCTQ_-_L.svg'
									),
                                    (
										   '10 anos',
                                           'Livre para maiores de 10 anos',
                                           'Angústia; Arma com violência; Ato criminoso sem violência; Linguagem depreciativa; Medo ou tensão; Ossada ou esqueleto com resquício de ato de violência. Conteúdo educativo sobre sexo.Descrição do consumo de droga lícita; Discussão sobre o tema tráfico de drogas; Uso medicinal de droga ilícita.',
                                           'https://pt.wikipedia.org/wiki/Ficheiro:DJCTQ_-_10.svg'
									),
                                    (
                                           '12 anos',
                                           'Livre para maiores de 12 anos',
                                           'Agressão verbal; Assédio sexual; Ato violento; Ato violento contra animal; Bullying; Descrição de violência; Exposição ao perigo; Exposição de cadáver; Exposição de pessoa em situação constrangedora ou degradante; Lesão corporal; Morte derivada de ato heróico; Morte natural ou acidental com dor ou violência; Obscenidade; Presença de sangue; Sofrimento da vítima; Supervalorização da beleza física; Supervalorização do consumo; Violência psicológica. Apelo sexual; Carícia sexual; Insinuação sexual; Linguagem chula; Linguagem de conteúdo sexual; Masturbação; Nudez velada; Simulação de sexo.Consumo de droga lícita; Consumo irregular de medicamento; Discussão sobre legalização de droga ilícita; Indução ao uso de droga lícita; Menção a droga ilícita.',
                                           'https://pt.wikipedia.org/wiki/Ficheiro:DJCTQ_-_12.svg'
									),
                                    (
										   '14 anos',
                                           'Livre para maiores de 14 anos',
                                           'Aborto; Estigma ou preconceito; Eutanásia; Exploração sexual; Morte intencional; Pena de morte.Erotização; Nudez; Prostituição; Relação sexual; Vulgaridade.Consumo insinuado de droga ilícita; Descrição do consumo ou tráfico de droga ilícita.',
                                           'https://pt.wikipedia.org/wiki/Ficheiro:DJCTQ_-_14.svg'
									),
                                    (
										   '18 anos',
                                           'Livre para maiores de 18 anos',
                                           'Apologia à violência; Crueldade.Sexo explícito; Situação sexual complexa ou de forte impacto. Apologia ao uso de droga ilícita.',
                                           'https://pt.wikipedia.org/wiki/Ficheiro:DJCTQ_-_18.svg'
);

insert into tbl_genero (
                                           nome
							) values(
                                           'AÇÃO'
									),
                                    (
                                           'COMÉDIA'
									),
                                    (
                                           'DRAMA'
								    ),
                                    (
                                           'DOCUMENTÁRIO'
									),
                                    (
                                           'FANTASIA'
									),
                                    (
                                           'FICÇÃO CIENTÍFICA'
									),
                                    (
                                           'MUSICAL'
									),
                                    (
                                           'FILME POLICIAL'
									),
                                    (
                                           'ROMANCE'
									),
                                    (      
										   'TERROR'
									),
                                    (   
                                           'SUSPENSE'
);

insert into tbl_nacionalidade (
                                            gentilico,
                                            sigla,
											bandeira
								) values(
                                            'brasileiro(a)',
											'BR',
                                            'https://pt.wikipedia.org/wiki/Ficheiro:Flag_of_Brazil.svg'
										),
                                        (
                                            'americano(a)',
											'EUA',
                                            'https://pt.wikipedia.org/wiki/Ficheiro:Flag_of_United_States.svg'
									    ),
                                        (
                                            'italiano(a)',
											'IT',
                                            'https://pt.wikipedia.org/wiki/Ficheiro:Flag_of_Italy.svg'
										),
                                        (
                                            'espanhol(a)',
											'ES',
                                            'https://pt.wikipedia.org/wiki/Ficheiro:Flag_of_Spanish.svg'										
										),
                                        (
                                            'australiano(a)',
											'AU',
                                            'https://pt.wikipedia.org/wiki/Ficheiro:Flag_of_Australia.svg'
);

insert into tbl_filme (
                                            nome, 
                                            sinopse,
                                            duracao,
                                            data_lancamento,
                                            data_relancamento,
                                            foto_capa,
                                            valor_unitario,
											classificacao_id,
                                            genero_id,
                                            nacionalidade_id
                                    ) values(
                                           'Alice no país das maravilhas',
                                           'Alice (Mia Wasikowska) é uma jovem de 17 anos que passa a seguir um coelho branco apressado, que sempre olha no relógio.
                                            Ela entra em um buraco que a leva ao País das Maravilhas, um local onde esteve há dez anos apesar de nada se lembrar dele.',
                                           '02:00:00',
                                           '2010-02-25',
                                           null,
                                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH0iohZHNevOaKw-6m7-_XZFBkIj8vahyK_D7oM8lJ&s',
                                           '20',
                                           '3',
                                           '5',
                                           '2'
										),
                                        (
                                           "Frankewennie",  
                                           "O curta-metragem Frankenweenie, conta a história do jovem Victor Frankenstein, um garoto inteligente e criativo que gosta de ficção científica e tem como melhor amigo o seu cachorro Sparky, 
                                            com quem faz filmes amadores para mostrar aos seus pais e amigos.",
                                           '01:27:00',
                                           '2012-11-02', 
                                            null,
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH0iohZHNevOaKw-6m7-_XZFBkIj8vahyK_D7oM8lJ&s,', 
                                            '40.00',
                                            '2',
                                            '5',
                                            '2'
                                );

insert into tbl_ator (
                                          nome,
                                          nome_artistico,
                                          biografia,
                                          data_nascimento,
                                          data_falecimento,
                                          foto
								) values (
                                          'Mia Wasikowska',
                                          'Mia Wasikowska',
										  'Mia Wasikowska é uma atriz australiana, de ascendência polonesa. Ela ganhou reconhecimento mundial em 2010 depois de estrelar como Alice em Alice no País das Maravilhas de Tim Burton',
                                          '1989-09-25',
                                          null,
                                          'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcSbtNpoOhz9RPQkubxVXhzt1HmYK6nirdftZW0Hd9gz_m-qtojq641VLQw00lPdFzbRWpp2qsAN9anJsGs'
                                           
);

insert into tbl_ator_filme (
                                         ator_id,
										 filme_id
								) values (
                                         1,
                                         1
);

insert into tbl_diretor (
                                          nome,
                                          nome_artistico,
                                          biografia,
                                          data_nascimento,
                                          data_falecimento,
                                          foto
								) values (
                                          'Timothy Walter Burton',
                                          'Tim Burton',
                                          'Timothy "Tim" Walter Burton é um cineasta, produtor, roteirista, escritor, animador e desenhista norte-americano. Seus filmes apresentam, sempre, aspectos góticos, fantasiosos, excêntricos ou sombrios. Frequentemente, seus filmes acompanham os atores Johnny Depp (que na vida real é seu grande amigo), Winona Ryder e Helena Bonham Carter (com quem Burton mantinha um relacionamento sério desde 2001 até 2014 e tem dois filhos) e Danny Elfman compondo sempre a trilha sonora. Amante dos grandes nomes dos filmes de terror, já realizou projetos sobre Ed Wood e chamou para estrelar seus trabalhos, os notórios atores Vincent Price e Christopher Lee, seus ídolos.',
                                          '1958-09-25',
                                          null,
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Tim_Burton_%287587109150%29.jpg/250px-Tim_Burton_%287587109150%29.jpg'
);

insert into tbl_diretor_filme (
                                          diretor_id,
										  filme_id
								) values (
                                          1,
                                          1
									),
                                    (
                                          1,
                                          2
);

insert into tbl_ator_nacionalidade (
                                         ator_id,
                                         nacionalidade_id
								) values (
                                         1,
                                         5
);

insert into tbl_diretor_nacionalidade (
                                         diretor_id,
                                         nacionalidade_id
							   ) values (
                                         1,
                                         2
);

insert into tbl_usuario (
                                        nome,
                                        email,
                                        senha
							 ) values (
                                        'Ivania Rufino',
                                        'ivaniarufino@gmail.com',
                                        '1234iv'
);

insert into tbl_funcionario (
                                        nome,
                                        email,
                                        senha,
                                        telefone
							 ) values (
                                        'Giovanna Belo',
                                        'giovbelolo12@gmail.com',
                                        'idk12',
                                        '11 99615-6431'
);

insert into tbl_filmes_salvos (
                                     filme_id,
                                     usuario_id
							) values (
                                     2,
                                     1
);

select tbl_filme.nome as nome, tbl_filme.sinopse as sinopse, tbl_filme.duracao as duracao, tbl_filme.data_lancamento as data_lancamento, 
tbl_filme.data_relancamento as data_relancamento, tbl_filme.foto_capa as foto_capa, tbl_filme.valor_unitario as valor_unitario,
tbl_nacionalidade.gentilico as nacionalidade, tbl_classificacao.nome as classificacao, tbl_genero.nome as genero from tbl_filme 
join tbl_nacionalidade on tbl_filme.nacionalidade_id =  tbl_nacionalidade.id
join tbl_classificacao on tbl_filme.classificacao_id = tbl_classificacao.id
join tbl_genero on tbl_filme.genero_id = tbl_genero.id;



/*show tables;

desc tbl_filme;


select * from tbl_filme where nome like "F%";

select id from tbl_filme order by id desc limit 1;

#last_insert_id() permite retornar o último id inserido em uma tabela
#cast() - permite realizar a conversão de tipo de dados durante o select

select cast(last_insert_id() as decimal) as id from tbl_filme limit 1;

update tbl_filme set nome = 'Frozen' where id = 1;

select * from  tbl_filme;

update tbl_filme set nome = 'Alice no país das maravilhas' where id = 1; */

update tbl_usuario set nome = tbl_usuario.nome, email = tbl_usuario.email, senha = tbl_usuario.senha where id = 2