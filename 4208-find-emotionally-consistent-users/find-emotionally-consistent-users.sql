/* Write your T-SQL query statement below */
SELECT DISTINCT
a.user_id,
a.reaction AS dominant_reaction,
a.reaction_ratio
FROM (SELECT 
*,
COUNT(*) OVER(PARTITION BY t.user_id,t.reaction) AS catagories,
ROUND(CAST(COUNT(*) OVER(PARTITION BY t.user_id,t.reaction) AS FLOAT) / t.count ,2) AS reaction_ratio
FROM (
    SELECT 
    user_id, 
    reaction,
    COUNT(*) OVER(PARTITION BY user_id) AS count
    FROM reactions
) t
WHERE t.count >= 5) a
WHERE a.reaction_ratio >= 0.6
ORDER BY a.reaction_ratio DESC