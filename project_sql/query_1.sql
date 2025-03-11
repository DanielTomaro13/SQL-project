/* Query 1: What are the top paying jobs in the dataset for 
remote data analyst positions?
*/

SELECT
    jpf.job_title,
    cd.name AS company_name,
    jpf.job_location,
    jpf.job_schedule_type,
    jpf.salary_year_avg,
    jpf.job_posted_date,
    DENSE_RANK() OVER(ORDER BY jpf.salary_year_avg DESC) AS Rank
FROM 
    job_postings_fact jpf

LEFT JOIN
    company_dim cd ON jpf.company_id = cd.company_id

WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL

ORDER BY 
    Rank ASC

LIMIT 10;

/* By using rank the query is now able to be manipulated better */