> library(tidyverse)
> library(readxl)
> library(ggplot2)
> library(dplyr)
> 
  > Data <- read_excel("/Users/hqn200/Desktop/Texas.xlsx")
  > df <- Data                                                                          
  > dim(df)
  [1] 10  2
  > colnames(df)
  [1] "Year"       "Population"
  > X <- df$Year
  > Y <- df$Population
  > options(scipen=999)
  > ggplot(df,  ylim=c(20000000,30000000), aes(x=X, y=Y)) + 
    +        geom_point() + geom_smooth(method=lm, se = FALSE) +
    +        labs(x = "Year", y = "Population") +
    +        labs(title = "Texas state population from 2010 to 2019") +
    +        theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=9, hjust=0.5)) +
    +        theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=9))
  `geom_smooth()` using formula 'y ~ x'
  > 
    > ps_2020 = lm(Population ~ Year, data=df)
  > summary(ps_2020)
  
  Call:
    lm(formula = Population ~ Year, data = df)
  
  Residuals:
    Min     1Q Median     3Q    Max 
  -99722 -37220 -12810  42411 101145 
  
  Coefficients:
    Estimate Std. Error t value         Pr(>|t|)    
  (Intercept) -833917553   14823968  -56.26 0.00000000001107 ***
    Year            427446       7359   58.09 0.00000000000857 ***
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
  
  Residual standard error: 66840 on 8 degrees of freedom
  Multiple R-squared:  0.9976,	Adjusted R-squared:  0.9973 
  F-statistic:  3374 on 1 and 8 DF,  p-value: 0.000000000008567
  
  > predict_values <- predict(ps_2020, data.frame(Year = c(2020,2021,2022,2023,2024)))
  > predict_values
  1        2        3        4        5 
  29523049 29950495 30377940 30805386 31232832 
  > df2 = rbind(df, data.frame("Year" = c(2020:2024), "Population" = c(predict_values[1:5])))
  > df2
  # A tibble: 15 x 2
  Year Population
  * <dbl>      <dbl>
    1  2010  25241971 
  2  2011  25645629 
  3  2012  26084481 
  4  2013  26480266 
  5  2014  26964333 
  6  2015  27470056 
  7  2016  27914410 
  8  2017  28295273 
  9  2018  28628666 
  10  2019  28995881 
  11  2020  29523049.
  12  2021  29950495.
  13  2022  30377940.
  14  2023  30805386.
  15  2024  31232832.
  > df3 <- df2
  > df3$year <- as.Date(as.character(df3$Year), format = "%Y")
  > options(scipen=999)
  > X <- df3$Year
  > Y <- df3$Population
  > 
    > ggplot(df2,  ylim=c(20000000,40000000), aes(x=X, y=Y)) + 
    +   geom_point() +
    +   geom_smooth(method=lm, se = FALSE) +
    +   labs(x = "Year", y = "Population") +
    +   labs(title = "Texas state population from 2010 to 2024") +
    +   theme(plot.title = element_text(family = "Trebuchet MS", color="#777777", face="bold", size=9, hjust=0.5)) +
    +   theme(axis.title = element_text(family = "Trebuchet MS", color="#777777", face="bold", size=9))
  `geom_smooth()` using formula 'y ~ x'
  > df2[c(11,13),]
  # A tibble: 2 x 2
  Year Population
  <dbl>      <dbl>
    1  2020  29523049.
  2  2022  30377940.
  > 
    > summary(df_lr2)
  Error in summary(df_lr2) : object 'df_lr2' not found
  > df2[c(13,15),]
  # A tibble: 2 x 2
  Year Population
  <dbl>      <dbl>
    1  2022  30377940.
  2  2024  31232832.
  > 
    > summary(df2)
  Year        Population      
  Min.   :2010   Min.   :25241971  
  1st Qu.:2014   1st Qu.:26722300  
  Median :2017   Median :28295273  
  Mean   :2017   Mean   :28240711  
  3rd Qu.:2020   3rd Qu.:29736772  
  Max.   :2024   Max.   :31232832  
  > save.image("~/Desktop/Stats.RData")