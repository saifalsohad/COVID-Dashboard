-- 1. 
--TotalCounts

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From COVID..covid_data
where continent is not null 
order by 1,2

--2
--Death Count per Continent

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From  COVID..covid_data
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc

--3
--Percentage Population infected By Country

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From  COVID..covid_data
Group by Location, Population
order by PercentPopulationInfected desc

--4
--Percent Population Infected Throughout Time

Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From COVID..covid_data
Group by Location, Population, date
order by PercentPopulationInfected desc
