
/**************************************************************************/
/*  INEP/Daeb-Diretoria de Avaliação da Educação Básica              	  */      
/*                                   									  */	
/*  Coordenação-Geral de Instrumentos e Medidas (CGIM)					  */
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
/* Para abrir os microdados é necessário salvar este programa e o arquivo */
/* MICRODADOS_ENEM_ESCOLA.CSV no diretório C:\ do computador.		      */
/*															 			  */                                           
/* Ao terminar esses procedimentos execute o programa salvo utilizando    */
/* as variáveis de interesse.                                             */
/**************************************************************************/
/*				                  ATENÇÃO                                 */  
/**************************************************************************/
/* Este programa abre a base de dados com os rótulos das variáveis de	  */
/* acordo com o dicionário de dados que compõem os microdados. Para abrir */
/* os dados sem os rótulos basta importar diretamente no SAS.			  */
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
NU_ANO = 'Ano da edição do ENEM por Escola'
CO_UF_ESCOLA = 'Código da Unidade da Federação da escola.'
SG_UF_ESCOLA = 'Sigla da Unidade da Federação da escola.'
CO_MUNICIPIO_ESCOLA = 'Código do município da escola.'
NO_MUNICIPIO_ESCOLA = 'Nome do município da escola.'
CO_ESCOLA_EDUCACENSO = 'Código da Escola.'
NO_ESCOLA_EDUCACENSO = 'Nome da Escola no Educacenso do ano anterior.'
TP_DEPENDENCIA_ADM_ESCOLA = 'Tipo da dependência administrativa da entidade (Escola) do Educacenso.'
TP_LOCALIZACAO_ESCOLA = 'Tipo de Localização da escola. '
NU_MATRICULAS = 'Número de alunos matriculados no Censo Escolar na 3ª e 4ª do Ensino Médio. '
NU_PARTICIPANTES_NEC_ESP = 'Número de Participantes do Enem que cumprem os requisitos de participação no cálculo da média e possui necessidade especial.'
NU_PARTICIPANTES = 'Número de Participantes do Enem que cumprem os requisitos de participação no cálculo da média. '
NU_TAXA_PARTICIPACAO = 'A taxa de participação é o número total de participantes no ENEM da escola dividido pelo número de matriculados nos anos finais do Ensino Médio da escola, informado no Censo Escolar.'
NU_MEDIA_CN = 'Média das notas de Ciências da Natureza do Ensino Médio Regular.'
NU_MEDIA_CH = 'Média das notas de Ciências Humanas do Ensino Médio Regular. '
NU_MEDIA_LP = 'Média das notas de Linguagens e Códigos do Ensino Médio Regular. '
NU_MEDIA_MT = 'Média das notas de Matemática do Ensino Médio Regular. '
NU_MEDIA_RED = 'Média das notas de Redação do Ensino Médio Regular. '
NU_MEDIA_OBJ = 'Média da prova objetiva do Ensino Médio Regular. '
NU_MEDIA_TOT = 'Média Total (Redação e Prova Objetiva) Ensino Médio Regular corrigida pelo número de participantes.'
INSE = 'Indicador de Nível Socioeconômico da escola.'
PC_FORMACAO_DOCENTE = 'Indicador de Adequação da Formação Docente da escola para lecionar no Ensino Médio.'
NU_TAXA_PERMANENCIA = 'Indicador de Permanência na Escola para o Ensino Médio'
NU_TAXA_APROVACAO = 'Taxa de aprovação dos alunos no Ensino Médio'
NU_TAXA_REPROVACAO = 'Taxa de reprovação dos alunos no Ensino Médio'
NU_TAXA_ABANDONO = 'Taxa de abandono dos alunos no Ensino Médio'
PORTE_ESCOLA = 'O indicador de porte da escola '
;                                                                                                                 ;                                                                                                                                                      
RUN;