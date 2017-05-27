CREATE DATABASE  seguradaora; /*DEFAULT CHARACTER SET utf8 */;

CREATE TABLE cliente (
  id serial NOT NULL,
  matricula character varying(128) NOT NULL,
  nome character varying(128) NOT NULL,
  identidade character varying(128) NOT NULL,
  cpf character varying(15) NOT NULL,
  estado_civil character varying(3) NOT NULL, -- S (solteiro), C (casado), V (viúvo), UE (União Estável), D (divorciado) 
  sexo character varying(3) NOT NULL, -- M (masculino),  F (feminino)
  situacao character varying(2) NOT NULL, -- matriculado (M) ou não matriculado (N)
  data_nascimento date DEFAULT NULL,
  data_matricula date DEFAULT NULL,
  profissao character varying(128) NOT NULL,
  email character varying(128) NOT NULL,
  telefone character varying(128) NOT NULL,
  endereco character varying(128) DEFAULT NULL,
  bairro character varying(128) DEFAULT NULL,
  cidade character varying(128) DEFAULT NULL,
  estado character varying(3) DEFAULT NULL, -- sigla do estado 'PB'
  cep character varying(9) NOT NULL,
  texto text NOT NULL
) ;

CREATE TABLE registro_seguro (
  id serial NOT NULL,
  cliente_id integer references cliente(id), -- chave estrangeira para o cliente do seguro
  veiculo_id integer references veiculo(id), -- chave estrangeira para o veículo 
  seguro_id integer references seguro(id) -- chave estrangeira para os dados do seguro 
) ;


CREATE TABLE veiculo (
  id serial NOT NULL,
  placa character varying(128) NOT NULL,
  modelo character varying(128) NOT NULL, -- modelo do veículo Gol, Siena, Palio, etc. 
  chassi character varying(128) NOT NULL,
  ano character varying(15) NOT NULL, -- ano de fabricação do veículo
  fabricante character varying(30) NOT NULL -- nome do fabricante do veículo ex. Ford, Fiat, etc.
) ;


CREATE TABLE seguro (
  id serial NOT NULL,
  valor character varying(128) NOT NULL,
  descricao text NOT NULL, -- informações de cobertura do seguro (cobre batidade e quebra de vidros, cobre danos pessoais, etc.)
  vigencia date NOT NULL  --- data de vencimento do seguro
) ;