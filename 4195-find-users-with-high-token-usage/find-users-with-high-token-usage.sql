
SELECT 
user_id,
prompt_count,
avg_tokens
FROM (
    SELECT 
    user_id,
    COUNT(*) AS prompt_count,
    ROUND(AVG(CAST(tokens AS float)),2) AS avg_tokens,
    MAX(tokens) AS max
    FROM prompts
    GROUP BY user_id) t
    WHERE avg_tokens< t.max AND prompt_count>2
ORDER BY  avg_tokens desc,
          user_id asc;
/*
SELECT 
    user_id,
    COUNT(*) AS prompt_count,
    ROUND(AVG(CAST(tokens AS float)),2) AS avg_tokens,
    MAX(tokens) AS max
    FROM prompts
    GROUP BY user_id;*/
