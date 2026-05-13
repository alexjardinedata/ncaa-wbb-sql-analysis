-- ============================================================
-- NCAA Women's Basketball — SQL Performance Analysis
-- 2023-24 Season
-- Analyst: Alex Jardine
-- Dataset: pineconedata/ncaa-basketball-stats (GitHub)
-- Tool: DB Browser for SQLite
-- ============================================================


-- ============================================================
-- QUERY 1: Top 10 Scorers
-- Question: Who were the highest-scoring players in the 2023-24 season?
-- Concepts: SELECT, ORDER BY, LIMIT
-- Finding: Caitlin Clark led with 1,020 points — 219 more than
--          second-place JuJu Watkins (USC, 801).
-- ============================================================

SELECT PLAYER_NAME, TEAM_NAME, POINTS
FROM wbb_stats
ORDER BY POINTS DESC
LIMIT 10;


-- ============================================================
-- QUERY 2: Conference Scoring Averages
-- Question: How did average player performance compare across conferences?
-- Concepts: GROUP BY, AVG, COUNT, ROUND, SUBSTR/INSTR string parsing
-- Note: The Team column stores values like "Iowa (Big Ten)" so we use
--       SUBSTR and INSTR to extract only the conference name in parentheses.
-- Finding: ACC led all conferences at 383.7 avg points per player,
--          followed by Big Ten (378.5) and SEC (361.0).
-- ============================================================

SELECT
  SUBSTR(Team, INSTR(Team, '(')+1,
    INSTR(Team, ')')-INSTR(Team, '(')-1) AS conference,
  COUNT(*) AS players,
  ROUND(AVG(POINTS), 1) AS avg_pts,
  ROUND(AVG(ASSISTS), 1) AS avg_ast,
  ROUND(AVG(TOTAL_REBOUNDS), 1) AS avg_reb
FROM wbb_stats
GROUP BY conference
ORDER BY avg_pts DESC;


-- ============================================================
-- QUERY 3: All-Around Leaders (Points + Rebounds + Assists)
-- Question: Who were the most well-rounded players in the season?
-- Concepts: Computed columns, WHERE filter, ORDER BY, LIMIT
-- Note: Filtered to players with 20+ games to ensure meaningful sample size.
-- Finding: Caitlin Clark led at 1,536. Lauren Gustin (BYU) ranked 4th
--          on rebounding alone (490 reb) despite ranking outside the top 15
--          in scoring — shows the value of a multi-dimensional metric.
-- ============================================================

SELECT PLAYER_NAME, TEAM_NAME, POINTS, TOTAL_REBOUNDS, ASSISTS,
  ROUND(POINTS + TOTAL_REBOUNDS + ASSISTS, 1) AS all_around_score
FROM wbb_stats
WHERE GAMES >= 20
ORDER BY all_around_score DESC
LIMIT 15;


-- ============================================================
-- QUERY 4: Shooting Efficiency by Team
-- Question: Which teams had the most efficient shooters?
-- Concepts: AVG on rate stats, GROUP BY, WHERE, ORDER BY
-- Note: Filtered to players with 15+ games for a reliable sample.
--       Blank values in 3PT% indicate no attempts recorded.
-- Finding: Austin Peay led in FG% at 61.3%. Iowa ranked 4th at 52.9%
--          despite Clark's reputation as a perimeter player.
--          Norfolk State led all teams in 3PT% at 48.6%.
-- ============================================================

SELECT TEAM_NAME,
  ROUND(AVG(FIELD_GOAL_PERCENTAGE), 1) AS avg_fg_pct,
  ROUND(AVG(THREE_POINT_PERCENTAGE), 1) AS avg_3pt_pct,
  ROUND(AVG(FREE_THROW_PERCENTAGE), 1) AS avg_ft_pct
FROM wbb_stats
WHERE GAMES >= 15
GROUP BY TEAM_NAME
ORDER BY avg_fg_pct DESC;


-- ============================================================
-- QUERY 5: Above-Average Scorers
-- Question: Which players scored above the season average?
-- Concepts: Subquery, WHERE comparison, ORDER BY
-- Note: The subquery dynamically calculates the season average
--       so the threshold updates automatically if the dataset changes.
--       Inner query filtered to 15+ games to exclude low-sample outliers.
-- Finding: 334 players exceeded the season average of 334 points.
--          Mid-major players like Rachael Rose (Wofford) and
--          Daisha Bradford (LA Monroe) cleared the bar alongside
--          power conference stars.
-- ============================================================

SELECT PLAYER_NAME, TEAM_NAME, POINTS
FROM wbb_stats
WHERE POINTS > (
  SELECT AVG(POINTS)
  FROM wbb_stats
  WHERE GAMES >= 15
)
ORDER BY POINTS DESC;
