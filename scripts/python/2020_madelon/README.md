# Projeto usando dataset Madelon

O objetivo deste projeto é criar um classificador para o problema de [Madelon](http://archive.ics.uci.edu/ml/datasets/madelon). Este dataset é artificial. Foi um dataset proposto para uma competição de Machine Learning. 

O pré-processamento e análise descritiva inicial estão implementados no script [EDA&PreProcessing.ipynb](EDA&PreProcessing.ipynb). Os pipelines testados estão implementados nos arquivos: 

* [Decision Tree Classifier](pipeline_DecisionTreeClassifier.ipynb) com acurácia de 0.73900 (+/- 0.01914)
* [Gradient Boosting Classifier](pipeline_GradientBoostingClassifier.ipynb) com acurácia de 0.72700 (+/- 0.02400)
* [Random Forest Classsifier](pipeline_RandomForestClassifier.ipynb) com acurácia de 0.69600 (+/- 0.01102)
* [KNN](pipeline_KNN.ipynb) com acurácia de 0.63150 (+/- 0.01693)
* [Resultado de um processo de Auto Machine Learning apenas com hiper-parametrização](pipeline_auto_machine_learning.ipynb) com acurácia de 0.79950 (+/- 0.01600)

## TODO

Ainda falta testar pipelines onde: 

* é utilizado apenas um sub-set dos atributos. Somente aqueles atributos com maior ganho de informação.
* é utilizado algum tipo de técnica para reduzir a dimensionalidade dos atributos, por exemplo, PCA (isto não foi visto na versão 2020/2 da disciplina).
* fazer uso do resultado de um processo de Auto Machine Learning completo, com hiper-parametrização e engenharia de atributos. 

