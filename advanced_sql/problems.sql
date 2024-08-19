SELECT 
    skill_counts.skill_id,
    skill_counts.total_jobs,
    skills_dim.skills
FROM (
    SELECT 
        skill_id,
        COUNT(*) AS total_jobs
    FROM 
        skills_job_dim
    GROUP BY
        skill_id
) AS skill_counts
LEFT JOIN skills_dim ON skills_dim.skill_id = skill_counts.skill_id
ORDER BY
    skill_counts.total_jobs DESC
LIMIT 5;


