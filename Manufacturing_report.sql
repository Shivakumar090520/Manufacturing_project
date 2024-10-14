# ------------------- KPI-1 (MANUFACTURED QTY) -------------------------------------------------------------------- #


SELECT SUM(manufactured_qty) AS MANUFACTURED_QTY FROM MANUFACTURING_REPORT;


# ------------------- KPI-2 (REJECTED QTY) ------------------------------------------------------------------------ #


SELECT SUM(rejected_qty) AS REJECTED_QTY FROM MANUFACTURING_REPORT;


# ------------------ KPI-3 (PROCESSED QTY) ------------------------------------------------------------------------ #


SELECT SUM(manufactured_qty) AS MANUFACTURED_QTY,
SUM(rejected_qty) AS REJECTED_QTY,
SUM(manufactured_qty) - SUM(rejected_qty) AS PROCESSED_QTY
FROM MANUFACTURING_REPORT;


# ------------------ KPI-4 (WASTAGE QTY) -------------------------------------------------------------------------- #

SELECT SUM(produced_qty) AS PRODUCED_QTY,
SUM(processed_qty) AS PROCESSED_QTY,
SUM(produced_qty) - SUM(processed_qty) AS WASTAGE_QTY
FROM MANUFACTURING_REPORT;


# ------------------ KPI-5 (EMPLOYEE WISE REJECTED QTY) ----------------------------------------------------------- #


SELECT emp_code, emp_name, SUM(rejected_qty) AS TOTAL_REJECTED_QTY,
       RANK() OVER (ORDER BY SUM(rejected_qty) DESC) AS REJECTED_QTY_RANK
FROM MANUFACTURING_REPORT
GROUP BY emp_name, emp_code
ORDER BY REJECTED_QTY_RANK ASC;  


# ------------------- KPI-6 (MACHINE WISE REJECTED QTY) ------------------------------------------------------------ #

                    
SELECT machine_name, SUM(rejected_qty) AS TOTAL_REJECTED_QTY,
       RANK() OVER (ORDER BY SUM(rejected_qty) DESC) AS REJECTED_QTY_RANK
FROM MANUFACTURING_REPORT
GROUP BY machine_name
ORDER BY REJECTED_QTY_RANK ASC;         
                    
                    
# ------------------- KPI-7 (PRODUCTION COMPARISON TREND) ---------------------------------------------------------#


SELECT fiscal_date AS fiscal_date,
       SUM(manufactured_qty) AS MANUFACTURED_QTY,
       SUM(rejected_qty) AS REJECTED_QTY,
       SUM(processed_qty) AS PROCESSED_QTY
FROM 
    MANUFACTURING_REPORT
GROUP BY 
    FISCAL_DATE
UNION ALL
SELECT 
    'Grand Total',
    SUM(manufactured_qty),
    SUM(rejected_qty),
    SUM(processed_qty)
FROM 
    MANUFACTURING_REPORT;
  
  
# ----------------------- KPI-8 (MANUFACUTURED Vs REJECTED QTY) ---------------------------------------------------- #


SELECT SUM(manufactured_qty) AS TOTAL_MANUFACTURED,
       SUM(rejected_qty) AS Total_REJECTED
FROM MANUFACTURING_REPORT;


# ----------------------- KPI-9 (DEPARTMENT WISE MANUFACTURED Vs REJECTED QTY) ------------------------------------- #


SELECT department_name,
       SUM(manufactured_qty) AS MANUFACTURED_QTY,
       SUM(rejected_qty) AS REJECTED_QTY
FROM MANUFACTURING_REPORT
GROUP BY department_name
ORDER BY department_name DESC;


# ---------------------- KPI-10 (EMP WISE REJECTED QTY) ------------------------------------------------------------ #


SELECT machine_code, SUM(rejected_qty) AS TOTAL_REJECTED_QTY,
       RANK() OVER (ORDER BY SUM(rejected_qty) DESC) AS REJECTED_QTY_RANK
FROM MANUFACTURING_REPORT
GROUP BY machine_code
ORDER BY REJECTED_QTY_RANK ASC;
                    
                    
