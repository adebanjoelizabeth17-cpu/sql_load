WITH TOP_PAYING_JOBS AS(
    SELECT
        job_id,
        job_title_short,
        salary_year_avg,
        name as company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim on job_postings_fact.company_id=company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'
    AND
        job_location = 'Anywhere'
    AND
        salary_year_avg is NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
    )
SELECT top_paying_jobs. *,
    skills
FROM TOP_PAYING_JOBS
INNER JOIN skills_job_dim ON TOP_PAYING_JOBS.job_id= skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id= skills_dim.skill_id
ORDER BY salary_year_avg DESC

/*SQL is non-negotiable — required by every single job
--Python + Tableau are the next most critical skills
--Cloud skills (AWS, Azure, Snowflake) appear in the higher-paying roles
--AT&T's role requires the most skills (13 total) suggesting a senior-level position
--SmartAsset appears twice, showing they are actively hiring
*/