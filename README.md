# NCAA Women's Basketball — SQL Performance Analysis
**2023–24 Season | Alex Jardine**

---

## Project Overview

This project uses SQL to analyze individual player and team performance data from the 2023–24 NCAA Division I women's basketball season. The analysis mirrors the kind of work I performed professionally for 10+ years as an Assistant Director of Data, Reporting & Operations at the University of Nebraska and Montana State University — identifying top performers, comparing programs across conferences, and surfacing trends that inform decision-making.

**Tools used:** SQL (SQLite via DB Browser), Excel (data preparation)  
**Dataset:** 2023–24 NCAA WBB player statistics — [pineconedata/ncaa-basketball-stats](https://github.com/pineconedata/ncaa-basketball-stats)  
**Skills demonstrated:** SELECT, WHERE, ORDER BY, GROUP BY, aggregate functions, computed columns, SUBSTR string parsing, subqueries

---

## Business Questions

1. Who were the top scorers in the 2023–24 season?
2. How did average player performance compare across conferences?
3. Who were the most well-rounded players when combining points, rebounds, and assists?
4. Which teams were the most efficient shooters?
5. Which players scored above the season average?

---

## Key Findings

### 1. Caitlin Clark was in a class of her own
Clark finished with 1,020 points — nearly **220 more** than second-place JuJu Watkins (USC, 801). In a dataset of hundreds of players, that gap is extraordinary. No other player in the top 10 broke 730 points.

### 2. The ACC led all conferences in scoring
The ACC averaged **383.7 points per player**, edging the Big Ten (378.5) and SEC (361.0). Power conferences dominated the top of the list, but mid-major conferences like the Summit League (358.5) and Horizon (352.6) were competitive.

### 3. Rebounding elevated mid-major players into the all-around top 10
The all-around metric (points + rebounds + assists) revealed players who don't make ESPN highlights. **Lauren Gustin (BYU)** ranked 4th overall — not because of scoring, but because of 490 rebounds. **Macy McGlone (Eastern Illinois)** cracked the top 10 on 392 rebounds. This kind of finding is what separates data analysis from box scores.

### 4. Norfolk State led all teams in 3-point shooting at 48.6%
A mid-major program topping the entire country in 3PT percentage is a notable outlier worth investigating further. **Iowa** ranked 4th in overall field goal percentage (52.9%) — efficient inside the arc despite Caitlin Clark's reputation as a perimeter player.

### 5. 334 players scored above the season average of 334 points
The scoring distribution skews heavily toward the top. Clark's 1,020 pulls the average up, meaning the "above average" threshold is higher than it might appear — and mid-major players like **Rachael Rose (Wofford)** and **Daisha Bradford (LA Monroe)** still cleared it.

---

## Queries

All queries are in [`queries.sql`](./queries.sql). Each is commented with what it answers and the SQL concepts it demonstrates.

| Query | Question | Concepts |
|-------|----------|----------|
| 1 | Top 10 scorers | SELECT, ORDER BY, LIMIT |
| 2 | Conference scoring averages | GROUP BY, AVG, SUBSTR string parsing |
| 3 | All-around leaders | Computed columns, WHERE filter, LIMIT |
| 4 | Shooting efficiency by team | AVG on rate stats, GROUP BY, ORDER BY |
| 5 | Above-average scorers | Subquery, WHERE comparison |

---

## Dataset

- **Source:** [pineconedata/ncaa-basketball-stats](https://github.com/pineconedata/ncaa-basketball-stats)
- **Season:** 2023–24 NCAA Division I Women's Basketball
- **File used:** `player_data_clean.xlsx` (converted to CSV for SQLite import)
- **Records:** ~500 individual player season stat lines
- **Columns include:** Player name, team, conference, games played, minutes, field goals, 3-pointers, free throws, rebounds (offensive/defensive/total), assists, turnovers, steals, blocks, fouls, points

---

## About Me

I spent 10+ years tracking and reporting on athlete performance data across Division I programs at the University of Nebraska and Montana State University. This project applies SQL to a domain I know deeply — the same questions I asked in my day-to-day work, now answered in code.

Currently building toward a data analyst role with skills in SQL, Python, Power BI, and Excel.

[LinkedIn](https://www.linkedin.com/in/alexjardinedata) | [GitHub](https://github.com/alexjardinedata/ncaa-wbb-sql-analysis)
