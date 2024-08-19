SELECT 
    job_title_short,
    COUNT(job_id) AS number_of_jobs,

    CASE
        WHEN AVG(salary_year_avg) > 100000 THEN 'HIGH'
        WHEN AVG(salary_year_avg) BETWEEN 50000 AND 99000 THEN 'STANDARD'
        ELSE 'LOW'
    END AS salary_rank

FROM job_postings_fact

WHERE
    job_title_short = 'Data Analyst'

GROUP BY
    salary_year_avg

ORDER BY
    salary_rank DESC;