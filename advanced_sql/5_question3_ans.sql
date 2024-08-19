SELECT 
    job_title
      

FROM job_postings_fact

WHERE
    EXTRACT(QUARTER FROM job_posted_date) = 2
    AND job_health_insurance = TRUE