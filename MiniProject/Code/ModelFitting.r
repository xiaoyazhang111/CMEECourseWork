library(dplyr)
library(repr)
library(ggplot2) 
library(tidyr)
library(minpack.lm)
options(repr.plot.width=4, repr.plot.height= 4) # Change plot sizes (in cm) - THIS BIT OF CODE IS ONLY RELEVANT IF YOU ARE USING A JUPYTER NOTEBOOK -- IGNORE OTHERWISE
require("minpack.lm")
setwd("/Users/zhangxiaoya/CMEECoursework//MiniProject/code")
options(warn=-1)

# Open the modified data list.
data <- read.csv("../Data/LIST.csv", header = TRUE)
data <- data.frame(data)
graphics.off()
# Specify model functions.
logistic_model <- function(N_0, N_max, r_max, t){ # The classic logistic equation
  return((N_0 * N_max * exp(r_max*t)) / (N_max + N_0 * (exp(r_max*t) - 1)))
}

logisticlag_model <- function(N_0, N_max, r_max, t, t_lag){# N_0:initial population size, r: maximum growth rate, K: carrying capacity
  return(N_0 + (N_max - N_0) / (1 + exp(4 * r_max * (t_lag - t) / (N_max - N_0) + 2)))
}

gompertz_model <- function(N_0, N_max, r_max, t, t_lag){ # Modified gompertz growth model
  return(N_0 + (N_max - N_0) * exp(-exp(r_max * exp(1) * (t_lag - t)/((N_max - N_0) * log(10)) + 1)))
} 

baranyi_model <- function(N_0, N_max, r_max, t, t_lag){ # Baranyi model
  return(N_max + log10((-1+exp(r_max*t_lag) + exp(r_max*t))/(exp(r_max*t) - 1 + exp(r_max*t_lag) * 10^(N_max-N_0))))
}

buchanan_model <- function(t, r_max, N_max, N_0, t_lag){ # Buchanan model
  return(N_0 + (t >= t_lag) * (t <= (t_lag + (N_max - N_0) * log(10)/r_max)) * r_max * (t - t_lag)/log(10) + (t >= t_lag) * (t > (t_lag + (N_max - N_0) * log(10)/r_max)) * (N_max - N_0))
}


fit_logistic <- try(nlsLM(Log10N ~ logistic_model(N_0, N_max, r_max, t = Time), data = data_fit, start = c(N_0 = N_0_start, N_max = N_max_start, r_max = r_max_start), control = nls.lm.control(maxiter = 100)), silent = T) #Running the logistic model with prior estimated starting values, but using try to keep going when it fails to optimise
if (class(fit_logistic) != 'try-error'){
  df_logistic$Model <- "Logistic"
  names(df_logistic) <- c("Time", "PopBio", "model")
} else {
  print("error!")
  df_logistic$Model <- "Logistic"
  names(df_logistic) <- c("Time", "PopBio", "model")
}

fit_gompertz <- try(nlsLM(Log10N ~ gompertz_model(N_0, N_max, r_max, t = Time, t_lag), data = data_fit, start = c(N_0 = N_0_start, N_max = N_max_start, r_max = r_max_start, t_lag = t_lag_start), control = nls.lm.control(maxiter = 100)), silent = T) #Running the Gompertz model with prior estimated starting values, but using try to keep going when it fails to optimise
if (class(fit_gompertz) != 'try-error'){

  df_gompertz$Model <- "Gompertz"
  names(df_gompertz) <- c("Time", "PopBio", "model")
  
} else {
  print("error!")
  df_gompertz$Model <- "Gompertz"
  names(df_gompertz) <- c("Time", "PopBio", "model")
}

fit_baranyi <- try(nlsLM(Log10N ~ baranyi_model(N_0, N_max, r_max, t = Time, t_lag), data = data_fit, start = c(N_0 = N_0_start, N_max = N_max_start, r_max = r_max_start, t_lag = t_lag_start), control = nls.lm.control(maxiter = 100)), silent = T) #Running the Baranyi model with prior estimated starting values, but using try to keep going when it fails to optimise
if (class(fit_baranyi) != 'try-error'){
  df_baranyi$Model <- "Baranyi"
  names(df_baranyi) <- c("Time", "PopBio", "model")
} else {
  print("error!")
  df_baranyi$Model <- "Baranyi"
  names(df_baranyi) <- c("Time", "PopBio", "model")
}


fit_buchanan <- try(nlsLM(Log10N ~ buchanan_model(N_0, N_max, r_max, t = Time, t_lag), data = data_fit, start = c(N_0 = N_0_start, N_max = N_max_start, r_max = r_max_start, t_lag = t_lag_start), control = nls.lm.control(maxiter = 100)), silent = T) #Running the Baranyi model with prior estimated starting values, but using try to keep going when it fails to optimise
if (class(fit_buchanan) != 'try-error'){
  df_buchanan$Model <- "Buchanan"
  names(df_buchanan) <- c("Time", "PopBio", "model")
} else {
  print("error!")
  df_buchanan$Model <- "Buchanan"
  names(df_buchanan) <- c("Time", "PopBio", "model")
}  


