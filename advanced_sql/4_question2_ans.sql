SELECT 
    EXTRACT(MONTH FROM job_postings.job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month,
    COUNT(job_postings.job_id) AS job_posted_count
FROM    
    job_postings_fact AS job_postings
GROUP BY   
    month
ORDER BY
    month;
