
/**************************************************************************/
/*  INEP/Daeb-Diretoria de Avalia��o da Educa��o B�sica              	  */      
/*                                   									  */	
/*  Coordena��o-Geral de Instrumentos e Medidas (CGIM)					  */
/*------------------------------------------------------------------------*/
/*  PROGRAMA:                                                             */
/*           INPUT_SAS_MD_ENEM_ESCOLA.sas                         	  */
/*------------------------------------------------------------------------*/
/*  DESCRICAO: PROGRAMA PARA LEITURA DOS MICRODADOS DO ENEM POR ESCOLA    */    
/*                                                                        */
/**************************************************************************/
/**************************************************************************/
/* Obs:                                                                   */
/* 		                                                                  */
/* Para abrir os microdados � necess�rio salvar este programa e o arquivo */
/* MICRODADOS_ENEM_ESCOLA.CSV no diret�rio C:\ do computador.		      */
/*															 			  */                                           
/* Ao terminar esses procedimentos execute o programa salvo utilizando    */
/* as vari�veis de interesse.                                             */
/**************************************************************************/
/*				                  ATEN��O                                 */  
/**************************************************************************/
/* Este programa abre a base de dados com os r�tulos das vari�veis de	  */
/* acordo com o dicion�rio de dados que comp�em os microdados. Para abrir */
/* os dados sem os r�tulos basta importar diretamente no SAS.			  */
/* 																	      */ 																          
/**************************************************************************/



proc format;
	value $TP_DEP
		1='Federal'
		2='Estadual'
		3='Municipal'
		4='Privada';

	value  $TP_LOC
		1='Urbana'
		2='Rural';
	
run;


DATA WORK.DADOS_ENEM_ESCOLA;
INFILE 'C:\MICRODADOS_ENEM_ESCOLA.csv' /*local do arquivo*/
        LRECL=963
        FIRSTOBS=2
        DLM=';'
        MISSOVER
        DSD ;
INPUT
	NU_ANO :BEST4.
	CO_UF_ESCOLA :BEST3.
	SG_UF_ESCOLA :$CHAR2.
	CO_MUNICIPIO_ESCOLA :BEST8.
	NO_MUNICIPIO_ESCOLA :$CHAR150.
	CO_ESCOLA_EDUCACENSO :BEST9.
	NO_ESCOLA_EDUCACENSO :$CHAR200.
	TP_DEPENDENCIA_ADM_ESCOLA :$CHAR1.
	TP_LOCALIZACAO_ESCOLA :$CHAR1.
	NU_MATRICULAS :BEST9.
	NU_PARTICIPANTES_NEC_ESP :BEST4.
	NU_PARTICIPANTES :BEST9.
	NU_TAXA_PARTICIPACAO :BEST8.2
	NU_MEDIA_CN :BEST8.2
	NU_MEDIA_CH :BEST8.2
	NU_MEDIA_LP :BEST8.2
	NU_MEDIA_MT :BEST8.2
	NU_MEDIA_RED :BEST8.2
	NU_MEDIA_OBJ :BEST8.2
	NU_MEDIA_TOT :BEST8.2
	INSE :$CHAR7.
	PC_FORMACAO_DOCENTE :BEST7.2
	NU_TAXA_PERMANENCIA :BEST8.2
	NU_TAXA_APROVACAO :BEST8.2
	NU_TAXA_REPROVACAO :BEST8.2
	NU_TAXA_ABANDONO :BEST8.2
	PORTE_ESCOLA :$CHAR30.
;

ATTRIB TP_DEPENDENCIA_ADM_ESCOLA	FORMAT = $TP_DEP10.;
ATTRIB TP_LOCALIZACAO_ESCOLA 		FORMAT = $TP_LOC10.;

LABEL
NU_ANO = 'Ano da edi��o do ENEM por Escola'
CO_UF_ESCOLA = 'C�digo da Unidade da Federa��o da escola.'
SG_UF_ESCOLA = 'Sigla da Unidade da Federa��o da escola.'
CO_MUNICIPIO_ESCOLA = 'C�digo do munic�pio da escola.'
NO_MUNICIPIO_ESCOLA = 'Nome do munic�pio da escola.'
CO_ESCOLA_EDUCACENSO = 'C�digo da Escola.'
NO_ESCOLA_EDUCACENSO = 'Nome da Escola no Educacenso do ano anterior.'
TP_DEPENDENCIA_ADM_ESCOLA = 'Tipo da depend�ncia administrativa da entidade (Escola) do Educacenso.'
TP_LOCALIZACAO_ESCOLA = 'Tipo de Localiza��o da escola. '
NU_MATRICULAS = 'N�mero de alunos matriculados no Censo Escolar na 3� e 4� do Ensino M�dio. '
NU_PARTICIPANTES_NEC_ESP = 'N�mero de Participantes do Enem que cumprem os requisitos de participa��o no c�lculo da m�dia e possui necessidade especial.'
NU_PARTICIPANTES = 'N�mero de Participantes do Enem que cumprem os requisitos de participa��o no c�lculo da m�dia. '
NU_TAXA_PARTICIPACAO = 'A taxa de participa��o � o n�mero total de participantes no ENEM da escola dividido pelo n�mero de matriculados nos anos finais do Ensino M�dio da escola, informado no Censo Escolar.'
NU_MEDIA_CN = 'M�dia das notas de Ci�ncias da Natureza do Ensino M�dio Regular.'
NU_MEDIA_CH = 'M�dia das notas de Ci�ncias Humanas do Ensino M�dio Regular. '
NU_MEDIA_LP = 'M�dia das notas de Linguagens e C�digos do Ensino M�dio Regular. '
NU_MEDIA_MT = 'M�dia das notas de Matem�tica do Ensino M�dio Regular. '
NU_MEDIA_RED = 'M�dia das notas de Reda��o do Ensino M�dio Regular. '
NU_MEDIA_OBJ = 'M�dia da prova objetiva do Ensino M�dio Regular. '
NU_MEDIA_TOT = 'M�dia Total (Reda��o e Prova Objetiva) Ensino M�dio Regular corrigida pelo n�mero de participantes.'
INSE = 'Indicador de N�vel Socioecon�mico da escola.'
PC_FORMACAO_DOCENTE = 'Indicador de Adequa��o da Forma��o Docente da escola para lecionar no Ensino M�dio.'
NU_TAXA_PERMANENCIA = 'Indicador de Perman�ncia na Escola para o Ensino M�dio'
NU_TAXA_APROVACAO = 'Taxa de aprova��o dos alunos no Ensino M�dio'
NU_TAXA_REPROVACAO = 'Taxa de reprova��o dos alunos no Ensino M�dio'
NU_TAXA_ABANDONO = 'Taxa de abandono dos alunos no Ensino M�dio'
PORTE_ESCOLA = 'O indicador de porte da escola '
;                                                                                                                 ;                                                                                                                                                      
RUN;