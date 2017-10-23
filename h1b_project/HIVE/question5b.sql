select job_title,year, count(case_status ) as count_case_status from h1b_final where year = 2011 and case_status='CERTIFIED' group by job_title, year order by count_case_status limit 10;
select job_title,year, count(case_status ) as count_case_status from h1b_final where year = 2012 and case_status='CERTIFIED' group by job_title, year order by count_case_status limit 10;
select job_title,year, count(case_status ) as count_case_status from h1b_final where year = 2013 and case_status='CERTIFIED' group by job_title, year order by count_case_status limit 10;
select job_title,year, count(case_status ) as count_case_status from h1b_final where year = 2014 and case_status='CERTIFIED' group by job_title, year order by count_case_status limit 10;
select job_title,year, count(case_status ) as count_case_status from h1b_final where year = 2015 and case_status='CERTIFIED' group by job_title, year order by count_case_status limit 10;
select job_title,year, count(case_status ) as count_case_status from h1b_final where year = 2016 and case_status='CERTIFIED' group by job_title, year order by count_case_status limit 10;

