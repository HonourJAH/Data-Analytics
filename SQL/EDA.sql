-- Exploratory Data Analysis(EDA)

SELECT * FROM layoffs_staging2;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc;

-- total laid off by each company
select company, sum(total_laid_off) sum_total_laid_off
from layoffs_staging2
group by company
order by 2 desc;

-- total laid off in each year
select year(`date`) years, sum(total_laid_off) total_laid_off_each_year
from layoffs_staging2
where year(`date`) is not null
group by year(`date`)
order by 2 desc;

select min(`date`) min_date, max(`date`) max_date
from layoffs_staging2;

-- total laid off by each industry
select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

select substring(`date`, 1, 7) `Month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `Month`
order by 1 asc;


with Rolling_Total as
(
select substring(`date`, 1, 7) `Month`, sum(total_laid_off) sum_total_laid_off
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `Month`
order by 1 asc
)
select `Month`, sum_total_laid_off, sum(sum_total_laid_off) over(order by `Month`) as rolling_total
from Rolling_Total;

select company, year(`date`) Years, sum(total_laid_off) sum_total_laid_off
from layoffs_staging2
group by company, years
order by 3 desc;

with Company_Year(company, years, sum_total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
),
Company_Year_Rank as
(
select *, dense_rank() over(partition by years order by sum_total_laid_off desc) as Ranking
from Company_Year
where years is not null
)
select *
from Company_Year_Rank
where Ranking <= 5;











