/* importing data from Excel
/* setting column names to match Excel file */
data collegiate;
infile '/home/u63996162/STAT468 Senior Research Project/College Sports Injury Outcomes.csv' dlm = ',' firstobs=2;
input Heart_Rate_BPM Respiratory_Rate_BPM Skin_Temperature_C
      Blood_Oxygen_Level_Percent Impact_Force_Newtons Cumulative_Fatigue_Index Duration_Minutes
      Injury_Risk_Score Injury_Occurred isHeavyContact isMildContact isIntense;
run;

/* proc print to check data set
proc print data=collegiate;
run;
*/

/* checks for multicollinearity */
proc reg data=collegiate;
model Injury_Occurred = Heart_Rate_BPM Respiratory_Rate_BPM Skin_Temperature_C 
		Blood_Oxygen_Level_Percent Impact_Force_Newtons Cumulative_Fatigue_Index
		Duration_Minutes isHeavyContact isMildContact isIntense / vif collinoint;
run;

/* binary logistic regression model */
proc logistic data=collegiate;
model Injury_Occurred = Heart_Rate_BPM Blood_Oxygen_Level_Percent Impact_Force_Newtons 
		Cumulative_Fatigue_Index Duration_Minutes isHeavyContact isMildContact isIntense;
run;


