# read in file from main
soccer2016to2021 <- read.csv("https://raw.githubusercontent.com/petecht66/STAT468-Senior-Research-Project/refs/heads/main/transformed-data/Professional%20Soccer%20Injuries%202016-2021.csv")

# describe the data and column headers
summary(soccer2016to2021)
head(soccer2016to2021)

# multiple linear regression model with current season's injury days as dependent variable
soccerInjuryModel <- lm(season_days_injured ~ season_minutes_played + age + bmi + season_days_injured_prev_season + 
isForward + isMidfielder + isDefender, data = soccer2016to2021)

# display results of multiple linear regression model
summary(soccerInjuryModel)
