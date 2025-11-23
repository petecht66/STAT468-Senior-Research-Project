/* importing data from Excel
/* setting column names to match Excel file */
data playingSurfaceNFL;
infile '/home/u63996162/STAT468 Senior Research Project/NFL Playing Surface and Injury Severity.csv' dlm = ',' firstobs=2;
input DaysMissed1 DaysMissed7 DaysMissed28 DaysMissed42 isSynthetic isKnee;
run;

/* proc print to check data set
proc print data=playingSurfaceNFL;
run;
*/

/* binary logistic regression model */
proc logistic data=playingSurfaceNFL;
model DaysMissed42 = isSynthetic isKnee;
run;
