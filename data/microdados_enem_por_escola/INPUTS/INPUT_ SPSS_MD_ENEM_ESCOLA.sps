/*****************************************************************************************************/
/*  INEP/Daeb-Diretoria de Avalia��o da Educa��o B�sica                                          */ 
/*                                   			                                    */
/*  Coordena��o-Geral de Instrumentos e Medidas (CGIM)			*/
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
/* Para abrir os microdados � necess�rio salvar este programa e o arquivo                    */
/* MICRODADOS_ENEM_ESCOLA.csv no diret�rio C:\ do computador.	                  */
/*							 */ 
/*							 */
/* Para a leitura dos microdados � necess�rio a sele��o do programa abaixo,               */
/* depois execute-o.						 */
/*							 */ 
/******************************************************************************************************/
/*                                                   ATEN��O                                                          */ 
/******************************************************************************************************/
/* Este programa abre a base de dados com os r�tulos das vari�veis de	                    */
/* acordo com o dicion�rio de dados que comp�em os microdados. Para abrir                */
/* os dados sem os r�tulos basta importar diretamente no SPSS.		  */
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
NU_ANO 	 		'Ano da edi��o do ENEM por Escola'
CO_UF_ESCOLA 		 'C�digo da Unidade da Federa��o da escola.'
SG_UF_ESCOLA 		 'Sigla da Unidade da Federa��o da escola.'
CO_MUNICIPIO_ESCOLA 	 'C�digo do munic�pio da escola.'
NO_MUNICIPIO_ESCOLA 	 'Nome do munic�pio da escola.'
CO_ESCOLA_EDUCACENSO 	 'C�digo da Escola.'
NO_ESCOLA_EDUCACENSO 	 'Nome da Escola no Educacenso do ano anterior.'
TP_DEPENDENCIA_ADM_ESCOLA  'Tipo da depend�ncia administrativa da entidade (Escola) do Educacenso.'
TP_LOCALIZACAO_ESCOLA 	 'Tipo de Localiza��o da escola. '
NU_MATRICULAS 	   	'N�mero de alunos matriculados no Censo Escolar na 3� e 4� do Ensino M�dio. '
NU_PARTICIPANTES_NEC_ESP 	 'N�mero de Participantes do Enem que cumprem os requisitos de participa��o no c�lculo da m�dia e possui necessidade especial.'
NU_PARTICIPANTES 	 	'N�mero de Participantes do Enem que cumprem os requisitos de participa��o no c�lculo da m�dia. '
NU_TAXA_PARTICIPACAO 	 'A taxa de participa��o � o n�mero total de participantes no ENEM da escola dividido pelo n�mero de matriculados nos anos finais do Ensino M�dio da escola, informado no Censo Escolar.'
NU_MEDIA_CN 	 	'M�dia das notas de Ci�ncias da Natureza do Ensino M�dio Regular.'
NU_MEDIA_CH 	 	'M�dia das notas de Ci�ncias Humanas do Ensino M�dio Regular. '
NU_MEDIA_LP 		 'M�dia das notas de Linguagens e C�digos do Ensino M�dio Regular. '
NU_MEDIA_MT 		 'M�dia das notas de Matem�tica do Ensino M�dio Regular. '
NU_MEDIA_RED 	 	'M�dia das notas de Reda��o do Ensino M�dio Regular. '
NU_MEDIA_OBJ 		 'M�dia da prova objetiva do Ensino M�dio Regular. '
NU_MEDIA_TOT 		 'M�dia Total (Reda��o e Prova Objetiva) Ensino M�dio Regular corrigida pelo n�mero de participantes.'
INSE 			 'Indicador de N�vel Socioecon�mico da escola.'
PC_FORMACAO_DOCENTE 	 'Indicador de Adequa��o da Forma��o Docente da escola para lecionar no Ensino M�dio.'
NU_TAXA_PERMANENCIA 	 'Indicador de Perman�ncia na Escola para o Ensino M�dio'
NU_TAXA_APROVACAO 	 'Taxa de aprova��o dos alunos no Ensino M�dio'
NU_TAXA_REPROVACAO 	 'Taxa de reprova��o dos alunos no Ensino M�dio'
NU_TAXA_ABANDONO 	 	'Taxa de abandono dos alunos no Ensino M�dio'
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
