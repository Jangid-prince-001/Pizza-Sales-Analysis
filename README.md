# Pizza-Sales-Analysis = SQL & Power BI Dashboard

This project analyzes transactional pizza sales data using MySQL for data extraction and transformation, and Power BI for interactive visualization. The SQL layer covers a full range of query techniques — multi-table joins, correlated subqueries, CASE WHEN logic, NULL handling, and window functions (RANK, running totals) — to answer real business questions such as category-wise revenue contribution, peak ordering hours, and top-performing pizzas. The Power BI dashboard translates these insights into a dark-themed, interactive report featuring KPI cards, cumulative revenue trends, category breakdowns, and drill-through navigation, built on a star-schema data model with custom DAX measures.

Tech stack: MySQL, Power BI, DAX, Power Query
Key skills demonstrated: SQL joins & subqueries, window functions, data modeling, DAX measures, dashboard UX design


## Key Insights

- Classic aur Chicken category ne combined milkar total revenue ka sabse bada hissa contribute kiya
- Peak ordering hours 12 PM–1 PM (lunch) aur 6 PM–7 PM (dinner) rahe, jo staffing decisions ke liye useful insight hai
- Medium (M) size sabse zyada order hone wala size raha, jo inventory planning me help karega
- Top 3 revenue-generating pizzas ne total revenue ka significant percentage akela generate kiya (Pareto pattern)
