Show databases;
create database Dialysis_proj;

use dialysis_proj;
desc health_1;

select * from health_1;
select * from health_2;

select distinct `facility name` from health_1;
select `profit or non-profit` from health_1;





# KPI-1


select 
sum(`Number of patients included in the transfusion summary`)a,
SUM(`Number of patients in hypercalcemia summary`)b,
sum(`Hospitalizations included in hospital readmission summary`)c,
sum(`Number of Patients included in survival summary`)d,
sum(`Number of patients in long term catheter summary`)e,
sum(`Number of patients in nPCR summary`)f
 from health_1;
 
 
 
# KPI-2

select state,
sum(if(`profit or non-profit`="profit",1,0))as Profit,
sum(if(`profit or non-profit`="non-profit",'1',0)) as `Non-profit` from health_1
group by state;

select state,
sum(case when `profit or non-profit`='profit' then 1 end) as profit,
sum(case when `profit or non-profit`='non-profit' then 1 end) as `Non-profit` from health_1
group by state;


#KPI_3


select a.`Chain Organization`,a.`Facility Name`,b.`Facility Name`,count(b.`Total Performance Score`="no score")total
from health_1 as a inner join health_2 as b
on a.`Facility Name` = b.`Facility Name`
group by a.`Facility Name`,b.`Facility Name`,a.`Chain Organization`
order by total desc ;

select distinct a.`Chain Organization`,count(b.`Total Performance Score`="no score")total
from health_1 as a inner join health_2 as b
on a.`Facility Name` = b.`Facility Name`
group by a.`Chain Organization`
order by total desc limit 5;

#KPI_4

select * from health_1;
select `Chain Organization`,
count(`Number of Dialysis Stations`)as count from health_1
group by `Chain Organization` ;



#KPI_5


select 
sum(case when `Patient Transfusion category text` = "as expected" then 1 end) as `Patient Transfusion`,
sum(case when `Patient hospitalization category text` = "as expected" then 1 end) as `Patient hospitalization`,
sum(case when `Patient Hospital Readmission Category`  = "as expected" then  1 end) as `Patient Hospital Readmission`,
sum(case when `Patient Survival Category Text` = "as expected" then 1 end) as `Patient Survival`,
sum(case when `Patient Infection category text` = "as expected" then 1 end) as `Patient Infection`,
sum(case when `Fistula Category Text` = "as expected" then 1 end) as `Fistula Category`,
sum(case when `SWR category text` = "as expected" then 1 end) as `SWR category`,
sum(case when `PPPW category text` = "as expected" then 1 end)as `PPPW category`
from health_1;


#KPI_6

select * from health_1;

select avg(`PY2020 Payment Reduction Percentage`) as Average from health_2;
