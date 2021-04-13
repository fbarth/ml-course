# Material sobre Engenharia de Atributos

O que é Engenharia de Atributos, ou *feature engineering*, ...

The goal of feature engineering is simply to make your data better suited to the problem at hand. You might perform feature engineering to:

* improve a model's predictive performance
* reduce computational or data needs
* improve interpretability of the results

## Qual é a utilidade da etapa de Engenharia de Atributos?

You'll learn how to:

* determine which features are the most important with mutual information
* invent new features in several real-world problem domains
* encode high-cardinality categoricals with a target encoding
* create segmentation features with k-means clustering
* decompose a dataset's variation into features with principal component analysis

## Determine which features are the most important with mutual information

Um exemplo é apresentado no arquivo [MutualInformationExample](src/MutualInformationExample.ipynb).

## Normalização versus Scaling

Um exemplo é apresentado no arquivo [ScalingNormal](src/ScalingNormal.ipynb).

## Invent new features in several real-world problem domains

* counts
* Building-Up and Breaking-Down Features (Phone numbers, Street addresses, Product codes, Data and Times)
* group transforms: 

````python
customer["AverageIncome"] = (
    customer.groupby("State")  # for each state
    ["Income"]                 # select the income
    .transform("mean")         # and compute its mean
)
````

It's good to keep in mind your model's own strengths and weaknesses when creating features. Here are some guidelines:
* Linear models learn sums and differences naturally, but can't learn anything more complex.
* Ratios seem to be difficult for most models to learn. Ratio combinations often lead to some easy performance gains.
* Linear models and neural nets generally do better with normalized features. Neural nets especially need features scaled to values not too far from 0. Tree-based models (like random forests and XGBoost) can sometimes benefit from normalization, but usually much less so.
* Tree models can learn to approximate almost any combination of features, but when a combination is especially important they can still benefit from having it explicitly created, especially when data is limited.
* Counts are especially helpful for tree models, since these models don't have a natural way of aggregating information across many features at once.

````python
# One-hot encode Categorical feature, adding a column prefix "Cat"
X_new = pd.get_dummies(df.Categorical, prefix="Cat")
````


## Referências

* Pablo Duboue. The Art of Feature Engineering. Essentials for Machine Learning. Cambridge University Press. 2020. 

* [Feature Engineering para Variáveis Categóricas – Target Encoding e Variantes](https://dataml.com.br/feature-engineering-para-variaveis-categoricas-target-encoding/)

