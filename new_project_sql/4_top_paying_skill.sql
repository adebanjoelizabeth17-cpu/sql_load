SELECT 
    skills,
    round(avg(salary_year_avg),0)as top_salaries
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id= skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id= skills_dim.skill_id
where job_title_short= 'Data Analyst'
and salary_year_avg IS NOT NULL
and job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
    top_salaries DESC
limit 25 