/* importing data from Excel
/* setting column names to match Excel file */
data professionalSoccer;
infile '/home/u63996162/STAT468 Senior Research Project/Professional Soccer Injuries 2016-2021.csv' dlm = ',' firstobs=2;
input
    start_year
    season_days_injured
    season_minutes_played
    height_cm
    weight_kg
    position $
    age
    bmi
    work_rate_numeric
    position_numeric
    significant_injury_prev_season
    season_days_injured_prev_season
    isForward
    isMidfielder
    isDefender;
run;

/* creating regression and including diagnostic plots */
proc reg data=professionalSoccer plots=diagnostics;
	model season_days_injured = age season_minutes_played bmi 
	season_days_injured_prev_season isForward isMidfielder isDefender;
	output out=residuals predicted=predict residual=Residuals;
run;

/* normal probability plot of residuals */
proc univariate data=residuals;
    var Residuals;
    probplot Residuals / normal (mu=est sigma=est);
    title "Normal Probability Plot of Residuals";
run;

/* residuals versus predicted */
proc sgplot data=residuals;
    scatter x=predict y=Residuals;
    refline 0 / axis=y;
    title "Plot of Predicted Values Versus Residuals";
run;

/* creates a time-like variable starting at 1 */
data residuals_time;
   set residuals;
   obs_number + 1;
run;

/* scatter plot of residuals versus the time that they come in */
proc sgplot data=residuals_time;
    scatter x=obs_number y=Residuals;
    refline 0 / axis=y;
    title "Independence of Errors Test";
run;