SELECT 
    --job_postings.job_posted_date::DATE AS job_date,
    AVG(job_postings.salary_year_avg),
    AVG(job_postings.salary_hour_avg),
    job_postings.job_schedule_type AS job_schedule

FROM
    job_postings_fact AS job_postings

WHERE
    job_postings.job_posted_date > '2023-06-01'

GROUP BY
    job_schedule