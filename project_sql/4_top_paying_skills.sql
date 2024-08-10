SELECT
    skills,
    round(avg(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = True
    AND salary_year_avg is NOT NULL
GROUP BY
    skills
ORDER BY avg_salary DESC
LIMIT 15;

/* 
• High Demand for Big Data & ML Skills: Top salaries are commanded by analysts skilled in big data
technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python
libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive
modeling capabilities.
• Software Development & Deployment Proficiency: Knowledge in development and deployment
tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and
engineering, with a premium on skills that facilitate automation and efficient data pipeline
management.
• Cloud Computing Expertise: Familiarity with cloud and data engineering tools (Elasticsearch,
Databricks, GCP) underscores the growing importance of cloud-based analytics environments,
suggesting that cloud proficiency significantly boosts earning potential in data analytics.
*/