# Causal Pathway Analysis of HIV-Related Fatigue and Weakness

## Project Overview
This project focuses on the empirical use of graphical models as a powerful framework for identifying mediating variables in causal pathways. Specifically, we investigate the causal relationships among a behavioral intervention (Treatment), muscle weakness (SSC-W), and fatigue (SSC-F) in people living with HIV (PLHIV). Fatigue and weakness are common and debilitating symptoms in PLHIV, and understanding whether one mediates the effect of treatment on the other has important clinical implications.

The analysis is based on a secondary analysis of data from a longitudinal randomized controlled trial involving 609 participants and 1,343 repeated observations. All key variables are categorical, making this setting particularly suitable for contingency table analysis, graphical models, and loglinear modeling. Two competing causal hypotheses are of interest:
1. Muscle weakness mediates the effect of treatment on fatigue, or
2. Fatigue mediates the effect of treatment on muscle weakness.

Standard causal mediation techniques were unable to provide definitive answers to these questions due to the complexity of the data structure and the categorical nature of the variables. To address this gap, this project employs graphical models to explicitly represent and compare alternative causal pathways. By leveraging conditional independence structures and loglinear models, we aim to clarify the direction of mediation and demonstrate the practical utility of graphical modeling in causal inference for categorical clinical data.

## Objective
The primary objective is to evaluate the efficacy of the intervention and identify the structural pathways of symptoms. Specifically, the project aims to:
1. Determine if treatment directly reduces fatigue.
2. Assess if muscle weakness acts as a mediator between treatment and fatigue.
3. Identify the most parsimonious statistical model that explains the symptom interactions.

## Methodology
The analysis was conducted in R using the following statistical techniques:
- **Ordered Logistic Regression:** Modeled the 4-point ordinal scale of fatigue and weakness levels.
- **Model Selection (AIC/BIC/LRT):** Evaluated multiple model specifications to balance fit and complexity.
- **Hierarchical Loglinear Modeling:** Tested nine different interaction structures using multidimensional contingency tables ($4 \times 2 \times 4$).
- **Mediation Analysis:** Employed graphical model inference to determine direct vs. indirect effects.

## Key Statistical Findings
- **Treatment Efficacy:** The intervention significantly reduces the odds of higher fatigue categories by 29% (OR ≈ 0.71, $p < 0.05$).
- **Dominant Predictor:** Muscle weakness is the strongest predictor of fatigue; a one-level increase in weakness increases the odds of severe fatigue by ~23x.
- **Structural Pathway:** Loglinear analysis confirmed a conditional independence structure $[F,IC][F,W]$, indicating that treatment affects fatigue directly, which then influences weakness—meaning fatigue acts as a mediator.

## Conclusion
The findings suggest that while the behavioral intervention is effective in lowering fatigue, clinical management must prioritize addressing muscle weakness, as it is the primary driver of patient fatigue levels.
