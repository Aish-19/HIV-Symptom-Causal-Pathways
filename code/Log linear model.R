library(MASS)
df = read.csv('/Users/Aishwarya/Data 556/Assignment/Code/joachim-ic.csv')
df <- subset(df, select = -time)
class(df)

# Convert variables to factors
df$sscf <- factor(df$ssc2, levels=c(0,1,2,3), ordered=TRUE)
df$sscw <- factor(df$ssc4, levels=c(0,1,2,3), ordered=TRUE)
df$ic    <- factor(df$ic, levels=c(0,1))

#####Question 1#####
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

#####Question 2#####
m_w_f = polr(sscw ~ sscf, data=df, method="logistic", Hess = TRUE)
summary(m_w_f)
BIC(m_w_f)

m_w_ic = polr(sscw ~ ic, data=df, method="logistic", Hess = TRUE)
summary(m_w_ic)
BIC(m_w_ic)

m_w_ic_f = polr(sscw ~ ic + sscf, data=df, method="logistic", Hess = TRUE)
summary(m_w_ic_f)
BIC(m_w_ic_f)







######Question 3 Code######
df = read.csv('/Users/Aishwarya/Data 556/Assignment/Code/joachim-ic.csv')

#check column names
head(df)

# Convert variables to factors
df$sscf <- factor(df$ssc2, levels = 0:3)
df$ssw <- factor(df$ssc4, levels = 0:3)
df$ic    <- factor(df$ic,    levels = 0:1)

# Frequency table of all combinations
freq_table <- table(df$sscf, df$ssw, df$ic)
freq_table

# Create the 3-dimensional contingency table
table <- xtabs(~ sscf + ic + ssw, data = df)

# Display basic info
table
dim(table)
dimnames(table)

#check if the grand total matches with 1343
sum(table)

#Lets address sscf,ic,ssw as 1,2,3 respectively

#fit an independent log-linear model for complete independence
indep_fit = loglin(table, margin=list(1,2,3), fit=TRUE, param=TRUE)

# Extract statistics
G2 <- indep_fit$lrt
df  <- indep_fit$df
p   <- 1 - pchisq(G2, df)

cat("G2 =", G2, "\nDF =", df, "\nP-value =", p, "\n")

m_1_23_fit = loglin(table, margin=list(1,c(2,3)), fit=TRUE, param=TRUE)

# Extract statistics
G2 <- m_1_23_fit$lrt
df  <- m_1_23_fit$df
p   <- 1 - pchisq(G2, df)

cat("[1][23] one variable independence\n")
cat("G2 =", G2, "\nDF =", df, "\nP-value =", p, "\n")

m_2_13_fit = loglin(table, margin=list(2,c(1,3)), fit=TRUE, param=TRUE)

# Extract statistics
G2 <- m_2_13_fit$lrt
df  <- m_2_13_fit$df
p   <- 1 - pchisq(G2, df)

cat("[2][13] one variable independence\n")
cat("G2 =", G2, "\nDF =", df, "\nP-value =", p, "\n")

m_3_12_fit = loglin(table, margin=list(3,c(1,2)), fit=TRUE, param=TRUE)

# Extract statistics
G2 <- m_3_12_fit$lrt
df  <- m_3_12_fit$df
p   <- 1 - pchisq(G2, df)

cat("[2][13] one variable independence\n")
cat("G2 =", G2, "\nDF =", df, "\nP-value =", p, "\n")


m_12_13_fit = loglin(table, margin=list(c(1,2), c(1,3)), fit=TRUE, param=TRUE)
summary(m_12_13_fit)

G2 <- m_12_13_fit$lrt
df  <- m_12_13_fit$df
p   <- 1 - pchisq(G2, df)

cat("G2 =", G2, "\nDF =", df, "\nP-value =", p, "\n")


m_12_23_fit = loglin(table, margin=list(c(1,2), c(2,3)), fit=TRUE, param=TRUE)

# Extract statistics
G2 <- m_12_23_fit$lrt
df  <- m_12_23_fit$df
p   <- 1 - pchisq(G2, df)

cat("G2 =", G2, "\nDF =", df, "\nP-value =", p, "\n")

m_13_23_fit = loglin(table, margin=list(c(1,3), c(2,3)), fit=TRUE, param=TRUE)

# Extract statistics
G2 <- m_13_23_fit$lrt
df  <- m_13_23_fit$df
p   <- 1 - pchisq(G2, df)

cat("G2 =", G2, "\nDF =", df, "\nP-value =", p, "\n")


m_12_13_23_fit = loglin(table, margin=list(c(1,2), c(1,3),c(2,3)), fit=TRUE, param=TRUE)

# Extract statistics
G2 <- m_12_13_23_fit$lrt
df  <- m_12_13_23_fit$df
p   <- 1 - pchisq(G2, df)

cat("G2 =", G2, "\nDF =", df, "\nP-value =", p, "\n")


m_123_fit = loglin(table, margin=list(c(1,2,3)), fit=TRUE, param=TRUE)

# Extract statistics
G2 <- m_123_fit$lrt
df  <- m_123_fit$df
p   <- 1 - pchisq(G2, df)

cat("G2 =", G2, "\nDF =", df, "\nP-value =", p, "\n")

#Compare model 8 and model 9
#H0 - model 8 has better fit as it is simpler model 
#H1 - model 9 has better fit(complex model )
delta_G2 <- m_12_13_23_fit$lrt -  m_123_fit$lrt 
delta_df  <- m_12_13_23_fit$df - m_123_fit$df
p   <- 1 - pchisq(delta_G2, delta_df, lower.tail=FALSE)

cat("delta G2 =", delta_G2, "\ndelta DF =", delta_df, "\nP-value =", p, "\n")

#As p>0.05, keep model 5 and compare it with model 5 further

#Compare model 5 and model 8
#H0 - model 8 has better fit as it is simpler model 
#H1 - model 9 has better fit(complex model )
delta_G2 <- m_12_13_fit$lrt -  m_12_13_23_fit$lrt 
delta_df  <- m_12_13_fit$df - m_12_13_23_fit$df
p   <- 1 - pchisq(delta_G2, delta_df, lower.tail=FALSE)

cat("delta G2 =", delta_G2, "\ndelta DF =", delta_df, "\nP-value =", p, "\n")

