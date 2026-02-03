library(MASS)
df = read.csv('/Users/Aishwarya/Data 556/Assignment/Code/joachim-ic.csv')
df <- subset(df, select = -time)
class(df)

# Convert variables to factors
df$sscf <- factor(df$ssc2, levels=c(0,1,2,3), ordered=TRUE)
df$sscw <- factor(df$ssc4, levels=c(0,1,2,3), ordered=TRUE)
df$ic    <- factor(df$ic, levels=c(0,1))

#Question 1
#Fit an odered logistic regression model. Start with simpler model
m_f_w = polr(sscf ~ sscw, data=df, method="logistic", Hess = TRUE)
summary(m_f_w)

m_f_ic = polr(sscf ~ ic, data=df, method="logistic", Hess = TRUE)
summary(m_f_ic)

m_f_ic_w = polr(sscf ~ ic + sscw, data=df, method="logistic", Hess = TRUE)
summary(m_f_ic_w)

#Calculate BIC scores-
BIC(m_f_w)
BIC(m_f_ic)
BIC(m_f_ic_w)
length(coef(m_f_ic_w))

#Perform LRT between model 2 and model 3
m_f_w$deviance-m_f_ic_w$deviance
1-pchisq(m_f_w$deviance-m_f_ic_w$deviance,1)

#Question 2
m_w_f = polr(sscw ~ sscf, data=df, method="logistic", Hess = TRUE)
summary(m_w_f)
BIC(m_w_f)

m_w_ic = polr(sscw ~ ic, data=df, method="logistic", Hess = TRUE)
summary(m_w_ic)
BIC(m_w_ic)

m_w_ic_f = polr(sscw ~ ic + sscf, data=df, method="logistic", Hess = TRUE)
summary(m_w_ic_f)
BIC(m_w_ic_f)


