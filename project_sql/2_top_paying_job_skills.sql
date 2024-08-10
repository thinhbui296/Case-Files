
WITH top_paying_jobs AS (
SELECT
    job_id,
    job_title,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim. company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
ORDER BY 
    salary_year_avg DESC

/* 
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableau is also highly sought after, with a bold count of 6.
Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand. */
