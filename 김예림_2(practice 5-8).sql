HR@orcl> select	ROUND(MAX(salary),0) "Maximum", ROUND(MIN(salary),0) Minimum",
  2  			ROUND(SUM(salary),0) "Sum", 	ROUND(AVG(salary),0) "Average"
  3  from employees;

   Maximum    Minimum        Sum    Average                                                                             
---------- ---------- ---------- ----------                                                                             
     24000       2500     212230       9227                                                                             

HR@orcl> ed
Wrote file afiedt.buf

  1  select job_id,	ROUND(MAX(salary),0) "Maximum", ROUND(MIN(salary),0) "Minimum",
  2  			ROUND(SUM(salary),0) "Sum", 	ROUND(AVG(salary),0) "Average"
  3  from employees
  4* GROUP BY job_id
HR@orcl> /

JOB_ID        Maximum    Minimum        Sum    Average                                                                  
---------- ---------- ---------- ---------- ----------                                                                  
AC_MGR          12000      12000      24000      12000                                                                  
AC_ACCOUNT       8300       8300       8300       8300                                                                  
IT_PROG          9000       4200      19200       6400                                                                  
ST_MAN           5800       5800       5800       5800                                                                  
AD_ASST          4400       4400       4400       4400                                                                  
AD_VP           17000      17000      34000      17000                                                                  
MK_MAN          15730      15730      15730      15730                                                                  
SA_MAN          10500      10500      10500      10500                                                                  
MK_REP           6000       6000       6000       6000                                                                  
SA_REP          11000       7000      48600       9720                                                                  
AD_PRES         24000      24000      24000      24000                                                                  

JOB_ID        Maximum    Minimum        Sum    Average                                                                  
---------- ---------- ---------- ---------- ----------                                                                  
ST_CLERK         3500       2500      11700       2925                                                                  

12 rows selected.

HR@orcl> select job_id, COUNT(*)
  2  from employees
  3  GROUP BY job_id;

JOB_ID       COUNT(*)                                                                                                   
---------- ----------                                                                                                   
AC_ACCOUNT          1                                                                                                   
AC_MGR              2                                                                                                   
AD_ASST             1                                                                                                   
AD_PRES             1                                                                                                   
AD_VP               2                                                                                                   
IT_PROG             3                                                                                                   
MK_MAN              1                                                                                                   
MK_REP              1                                                                                                   
SA_MAN              1                                                                                                   
SA_REP              5                                                                                                   
ST_CLERK            4                                                                                                   

JOB_ID       COUNT(*)                                                                                                   
---------- ----------                                                                                                   
ST_MAN              1                                                                                                   

12 rows selected.

HR@orcl> select COUNT(DISTINCT manager_id) "Number of Manager"
  2  from employees;

Number of Manager                                                                                                       
-----------------                                                                                                       
                8                                                                                                       

HR@orcl> select MAX(salary) - MIN(salary) DIFFERENCE
  2  from employees;

DIFFERENCE                                                                                                              
----------                                                                                                              
     21500                                                                                                              

HR@orcl> select manager_id, MIN(salary) from employees
  2  where manager_id IS NOT NULL
  3  GROUP BY manager_id
  4  HAVING MIN(salary) > 6000
  5  ORDER BY MIN(salary) DESC;

MANAGER_ID MIN(SALARY)                                                                                                  
---------- -----------                                                                                                  
       102        9000                                                                                                  
       205        8300                                                                                                  
       149        7000                                                                                                  

HR@orcl> select count(*) total, sum(decode(TO_CHAR(hire_date, 'YYYY'), 1995, 1, 0)) "1995",
  2  sum(decode(TO_CHAR(hire_date, 'YYYY'), 1996, 1, 0)) "1996",
  3  sum(decode(TO_CHAR(hire_date, 'YYYY'), 1997, 1, 0)) "1997",
  4  sum(decode(TO_CHAR(hire_date, 'YYYY'), 1998, 1, 0)) "1998"
  5  from employees;

     TOTAL       1995       1996       1997       1998                                                                  
---------- ---------- ---------- ---------- ----------                                                                  
        23          1          2          2          3                                                                  

HR@orcl> select job_id "Job", SUM(DECODE(department_id, 20, salary)) "Dept 20",
  2  SUM(DECODE(department_id, 50, salary)) "Dept 50",
  3  SUM(DECODE(department_id, 80, salary)) "Dept 80",
  4  SUM(DECODE(department_id, 90, salary)) "Dept 90",
  5  SUM(salary) "Total"
  6  from employees
  7  GROUP BY job_id;

Job           Dept 20    Dept 50    Dept 80    Dept 90      Total                                                       
---------- ---------- ---------- ---------- ---------- ----------                                                       
AC_MGR                                                      24000                                                       
AC_ACCOUNT                                                   8300                                                       
IT_PROG                                                     19200                                                       
ST_MAN                      5800                             5800                                                       
AD_ASST                                                      4400                                                       
AD_VP                                            34000      34000                                                       
MK_MAN                                                      15730                                                       
SA_MAN                                10500                 10500                                                       
MK_REP           6000                                        6000                                                       
SA_REP                                19600                 48600                                                       
AD_PRES                                          24000      24000                                                       

Job           Dept 20    Dept 50    Dept 80    Dept 90      Total                                                       
---------- ---------- ---------- ---------- ---------- ----------                                                       
ST_CLERK                   11700                            11700                                                       

12 rows selected.

HR@orcl> select location_id, street_address, city, state_province, country_name
  2  from locations NATURAL JOIN countries;

LOCATION_ID STREET_ADDRESS                           CITY                           STATE_PROVINCE                      
----------- ---------------------------------------- ------------------------------ -------------------------           
COUNTRY_NAME                                                                                                            
----------------------------------------                                                                                
       1400 2014 Jabberwocky Rd                      Southlake                      Texas                               
United States of America                                                                                                
                                                                                                                        
       1500 2011 Interiors Blvd                      South San Francisco            California                          
United States of America                                                                                                
                                                                                                                        
       1700 2004 Charade Rd                          Seattle                        Washington                          
United States of America                                                                                                
                                                                                                                        

LOCATION_ID STREET_ADDRESS                           CITY                           STATE_PROVINCE                      
----------- ---------------------------------------- ------------------------------ -------------------------           
COUNTRY_NAME                                                                                                            
----------------------------------------                                                                                
       1800 460 Bloor St. W.                         Toronto                        Ontario                             
Canada                                                                                                                  
                                                                                                                        
       2500 Magdalen Centre, The Oxford Science Park Oxford                         Oxford                              
United Kingdom                                                                                                          
                                                                                                                        

HR@orcl> select last_name, department_id, department_name
  2  from employees JOIN departments
  3  USING (department_id);

LAST_NAME                 DEPARTMENT_ID DEPARTMENT_NAME                                                                 
------------------------- ------------- ------------------------------                                                  
Abel                                 80 Sales                                                                           
Davies                               50 Shipping                                                                        
De Haan                              90 Executive                                                                       
Dean                                 60 IT                                                                              
Ernst                                60 IT                                                                              
Fay                                  20 Marketing                                                                       
Gietz                               110 Accounting                                                                      
Hartstein                            40 Human Resource                                                                  
Higgins                             110 Accounting                                                                      
Hunold                               60 IT                                                                              
King                                 90 Executive                                                                       

LAST_NAME                 DEPARTMENT_ID DEPARTMENT_NAME                                                                 
------------------------- ------------- ------------------------------                                                  
Kochhar                              90 Executive                                                                       
Lorentz                              60 IT                                                                              
Matos                                50 Shipping                                                                        
Mourgos                              50 Shipping                                                                        
Popp                                110 Accounting                                                                      
Rajs                                 50 Shipping                                                                        
Raphealy                             60 IT                                                                              
Taylor                               80 Sales                                                                           
Vargas                               50 Shipping                                                                        
Whalen                               10 Administration                                                                  
Zlotkey                              80 Sales                                                                           

22 rows selected.

HR@orcl> ed
Wrote file afiedt.buf

  1  select e.last_name, e.job_id, e.department_id, d.department_name
  2  from employees e JOIN departments d
  3  ON (e.department_id = d.department_id)
  4  JOIN locations l 
  5  ON (d.location_id = l.location_id)
  6* WHERE LOWER(l.city) = 'toronto'
HR@orcl> /

LAST_NAME                 JOB_ID     DEPARTMENT_ID DEPARTMENT_NAME                                                      
------------------------- ---------- ------------- ------------------------------                                       
Fay                       MK_REP                20 Marketing                                                            

HR@orcl> select w.last_name "Employee", w.employee_id "EMP#", m.last_name "Manager", m.employee_id "Mgr#"
  2  from employees w join employees m
  3  ON (w.manager_id = m.manager_id);

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Higgins                          205 Whalen                           200                                               
Whalen                           200 Whalen                           200                                               
Zlotkey                          149 Hartstein                        201                                               
Mourgos                          124 Hartstein                        201                                               
De Haan                          102 Hartstein                        201                                               
Kochhar                          101 Hartstein                        201                                               
Dean                             115 Hartstein                        201                                               
Raphealy                         114 Hartstein                        201                                               
Hartstein                        201 Hartstein                        201                                               
Fay                              202 Fay                              202                                               
Higgins                          205 Higgins                          205                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Whalen                           200 Higgins                          205                                               
Popp                             113 Gietz                            206                                               
Gietz                            206 Gietz                            206                                               
Zlotkey                          149 Raphealy                         114                                               
Mourgos                          124 Raphealy                         114                                               
De Haan                          102 Raphealy                         114                                               
Kochhar                          101 Raphealy                         114                                               
Dean                             115 Raphealy                         114                                               
Raphealy                         114 Raphealy                         114                                               
Hartstein                        201 Raphealy                         114                                               
Zlotkey                          149 Dean                             115                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Mourgos                          124 Dean                             115                                               
De Haan                          102 Dean                             115                                               
Kochhar                          101 Dean                             115                                               
Dean                             115 Dean                             115                                               
Raphealy                         114 Dean                             115                                               
Hartstein                        201 Dean                             115                                               
Popp                             113 Popp                             113                                               
Gietz                            206 Popp                             113                                               
Zlotkey                          149 Kochhar                          101                                               
Mourgos                          124 Kochhar                          101                                               
De Haan                          102 Kochhar                          101                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Kochhar                          101 Kochhar                          101                                               
Dean                             115 Kochhar                          101                                               
Raphealy                         114 Kochhar                          101                                               
Hartstein                        201 Kochhar                          101                                               
Zlotkey                          149 De Haan                          102                                               
Mourgos                          124 De Haan                          102                                               
De Haan                          102 De Haan                          102                                               
Kochhar                          101 De Haan                          102                                               
Dean                             115 De Haan                          102                                               
Raphealy                         114 De Haan                          102                                               
Hartstein                        201 De Haan                          102                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Hunold                           103 Hunold                           103                                               
Lorentz                          107 Ernst                            104                                               
Ernst                            104 Ernst                            104                                               
Lorentz                          107 Lorentz                          107                                               
Ernst                            104 Lorentz                          107                                               
Zlotkey                          149 Mourgos                          124                                               
Mourgos                          124 Mourgos                          124                                               
De Haan                          102 Mourgos                          124                                               
Kochhar                          101 Mourgos                          124                                               
Dean                             115 Mourgos                          124                                               
Raphealy                         114 Mourgos                          124                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Hartstein                        201 Mourgos                          124                                               
Vargas                           144 Rajs                             141                                               
Matos                            143 Rajs                             141                                               
Davies                           142 Rajs                             141                                               
Rajs                             141 Rajs                             141                                               
Vargas                           144 Davies                           142                                               
Matos                            143 Davies                           142                                               
Davies                           142 Davies                           142                                               
Rajs                             141 Davies                           142                                               
Vargas                           144 Matos                            143                                               
Matos                            143 Matos                            143                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Davies                           142 Matos                            143                                               
Rajs                             141 Matos                            143                                               
Vargas                           144 Vargas                           144                                               
Matos                            143 Vargas                           144                                               
Davies                           142 Vargas                           144                                               
Rajs                             141 Vargas                           144                                               
Zlotkey                          149 Zlotkey                          149                                               
Mourgos                          124 Zlotkey                          149                                               
De Haan                          102 Zlotkey                          149                                               
Kochhar                          101 Zlotkey                          149                                               
Dean                             115 Zlotkey                          149                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Raphealy                         114 Zlotkey                          149                                               
Hartstein                        201 Zlotkey                          149                                               
Grant                            178 Abel                             174                                               
Taylor                           176 Abel                             174                                               
Abel                             174 Abel                             174                                               
Grant                            178 Taylor                           176                                               
Taylor                           176 Taylor                           176                                               
Abel                             174 Taylor                           176                                               
Grant                            178 Grant                            178                                               
Taylor                           176 Grant                            178                                               
Abel                             174 Grant                            178                                               

88 rows selected.

HR@orcl> save lab_06_04.sql
Created file lab_06_04.sql
HR@orcl> @ lab_06_04.sql

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Higgins                          205 Whalen                           200                                               
Whalen                           200 Whalen                           200                                               
Zlotkey                          149 Hartstein                        201                                               
Mourgos                          124 Hartstein                        201                                               
De Haan                          102 Hartstein                        201                                               
Kochhar                          101 Hartstein                        201                                               
Dean                             115 Hartstein                        201                                               
Raphealy                         114 Hartstein                        201                                               
Hartstein                        201 Hartstein                        201                                               
Fay                              202 Fay                              202                                               
Higgins                          205 Higgins                          205                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Whalen                           200 Higgins                          205                                               
Popp                             113 Gietz                            206                                               
Gietz                            206 Gietz                            206                                               
Zlotkey                          149 Raphealy                         114                                               
Mourgos                          124 Raphealy                         114                                               
De Haan                          102 Raphealy                         114                                               
Kochhar                          101 Raphealy                         114                                               
Dean                             115 Raphealy                         114                                               
Raphealy                         114 Raphealy                         114                                               
Hartstein                        201 Raphealy                         114                                               
Zlotkey                          149 Dean                             115                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Mourgos                          124 Dean                             115                                               
De Haan                          102 Dean                             115                                               
Kochhar                          101 Dean                             115                                               
Dean                             115 Dean                             115                                               
Raphealy                         114 Dean                             115                                               
Hartstein                        201 Dean                             115                                               
Popp                             113 Popp                             113                                               
Gietz                            206 Popp                             113                                               
Zlotkey                          149 Kochhar                          101                                               
Mourgos                          124 Kochhar                          101                                               
De Haan                          102 Kochhar                          101                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Kochhar                          101 Kochhar                          101                                               
Dean                             115 Kochhar                          101                                               
Raphealy                         114 Kochhar                          101                                               
Hartstein                        201 Kochhar                          101                                               
Zlotkey                          149 De Haan                          102                                               
Mourgos                          124 De Haan                          102                                               
De Haan                          102 De Haan                          102                                               
Kochhar                          101 De Haan                          102                                               
Dean                             115 De Haan                          102                                               
Raphealy                         114 De Haan                          102                                               
Hartstein                        201 De Haan                          102                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Hunold                           103 Hunold                           103                                               
Lorentz                          107 Ernst                            104                                               
Ernst                            104 Ernst                            104                                               
Lorentz                          107 Lorentz                          107                                               
Ernst                            104 Lorentz                          107                                               
Zlotkey                          149 Mourgos                          124                                               
Mourgos                          124 Mourgos                          124                                               
De Haan                          102 Mourgos                          124                                               
Kochhar                          101 Mourgos                          124                                               
Dean                             115 Mourgos                          124                                               
Raphealy                         114 Mourgos                          124                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Hartstein                        201 Mourgos                          124                                               
Vargas                           144 Rajs                             141                                               
Matos                            143 Rajs                             141                                               
Davies                           142 Rajs                             141                                               
Rajs                             141 Rajs                             141                                               
Vargas                           144 Davies                           142                                               
Matos                            143 Davies                           142                                               
Davies                           142 Davies                           142                                               
Rajs                             141 Davies                           142                                               
Vargas                           144 Matos                            143                                               
Matos                            143 Matos                            143                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Davies                           142 Matos                            143                                               
Rajs                             141 Matos                            143                                               
Vargas                           144 Vargas                           144                                               
Matos                            143 Vargas                           144                                               
Davies                           142 Vargas                           144                                               
Rajs                             141 Vargas                           144                                               
Zlotkey                          149 Zlotkey                          149                                               
Mourgos                          124 Zlotkey                          149                                               
De Haan                          102 Zlotkey                          149                                               
Kochhar                          101 Zlotkey                          149                                               
Dean                             115 Zlotkey                          149                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Raphealy                         114 Zlotkey                          149                                               
Hartstein                        201 Zlotkey                          149                                               
Grant                            178 Abel                             174                                               
Taylor                           176 Abel                             174                                               
Abel                             174 Abel                             174                                               
Grant                            178 Taylor                           176                                               
Taylor                           176 Taylor                           176                                               
Abel                             174 Taylor                           176                                               
Grant                            178 Grant                            178                                               
Taylor                           176 Grant                            178                                               
Abel                             174 Grant                            178                                               

88 rows selected.

HR@orcl> ed
Wrote file afiedt.buf

  1  select w.last_name "Employee", w.employee_id "EMP#", m.last_name "Manager", m.employee_id "Mgr#"
  2  from employees w LEFT OUTER join employees m
  3  ON (w.manager_id = m.manager_id)
  4* ORDER BY 2
HR@orcl> /

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
King                             100                                                                                    
Kochhar                          101 Dean                             115                                               
Kochhar                          101 Mourgos                          124                                               
Kochhar                          101 Hartstein                        201                                               
Kochhar                          101 De Haan                          102                                               
Kochhar                          101 Raphealy                         114                                               
Kochhar                          101 Kochhar                          101                                               
Kochhar                          101 Zlotkey                          149                                               
De Haan                          102 Zlotkey                          149                                               
De Haan                          102 Mourgos                          124                                               
De Haan                          102 De Haan                          102                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
De Haan                          102 Dean                             115                                               
De Haan                          102 Raphealy                         114                                               
De Haan                          102 Hartstein                        201                                               
De Haan                          102 Kochhar                          101                                               
Hunold                           103 Hunold                           103                                               
Ernst                            104 Ernst                            104                                               
Ernst                            104 Lorentz                          107                                               
Lorentz                          107 Ernst                            104                                               
Lorentz                          107 Lorentz                          107                                               
Popp                             113 Popp                             113                                               
Popp                             113 Gietz                            206                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Raphealy                         114 Raphealy                         114                                               
Raphealy                         114 Dean                             115                                               
Raphealy                         114 Zlotkey                          149                                               
Raphealy                         114 De Haan                          102                                               
Raphealy                         114 Kochhar                          101                                               
Raphealy                         114 Mourgos                          124                                               
Raphealy                         114 Hartstein                        201                                               
Dean                             115 De Haan                          102                                               
Dean                             115 Kochhar                          101                                               
Dean                             115 Hartstein                        201                                               
Dean                             115 Zlotkey                          149                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Dean                             115 Mourgos                          124                                               
Dean                             115 Raphealy                         114                                               
Dean                             115 Dean                             115                                               
Mourgos                          124 De Haan                          102                                               
Mourgos                          124 Kochhar                          101                                               
Mourgos                          124 Dean                             115                                               
Mourgos                          124 Raphealy                         114                                               
Mourgos                          124 Hartstein                        201                                               
Mourgos                          124 Zlotkey                          149                                               
Mourgos                          124 Mourgos                          124                                               
Rajs                             141 Matos                            143                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Rajs                             141 Vargas                           144                                               
Rajs                             141 Rajs                             141                                               
Rajs                             141 Davies                           142                                               
Davies                           142 Davies                           142                                               
Davies                           142 Matos                            143                                               
Davies                           142 Vargas                           144                                               
Davies                           142 Rajs                             141                                               
Matos                            143 Davies                           142                                               
Matos                            143 Rajs                             141                                               
Matos                            143 Vargas                           144                                               
Matos                            143 Matos                            143                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Vargas                           144 Vargas                           144                                               
Vargas                           144 Rajs                             141                                               
Vargas                           144 Matos                            143                                               
Vargas                           144 Davies                           142                                               
Zlotkey                          149 Raphealy                         114                                               
Zlotkey                          149 De Haan                          102                                               
Zlotkey                          149 Dean                             115                                               
Zlotkey                          149 Kochhar                          101                                               
Zlotkey                          149 Mourgos                          124                                               
Zlotkey                          149 Hartstein                        201                                               
Zlotkey                          149 Zlotkey                          149                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Abel                             174 Taylor                           176                                               
Abel                             174 Grant                            178                                               
Abel                             174 Abel                             174                                               
Taylor                           176 Taylor                           176                                               
Taylor                           176 Grant                            178                                               
Taylor                           176 Abel                             174                                               
Grant                            178 Taylor                           176                                               
Grant                            178 Grant                            178                                               
Grant                            178 Abel                             174                                               
Whalen                           200 Whalen                           200                                               
Whalen                           200 Higgins                          205                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Hartstein                        201 Raphealy                         114                                               
Hartstein                        201 Mourgos                          124                                               
Hartstein                        201 De Haan                          102                                               
Hartstein                        201 Kochhar                          101                                               
Hartstein                        201 Dean                             115                                               
Hartstein                        201 Hartstein                        201                                               
Hartstein                        201 Zlotkey                          149                                               
Fay                              202 Fay                              202                                               
Higgins                          205 Higgins                          205                                               
Higgins                          205 Whalen                           200                                               
Gietz                            206 Gietz                            206                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Gietz                            206 Popp                             113                                               

89 rows selected.

HR@orcl> save lab_06_05.sql
Created file lab_06_05.sql
HR@orcl> @ lab_06_05.sql

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
King                             100                                                                                    
Kochhar                          101 Dean                             115                                               
Kochhar                          101 Mourgos                          124                                               
Kochhar                          101 Hartstein                        201                                               
Kochhar                          101 De Haan                          102                                               
Kochhar                          101 Raphealy                         114                                               
Kochhar                          101 Kochhar                          101                                               
Kochhar                          101 Zlotkey                          149                                               
De Haan                          102 Zlotkey                          149                                               
De Haan                          102 Mourgos                          124                                               
De Haan                          102 De Haan                          102                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
De Haan                          102 Dean                             115                                               
De Haan                          102 Raphealy                         114                                               
De Haan                          102 Hartstein                        201                                               
De Haan                          102 Kochhar                          101                                               
Hunold                           103 Hunold                           103                                               
Ernst                            104 Ernst                            104                                               
Ernst                            104 Lorentz                          107                                               
Lorentz                          107 Ernst                            104                                               
Lorentz                          107 Lorentz                          107                                               
Popp                             113 Popp                             113                                               
Popp                             113 Gietz                            206                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Raphealy                         114 Raphealy                         114                                               
Raphealy                         114 Dean                             115                                               
Raphealy                         114 Zlotkey                          149                                               
Raphealy                         114 De Haan                          102                                               
Raphealy                         114 Kochhar                          101                                               
Raphealy                         114 Mourgos                          124                                               
Raphealy                         114 Hartstein                        201                                               
Dean                             115 De Haan                          102                                               
Dean                             115 Kochhar                          101                                               
Dean                             115 Hartstein                        201                                               
Dean                             115 Zlotkey                          149                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Dean                             115 Mourgos                          124                                               
Dean                             115 Raphealy                         114                                               
Dean                             115 Dean                             115                                               
Mourgos                          124 De Haan                          102                                               
Mourgos                          124 Kochhar                          101                                               
Mourgos                          124 Dean                             115                                               
Mourgos                          124 Raphealy                         114                                               
Mourgos                          124 Hartstein                        201                                               
Mourgos                          124 Zlotkey                          149                                               
Mourgos                          124 Mourgos                          124                                               
Rajs                             141 Matos                            143                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Rajs                             141 Vargas                           144                                               
Rajs                             141 Rajs                             141                                               
Rajs                             141 Davies                           142                                               
Davies                           142 Davies                           142                                               
Davies                           142 Matos                            143                                               
Davies                           142 Vargas                           144                                               
Davies                           142 Rajs                             141                                               
Matos                            143 Davies                           142                                               
Matos                            143 Rajs                             141                                               
Matos                            143 Vargas                           144                                               
Matos                            143 Matos                            143                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Vargas                           144 Vargas                           144                                               
Vargas                           144 Rajs                             141                                               
Vargas                           144 Matos                            143                                               
Vargas                           144 Davies                           142                                               
Zlotkey                          149 Raphealy                         114                                               
Zlotkey                          149 De Haan                          102                                               
Zlotkey                          149 Dean                             115                                               
Zlotkey                          149 Kochhar                          101                                               
Zlotkey                          149 Mourgos                          124                                               
Zlotkey                          149 Hartstein                        201                                               
Zlotkey                          149 Zlotkey                          149                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Abel                             174 Taylor                           176                                               
Abel                             174 Grant                            178                                               
Abel                             174 Abel                             174                                               
Taylor                           176 Taylor                           176                                               
Taylor                           176 Grant                            178                                               
Taylor                           176 Abel                             174                                               
Grant                            178 Taylor                           176                                               
Grant                            178 Grant                            178                                               
Grant                            178 Abel                             174                                               
Whalen                           200 Whalen                           200                                               
Whalen                           200 Higgins                          205                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Hartstein                        201 Raphealy                         114                                               
Hartstein                        201 Mourgos                          124                                               
Hartstein                        201 De Haan                          102                                               
Hartstein                        201 Kochhar                          101                                               
Hartstein                        201 Dean                             115                                               
Hartstein                        201 Hartstein                        201                                               
Hartstein                        201 Zlotkey                          149                                               
Fay                              202 Fay                              202                                               
Higgins                          205 Higgins                          205                                               
Higgins                          205 Whalen                           200                                               
Gietz                            206 Gietz                            206                                               

Employee                        EMP# Manager                         Mgr#                                               
------------------------- ---------- ------------------------- ----------                                               
Gietz                            206 Popp                             113                                               

89 rows selected.

HR@orcl> select e.department_id department, e.last_name employee, c.last_name colleague
  2  from employees e JOIN employees c
  3  ON (e.department_id = c.department_id)
  4  WHERE e.employee_id <> c.employee_id
  5  ORDER BY e.department_id, e.last_name, c.last_name;

DEPARTMENT EMPLOYEE                  COLLEAGUE                                                                          
---------- ------------------------- -------------------------                                                          
        50 Davies                    Matos                                                                              
        50 Davies                    Mourgos                                                                            
        50 Davies                    Rajs                                                                               
        50 Davies                    Vargas                                                                             
        50 Matos                     Davies                                                                             
        50 Matos                     Mourgos                                                                            
        50 Matos                     Rajs                                                                               
        50 Matos                     Vargas                                                                             
        50 Mourgos                   Davies                                                                             
        50 Mourgos                   Matos                                                                              
        50 Mourgos                   Rajs                                                                               

DEPARTMENT EMPLOYEE                  COLLEAGUE                                                                          
---------- ------------------------- -------------------------                                                          
        50 Mourgos                   Vargas                                                                             
        50 Rajs                      Davies                                                                             
        50 Rajs                      Matos                                                                              
        50 Rajs                      Mourgos                                                                            
        50 Rajs                      Vargas                                                                             
        50 Vargas                    Davies                                                                             
        50 Vargas                    Matos                                                                              
        50 Vargas                    Mourgos                                                                            
        50 Vargas                    Rajs                                                                               
        60 Dean                      Ernst                                                                              
        60 Dean                      Hunold                                                                             

DEPARTMENT EMPLOYEE                  COLLEAGUE                                                                          
---------- ------------------------- -------------------------                                                          
        60 Dean                      Lorentz                                                                            
        60 Dean                      Raphealy                                                                           
        60 Ernst                     Dean                                                                               
        60 Ernst                     Hunold                                                                             
        60 Ernst                     Lorentz                                                                            
        60 Ernst                     Raphealy                                                                           
        60 Hunold                    Dean                                                                               
        60 Hunold                    Ernst                                                                              
        60 Hunold                    Lorentz                                                                            
        60 Hunold                    Raphealy                                                                           
        60 Lorentz                   Dean                                                                               

DEPARTMENT EMPLOYEE                  COLLEAGUE                                                                          
---------- ------------------------- -------------------------                                                          
        60 Lorentz                   Ernst                                                                              
        60 Lorentz                   Hunold                                                                             
        60 Lorentz                   Raphealy                                                                           
        60 Raphealy                  Dean                                                                               
        60 Raphealy                  Ernst                                                                              
        60 Raphealy                  Hunold                                                                             
        60 Raphealy                  Lorentz                                                                            
        80 Abel                      Taylor                                                                             
        80 Abel                      Zlotkey                                                                            
        80 Taylor                    Abel                                                                               
        80 Taylor                    Zlotkey                                                                            

DEPARTMENT EMPLOYEE                  COLLEAGUE                                                                          
---------- ------------------------- -------------------------                                                          
        80 Zlotkey                   Abel                                                                               
        80 Zlotkey                   Taylor                                                                             
        90 De Haan                   King                                                                               
        90 De Haan                   Kochhar                                                                            
        90 King                      De Haan                                                                            
        90 King                      Kochhar                                                                            
        90 Kochhar                   De Haan                                                                            
        90 Kochhar                   King                                                                               
       110 Gietz                     Higgins                                                                            
       110 Gietz                     Popp                                                                               
       110 Higgins                   Gietz                                                                              

DEPARTMENT EMPLOYEE                  COLLEAGUE                                                                          
---------- ------------------------- -------------------------                                                          
       110 Higgins                   Popp                                                                               
       110 Popp                      Gietz                                                                              
       110 Popp                      Higgins                                                                            

58 rows selected.

HR@orcl> DESC JOB_GRADES
 Name                                                              Null?    Type
 ----------------------------------------------------------------- -------- --------------------------------------------
 GRADE_LEVEL                                                                VARCHAR2(3)
 LOWEST_SAL                                                                 NUMBER
 HIGHEST_SAL                                                                NUMBER

HR@orcl> select e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
  2  from employees e JOIN departments d
  3  ON (e.department_id = d.department_id)
  4  JOIN job_grades j
  5  ON (e.salary BETWEEN j.lowest_sal AND j.highest_sal);

LAST_NAME                 JOB_ID     DEPARTMENT_NAME                    SALARY GRA                                      
------------------------- ---------- ------------------------------ ---------- ---                                      
Vargas                    ST_CLERK   Shipping                             2500 A                                        
Matos                     ST_CLERK   Shipping                             2600 A                                        
Davies                    ST_CLERK   Shipping                             3100 B                                        
Rajs                      ST_CLERK   Shipping                             3500 B                                        
Lorentz                   IT_PROG    IT                                   4200 B                                        
Whalen                    AD_ASST    Administration                       4400 B                                        
Mourgos                   ST_MAN     Shipping                             5800 B                                        
Fay                       MK_REP     Marketing                            6000 C                                        
Ernst                     IT_PROG    IT                                   6000 C                                        
Gietz                     AC_ACCOUNT Accounting                           8300 C                                        
Taylor                    SA_REP     Sales                                8600 C                                        

LAST_NAME                 JOB_ID     DEPARTMENT_NAME                    SALARY GRA                                      
------------------------- ---------- ------------------------------ ---------- ---                                      
Hunold                    IT_PROG    IT                                   9000 C                                        
Zlotkey                   SA_MAN     Sales                               10500 D                                        
Raphealy                  SA_REP     IT                                  11000 D                                        
Abel                      SA_REP     Sales                               11000 D                                        
Dean                      SA_REP     IT                                  11000 D                                        
Higgins                   AC_MGR     Accounting                          12000 D                                        
Popp                      AC_MGR     Accounting                          12000 D                                        
Hartstein                 MK_MAN     Human Resource                      15730 E                                        
De Haan                   AD_VP      Executive                           17000 E                                        
Kochhar                   AD_VP      Executive                           17000 E                                        
King                      AD_PRES    Executive                           24000 E                                        

22 rows selected.

HR@orcl> select last_name, hire_date
  2  from employees
  3  WHERE department_id = (select department_id from employees
  4  				WHERE last_name = 'Zlotkey')
  5  AND	last_name <> 'Zlotkey';

LAST_NAME                 HIRE_DATE                                                                                     
------------------------- ---------                                                                                     
Abel                      11-MAY-96                                                                                     
Taylor                    24-MAR-98                                                                                     

HR@orcl> select employee_id, last_name from employees
  2  where salary > (select AVG(salary) from employees)
  3  ORDER BY salary;

EMPLOYEE_ID LAST_NAME                                                                                                   
----------- -------------------------                                                                                   
        149 Zlotkey                                                                                                     
        174 Abel                                                                                                        
        114 Raphealy                                                                                                    
        115 Dean                                                                                                        
        205 Higgins                                                                                                     
        113 Popp                                                                                                        
        201 Hartstein                                                                                                   
        101 Kochhar                                                                                                     
        102 De Haan                                                                                                     
        100 King                                                                                                        

10 rows selected.

HR@orcl> select employee_id, last_name
  2  from employees
  3  where department_id IN (select department_id FROM employees
  4  				where last_name like '%u%');

EMPLOYEE_ID LAST_NAME                                                                                                   
----------- -------------------------                                                                                   
        124 Mourgos                                                                                                     
        141 Rajs                                                                                                        
        142 Davies                                                                                                      
        143 Matos                                                                                                       
        144 Vargas                                                                                                      
        114 Raphealy                                                                                                    
        115 Dean                                                                                                        
        103 Hunold                                                                                                      
        104 Ernst                                                                                                       
        107 Lorentz                                                                                                     

10 rows selected.

HR@orcl> select last_name, department_id, job_id from employees
  2  where department_id IN (select department_id from departments
  3  				where location_id = 1700);

LAST_NAME                 DEPARTMENT_ID JOB_ID                                                                          
------------------------- ------------- ----------                                                                      
Whalen                               10 AD_ASST                                                                         
Higgins                             110 AC_MGR                                                                          
Gietz                               110 AC_ACCOUNT                                                                      
Popp                                110 AC_MGR                                                                          
King                                 90 AD_PRES                                                                         
Kochhar                              90 AD_VP                                                                           
De Haan                              90 AD_VP                                                                           

7 rows selected.

HR@orcl> select last_name, salary
  2  from employees
  3  where manager_id = (select employee_id from employees
  4  			where last_name = 'King');

LAST_NAME                     SALARY                                                                                    
------------------------- ----------                                                                                    
Hartstein                      15730                                                                                    
Raphealy                       11000                                                                                    
Dean                           11000                                                                                    
Kochhar                        17000                                                                                    
De Haan                        17000                                                                                    
Mourgos                         5800                                                                                    
Zlotkey                        10500                                                                                    

7 rows selected.

HR@orcl> select department_id, last_name, job_id
  2  from employees
  3  where department_id IN (select department_id from departments
  4  				where department_name = 'Executive');

DEPARTMENT_ID LAST_NAME                 JOB_ID                                                                          
------------- ------------------------- ----------                                                                      
           90 King                      AD_PRES                                                                         
           90 Kochhar                   AD_VP                                                                           
           90 De Haan                   AD_VP                                                                           

HR@orcl> select employee
  2  _id, last_name, salary
  3  from employees
  4  where department_id IN (select department_id from employees
  5  				where last_name like '%u%')
  6  AND salary > (select AVG(salary) from employees);
_id, last_name, salary
*
ERROR at line 2:
ORA-00911: invalid character 


HR@orcl> ed
Wrote file afiedt.buf

  1  select employee_id, last_name, salary
  2  from employees
  3  where department_id IN (select department_id from employees
  4  				where last_name like '%u%')
  5* AND salary > (select AVG(salary) from employees)
HR@orcl> /

EMPLOYEE_ID LAST_NAME                     SALARY                                                                        
----------- ------------------------- ----------                                                                        
        114 Raphealy                       11000                                                                        
        115 Dean                           11000                                                                        

HR@orcl> select department_id from departments
  2  MINUS
  3  select department_id from employees
  4  where job_id = 'ST_CLERK';

DEPARTMENT_ID                                                                                                           
-------------                                                                                                           
           10                                                                                                           
           20                                                                                                           
           30                                                                                                           
           40                                                                                                           
           60                                                                                                           
           70                                                                                                           
           80                                                                                                           
           90                                                                                                           
          100                                                                                                           
          110                                                                                                           
          190                                                                                                           

11 rows selected.

HR@orcl> select country_id, country_name from countries
  2  MINUS
  3  select l.country_id, c.country_name from loacations l, countries c
  4  where l.country_id = c.country_id;
select l.country_id, c.country_name from loacations l, countries c
                                         *
ERROR at line 3:
ORA-00942: table or view does not exist 


HR@orcl> ed
Wrote file afiedt.buf

  1  select country_id, country_name from countries
  2  MINUS
  3  select l.country_id, c.country_name from locations l, countries c
  4* where l.country_id = c.country_id
HR@orcl> /

CO COUNTRY_NAME                                                                                                         
-- ----------------------------------------                                                                             
DE Germany                                                                                                              

HR@orcl> column dummy noprint
HR@orcl> select job_id, department_id, 'x' dummy from employees
  2  where department_id = 10
  3  UNION
  4  select job_id, department_id, 'y' from employees
  5  where department_id = 50
  6  UNION
  7  select job_id, department_id, 'z' from employees
  8  where department_id = 20
  9  ORDER BY 3;

JOB_ID     DEPARTMENT_ID                                                                                                
---------- -------------                                                                                                
AD_ASST               10                                                                                                
ST_CLERK              50                                                                                                
ST_MAN                50                                                                                                
MK_REP                20                                                                                                

HR@orcl> column dummy print
HR@orcl> /

JOB_ID     DEPARTMENT_ID D                                                                                              
---------- ------------- -                                                                                              
AD_ASST               10 x                                                                                              
ST_CLERK              50 y                                                                                              
ST_MAN                50 y                                                                                              
MK_REP                20 z                                                                                              

HR@orcl> select employee_id, job_id from employees
  2  INTERSECT
  3  select employee_id, job_id from job_history;

EMPLOYEE_ID JOB_ID                                                                                                      
----------- ----------                                                                                                  
        176 SA_REP                                                                                                      
        200 AD_ASST                                                                                                     

HR@orcl> ed
Wrote file afiedt.buf

  1  select last_name, department_id, TO_CHAR(null) from employees
  2  UNION
  3* select TO_CHAR(null), department_id, department_name from departments
HR@orcl> /

LAST_NAME                 DEPARTMENT_ID TO_CHAR(NULL)                                                                   
------------------------- ------------- ------------------------------                                                  
Abel                                 80                                                                                 
Davies                               50                                                                                 
De Haan                              90                                                                                 
Dean                                 60                                                                                 
Ernst                                60                                                                                 
Fay                                  20                                                                                 
Gietz                               110                                                                                 
Grant                                                                                                                   
Hartstein                            40                                                                                 
Higgins                             110                                                                                 
Hunold                               60                                                                                 

LAST_NAME                 DEPARTMENT_ID TO_CHAR(NULL)                                                                   
------------------------- ------------- ------------------------------                                                  
King                                 90                                                                                 
Kochhar                              90                                                                                 
Lorentz                              60                                                                                 
Matos                                50                                                                                 
Mourgos                              50                                                                                 
Popp                                110                                                                                 
Rajs                                 50                                                                                 
Raphealy                             60                                                                                 
Taylor                               80                                                                                 
Vargas                               50                                                                                 
Whalen                               10                                                                                 

LAST_NAME                 DEPARTMENT_ID TO_CHAR(NULL)                                                                   
------------------------- ------------- ------------------------------                                                  
Zlotkey                              80                                                                                 
                                     10 Administration                                                                  
                                     20 Marketing                                                                       
                                     30 Purchasing                                                                      
                                     40 Human Resource                                                                  
                                     50 Shipping                                                                        
                                     60 IT                                                                              
                                     70 Public Relations                                                                
                                     80 Sales                                                                           
                                     90 Executive                                                                       
                                    100 Finance                                                                         

LAST_NAME                 DEPARTMENT_ID TO_CHAR(NULL)                                                                   
------------------------- ------------- ------------------------------                                                  
                                    110 Accounting                                                                      
                                    190 Contracting                                                                     

35 rows selected.

HR@orcl> spool off




