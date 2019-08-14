/*****************************************************************************************************/
/*  INEP/Daeb-Diretoria de Avaliação da Educação Básica                                          */ 
/*                                   			                                    */
/*  Coordenação-Geral de Instrumentos e Medidas (CGIM)			*/
/*----------------------------------------------------------------------------------------------------------------------------*/
/*  PROGRAMA:                                                                                                      */
/*           INPUT_SPSS_MD_ENEM_ESCOLA                                                           */
/*----------------------------------------------------------------------------------------------------------------------------*/
/*DESCRICAO: PROGRAMA PARA LEITURA DA BASE DE DADOS DOS	*/
/* MICRODADOS DO ENEM POR ESCOLA  				*/
/*****************************************************************************************************/
/*****************************************************************************************************/
/* Obs:                                                                                                                    */
/* 		                                                                                           */
/* Para abrir os microdados é necessário salvar este programa e o arquivo                    */
/* MICRODADOS_ENEM_ESCOLA.csv no diretório C:\ do computador.	                  */
/*							 */ 
/*							 */
/* Para a leitura dos microdados é necessário a seleção do programa abaixo,               */
/* depois execute-o.						 */
/*							 */ 
/******************************************************************************************************/
/*                                                   ATENÇÃO                                                          */ 
/******************************************************************************************************/
/* Este programa abre a base de dados com os rótulos das variáveis de	                    */
/* acordo com o dicionário de dados que compõem os microdados. Para abrir                */
/* os dados sem os rótulos basta importar diretamente no SPSS.		  */
/* 							   */
/*******************************************************************************************************/



GET DATA
  /TYPE=TXT
  /FILE= "C:\MICRODADOS_ENEM_ESCOLA.csv"
  /DELCASE=LINE
  /DELIMITERS=";"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE= ALL
  /VARIABLES=
  NU_ANO F4.0
CO_UF_ESCOLA F3.0
SG_UF_ESCOLA A2.0
CO_MUNICIPIO_ESCOLA F8.0
NO_MUNICIPIO_ESCOLA A150.0
CO_ESCOLA_EDUCACENSO F9.0
NO_ESCOLA_EDUCACENSO A200.0
TP_DEPENDENCIA_ADM_ESCOLA F2.0
TP_LOCALIZACAO_ESCOLA F3.0
NU_MATRICULAS F9.0
NU_PARTICIPANTES_NEC_ESP F4.0
NU_PARTICIPANTES F9.0
NU_TAXA_PARTICIPACAO F8.2
NU_MEDIA_CN COMMA8.2
NU_MEDIA_CH COMMA8.2
NU_MEDIA_LP COMMA8.2
NU_MEDIA_MT COMMA8.2
NU_MEDIA_RED COMMA8.2
NU_MEDIA_OBJ COMMA8.2
NU_MEDIA_TOT COMMA8.2
INSE A7.0
PC_FORMACAO_DOCENTE COMMA8.2
NU_TAXA_PERMANENCIA COMMA8.2
NU_TAXA_APROVACAO COMMA8.2
NU_TAXA_REPROVACAO COMMA8.2
NU_TAXA_ABANDONO COMMA8.2
PORTE_ESCOLA A30.
.
CACHE.
EXECUTE.
DATASET NAME ENEM_ES WINDOW=FRONT.

VARIABLE LABELS
NU_ANO 	 		'Ano da edição do ENEM por Escola'
CO_UF_ESCOLA 		 'Código da Unidade da Federação da escola.'
SG_UF_ESCOLA 		 'Sigla da Unidade da Federação da escola.'
CO_MUNICIPIO_ESCOLA 	 'Código do município da escola.'
NO_MUNICIPIO_ESCOLA 	 'Nome do município da escola.'
CO_ESCOLA_EDUCACENSO 	 'Código da Escola.'
NO_ESCOLA_EDUCACENSO 	 'Nome da Escola no Educacenso do ano anterior.'
TP_DEPENDENCIA_ADM_ESCOLA  'Tipo da dependência administrativa da entidade (Escola) do Educacenso.'
TP_LOCALIZACAO_ESCOLA 	 'Tipo de Localização da escola. '
NU_MATRICULAS 	   	'Número de alunos matriculados no Censo Escolar na 3ª e 4ª do Ensino Médio. '
NU_PARTICIPANTES_NEC_ESP 	 'Número de Participantes do Enem que cumprem os requisitos de participação no cálculo da média e possui necessidade especial.'
NU_PARTICIPANTES 	 	'Número de Participantes do Enem que cumprem os requisitos de participação no cálculo da média. '
NU_TAXA_PARTICIPACAO 	 'A taxa de participação é o número total de participantes no ENEM da escola dividido pelo número de matriculados nos anos finais do Ensino Médio da escola, informado no Censo Escolar.'
NU_MEDIA_CN 	 	'Média das notas de Ciências da Natureza do Ensino Médio Regular.'
NU_MEDIA_CH 	 	'Média das notas de Ciências Humanas do Ensino Médio Regular. '
NU_MEDIA_LP 		 'Média das notas de Linguagens e Códigos do Ensino Médio Regular. '
NU_MEDIA_MT 		 'Média das notas de Matemática do Ensino Médio Regular. '
NU_MEDIA_RED 	 	'Média das notas de Redação do Ensino Médio Regular. '
NU_MEDIA_OBJ 		 'Média da prova objetiva do Ensino Médio Regular. '
NU_MEDIA_TOT 		 'Média Total (Redação e Prova Objetiva) Ensino Médio Regular corrigida pelo número de participantes.'
INSE 			 'Indicador de Nível Socioeconômico da escola.'
PC_FORMACAO_DOCENTE 	 'Indicador de Adequação da Formação Docente da escola para lecionar no Ensino Médio.'
NU_TAXA_PERMANENCIA 	 'Indicador de Permanência na Escola para o Ensino Médio'
NU_TAXA_APROVACAO 	 'Taxa de aprovação dos alunos no Ensino Médio'
NU_TAXA_REPROVACAO 	 'Taxa de reprovação dos alunos no Ensino Médio'
NU_TAXA_ABANDONO 	 	'Taxa de abandono dos alunos no Ensino Médio'
PORTE_ESCOLA 	 	'O indicador de porte da escola '
.

VALUE LABELS
TP_DEPENDENCIA_ADM_ESCOLA
	1	'Federal'
	2	'Estadual'
	3	'Municipal'
	4	'Privada';
/TP_LOCALIZACAO_ESCOLA
	1	'Urbana'
	2	'Rural';
.
