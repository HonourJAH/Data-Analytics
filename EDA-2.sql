SELECT 
    *
FROM
    layoffs_copy2;
    

-- company's each year total laid off
SELECT 
    company, Year(`date`), SUM(total_laid_off)
FROM
    layoffs_copy2
GROUP BY company, Year(`date`)
HAVING SUM(total_laid_off) IS NOT NULL
ORDER BY 3 DESC;


-- year with the highest laid off
SELECT 
	Year(`date`), SUM(total_laid_off) sum_laid_off
FROM
    layoffs_copy2
GROUP BY Year(`date`)
ORDER BY 2 DESC;


SELECT 
	substring(`date`, 1, 7) Months, SUM(total_laid_off) sum_laid_off, MAX(total_laid_off) max_laid_off,  MIN(total_laid_off) min_laid_off
FROM
    layoffs_copy2
GROUP BY substring(`date`, 1, 7)
ORDER BY Months DESC;


with Rolling_Total as
(
SELECT 
    SUBSTRING(`date`, 1, 7) `Month`,
    SUM(total_laid_off) sum_laid_off
FROM
    layoffs_copy2
WHERE
    SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `Month`
ORDER BY `Month` DESC
)
select `Month`, sum_laid_off, SUM(sum_laid_off) over( order by `Month`) as rolling_total
from Rolling_Total;






