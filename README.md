# Causal Pathway Analysis of HIV-Related Fatigue and Weakness

## Project Overview
This project performs a secondary statistical analysis of clinical data from a longitudinal randomized controlled trial involving 609 participants (1,343 observations) living with HIV. The goal is to determine the causal relationships between a behavioral intervention (Treatment), muscle weakness (SSC-W), and fatigue (SSC-F) using advanced categorical data modeling.

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
