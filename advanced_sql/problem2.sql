
-- SELECT 
--     company_job_postings.name, 
--     company_job_postings.total_jobs,
--     company_job_postings.job_level
-- FROM (
--     SELECT 
--         name,
--         COUNT(company_id) AS total_jobs,
--         CASE
--             WHEN COUNT(company_id) < 10 THEN 'LOW'
--             WHEN COUNT(company_id) BETWEEN 10 AND 50 THEN 'MEDIUM'
--             ELSE 'HIGH'
--         END AS job_level
--     FROM
--         company_dim
--     GROUP BY
--         name
--     ORDER BY
--         total_jobs DESC
-- ) AS company_job_postings;


SELECT 
    company_job_postings.name, 
    company_job_postings.total_jobs,
    company_job_postings.job_level
FROM (
    SELECT 
        cd.name,
        COUNT(jpf.job_id) AS total_jobs,
        CASE
            WHEN COUNT(jpf.job_id) < 10 THEN 'LOW'
            WHEN COUNT(jpf.job_id) BETWEEN 10 AND 50 THEN 'MEDIUM'
            ELSE 'HIGH'
        END AS job_level
    FROM
        job_postings_fact jpf
    JOIN 
        company_dim cd ON jpf.company_id = cd.company_id
    GROUP BY
        cd.name
    ORDER BY
        total_jobs DESC
) AS company_job_postings;
