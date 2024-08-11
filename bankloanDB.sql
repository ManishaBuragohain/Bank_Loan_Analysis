create database BankLoanDB;
use BankLoanDB;

select * from bank_load_data;

select count(id) as Total_Loan_Applications from bank_load_data;

select count(id) as PMTD_Total_Loan_Applications from bank_load_data
where MONTH(issue_date) = 11 AND YEAR(issue_date)=2021;

SELECT SUM(loan_amount) as MTD_Total_Funded_Amt from bank_load_data
where MONTH(issue_date) = 12 AND YEAR(issue_date)=2021;

SELECT SUM(loan_amount) as PMTD_Total_Funded_Amt from bank_load_data
where MONTH(issue_date) = 11 AND YEAR(issue_date)=2021;

SELECT SUM(total_payment) as PMTD_Total_Amount_recieved from bank_load_data
where month(issue_date) = 11 and year(issue_date) = 2021;

SELECT ROUND(AVG(int_rate),4) * 100 as 
PMTD_Avg_Interest_Rate 
from bank_load_data
WHERE MONTH(issue_date )= 11 and
YEAR(issue_date) = 2021;

SELECT ROUND(AVG(DTI),4) * 100 
AS MTD_Avg_dti from 
bank_load_data
Where month(issue_date) = 11
and year(issue_date) = 2021;

select loan_status FROM bank_load_data;
select (count(case when loan_status
= 'Fully Paid' Or loan_status ='Current'
then id end)
* 100)
/
COUNT(id) as Good_loan_percentage
from bank_load_data;

select count(id) AS Good_loan_Applications
from bank_load_data where
loan_status = 'Fully Paid' or 
loan_status = 'Current';

select sum(total_payment) as 
good_loan_Recieved_amount
from bank_load_data where loan_status ='Fully
Paid' OR loan_status = 'Current';

select 
(count(case when loan_status
= 'Charged Off' THEN id END) * 100.0)
/
COUNT(id) as Bad_loan_percentage
from bank_load_data;

select count(id) as Bad_Loan_Applications
from bank_load_data
where loan_status = 'Charged Off';

select sum(total_payment) as
Bad_Loan_Amount_Received
from bank_load_data
where loan_status = 'Charged Off';

select 
 loan_status,
       COUNT(id) as Total_Loan_applications,
	   SUM(total_payment) as Total_Amount_received,
	   SUM(loan_amount) as Total_Funded_Amount,
	   AVG(int_rate * 100) as Interest_rate,
	   AVG(dti * 100) as DTI

	   from bank_load_data
	   group by loan_status

       select 
   loan_status,
       sum(total_payment) as MTD_Total_Amount_Received,
	   sum(loan_amount) as MTD_total_Funded_Amount
   from bank_load_data
   where month(issue_date) = 12
   group by loan_status;

   select * from bank_load_data;

   SELECT 
   Month(issue_date) as Month_Number,
   DATENAME(month,issue_date) as Month_Name,
   count(id) as Total_loan_Application,
   sum(loan_amount) as Total_Funded_Amount,
   sum(total_payment) as Total_Received_Amount
   from bank_load_data
   group by month(issue_date),
   DATENAME(month,issue_date)
   order by Month(issue_date)
   ;

   SELECT 
   address_state,
   count(id) as Total_loan_Application,
   sum(loan_amount) as Total_Funded_Amount,
   sum(total_payment) as Total_Received_Amount
   from bank_load_data
   group by address_state
   order by address_state

      SELECT 
   address_state,
   count(id) as Total_loan_Application,
   sum(loan_amount) as Total_Funded_Amount,
   sum(total_payment) as Total_Received_Amount
   from bank_load_data
   group by address_state
   order by count(id) desc;

    SELECT 
    emp_length,
   count(id) as Total_loan_Application,
   sum(loan_amount) as Total_Funded_Amount,
   sum(total_payment) as Total_Received_Amount

    from bank_load_data
    group by  term
    order by  term ;


SELECT 
   emp_length,
   count(id) as Total_loan_Application,
   sum(loan_amount) as Total_Funded_Amount,
   sum(total_payment) as Total_Received_Amount

    from bank_load_data
    group by  emp_length
    order by  emp_length desc;

	SELECT 
   emp_length,
   count(id) as Total_loan_Application,
   sum(loan_amount) as Total_Funded_Amount,
   sum(total_payment) as Total_Received_Amount

    from bank_load_data
    group by  emp_length
    order by  count(id) desc;
  
  select * from bank_load_data;

  SELECT 
   purpose,
   count(id) as Total_loan_Application,
   sum(loan_amount) as Total_Funded_Amount,
   sum(total_payment) as Total_Received_Amount

    from bank_load_data
    group by purpose
    order by  count(id) desc;

	SELECT 
   home_ownership,
   count(id) as Total_loan_Application,
   sum(loan_amount) as Total_Funded_Amount,
   sum(total_payment) as Total_Received_Amount

    from bank_load_data
	where grade = 'A'
    group by home_ownership
    order by  count(id) desc;
  
  select * from bank_load_data;













