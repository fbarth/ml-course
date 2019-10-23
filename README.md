# Machine Learning - TECH - ESPM

O objetivo deste projeto é manter os arquivos da disciplina de 
Aprendizagem de Máquina do curso de TECH da ESPM. 

Este projeto é composto pelos seguintes diretórios e arquivos: 

* **data**: possui todos os datasets que serão utilizados em sala de aula. Se o 
dataset do exercício ou projeto não estiver nesta pasta é por que o link do mesmo
foi informado em algum outro documento;
* **references**: nesta pasta você vai encontrar alguns ebooks 
ou artigos que serão utilizados na disciplina;
* **reports**: aqui é o lugar onde os resultados dos exercícios e projetos serão publicados;
* **scripts**: diretório que possui todos os scripts utilizados em sala de aula, e;
* **slides**: diretório que possui todos os slides utilizados em sala de aula.

Todo os exemplos e implementações estão escritos em R. No entanto, devido a recente popularidade
da linguagem de programação Python para a implementação para projetos de aprendizagem de máquina,
um dos objetivos neste semestre será ter exemplos e implementações em Python. Além disso, comparar
as duas linguagens de programação (R e Python) como ferramentas de suporte para o processo 
[CRISP-DM](https://en.wikipedia.org/wiki/Cross-industry_standard_process_for_data_mining).

No segundo semestre de 2019 vamos utilizar a ferramenta [Watson Studio](https://github.com/fbarth/ml-espm/blob/master/WatsonStudio.md) como ambiente de desenvolvimento para esta disciplina.

## Slides de suporte

* [Aprendizagem de Máquina](slides/Aula01-aprendizagemMaquina/aIntroducao.pdf)
* [Processo de KDD](slides/Aula02-processo-kdd/bigDataCienciaDadosKDD.pdf)
* [Pré-processamento de dados com R](slides/Aula03-processamentoDadosR/analiseExploratoria_v2.pdf)
* [Pré-processamento de dados com Python - material incompleto](slides/Aula03-processamentoDadosPython/analiseExploratoria_python.pdf)
* [Regressão Linear](slides/Aula04-regressao/regressao.pdf)
* [Regressão Linear com Python](slides/Aula04-regressao/regressao_py.pdf)
* [Design de projetos: validação](slides/Aula03-design/projetoEvalidacao.pdf)
* [Árvores de decisão](slides/Aula05-arvoresDecisao/arvoresDecisao.pdf)
* [Random Forest](slides/Aula05-randomForest/randomForest.pdf)
* [Aprendizado Baseado em Instâncias](slides/Aula06-aprendizadoBaseadoInstancias/aprendizadoBaseadoInstancias.pdf)
* ~[Algoritmos de Agrupamento](slides/Aula07-agrupamento/agrupamento.pdf)~ [Este conteúdo não será ministrado na versão 2019/02]
* ~[Regras de Associação](slides/Aula08-regrasAssociacao/regrasAssociacao.pdf)~ [Este conteúdo não será ministrado na versão 2019/02]

## Listas de exercícios

As listas de exercícios abaixo não são obrigatórias. No entanto, é fortemente recomendado 
que os participantes da disciplina façam os exercícios destas listas. Trata-se de uma excelente
ferramenta para exercitar os conceitos vistos em sala de aula.   

* [Lista 01](https://dataplatform.cloud.ibm.com/analytics/notebooks/v2/763da773-c309-4f99-8cb2-363cda8e39dd/view?access_token=0aef62cca019dde4f1af2b6ee05f1bc9d00741b2c1217e7c2a5c4e2bcc148b83)

* [Lista 02](https://dataplatform.cloud.ibm.com/analytics/notebooks/v2/71e4391f-12f7-4c83-b296-8e71bc78a724/view?access_token=ac671b79eab7a3773710ccc991f561e7009de7c42fcbdebac7dcf7f8205e3503)

## Lista de projetos

* [Projeto 01](https://github.com/fbarth/ml-espm/issues/1): pré-processamento e análise descritiva. Um exemplo de projeto bem implementado pode ser encontrado [aqui](https://hentai-lab.github.io/Machine-Learning/html/Atividade_1.html).

* [Projeto 02](https://github.com/fbarth/ml-espm/blob/master/projects/Project_01_2019.pdf): desenvolvimento de um modelo preditivo (classificador) que consegue identificar quando um cliente de uma instituição financeira irá ou não executar uma determinada transação. 

* [Projeto 03](https://dataplatform.cloud.ibm.com/analytics/notebooks/v2/c751db52-6370-4633-938f-a0410fc07e74/view?access_token=b3d438ad4d46d6e1cbe703c24f7bc1845306282abcfb9fc306d48cb81f2ea6a1): desenvolvimento de um modelo de regressão para preços de imóveis na cidade de São Paulo.

## Agenda para os últimos dias da disciplina

* ~09/10/2019: entrega do enunciado e execução do projeto 02;~
* ~16/10/2019: entrega do enunciado do projeto 03 e execução dos projetos 02 e 03;~
* 23/10/2019: execução dos projetos 02 e 03; 
* 30/10/2019: entrega das soluções para o projeto 03 e execução do projeto 02;
* 06/11/2019: avaliação final;
* 13/11/2019: Soul ESPM (mesa redonda sobre AI);
* 20/11/2019: Feriado;
* 27/11/2019: entrega e apresentação das soluções para o projeto 02;
* 04/12/2019: prova substitutiva, e;
* 09/12/2019: prova complementar. 

## Observações para o bom andamento da disciplina

É fortemente aconselhável que todos os alunos da disciplina sigam este projeto no GitHub através
da funcionalidade *Watching*. Desta forma, todos os alunos terão acesso as notícias, atividades 
e conteúdos novos da disciplina.

## Problemas até o momento discutidos em sala de aula (versão 2018 e 2019)

* Câncer de mama: https://www.kaggle.com/uciml/breast-cancer-wisconsin-data
* Valor de imóvel em São Paulo: data/20140917_imoveis_filtrados_final.csv_shaped.csv
* Madelon dataset: http://archive.ics.uci.edu/ml/datasets/madelon
* Pump it Up: Data Mining the Water Table: https://www.drivendata.org/competitions/7/pump-it-up-data-mining-the-water-table/
* Abalos sísmicos: https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv
* SNS Data
* Grocery Store: data("Groceries")
* Iris dataset: data(iris) ou load_iris()
* [Cars](data/cars.csv)