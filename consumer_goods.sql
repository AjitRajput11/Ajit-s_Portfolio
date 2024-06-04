use consumer_goods;
select * from dim_cities;
select * from dim_repondents;
select * from fact_survey_responses;

#1.Who prefers energy drink more?(male/female/non-binary?)
select dr.Gender,
count(1) cnt
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
group by dr.Gender;

# consume freq dist by gender

select fs.Consume_frequency,
sum(case when Gender="Male" then 1 else 0 end) as male_count,
sum(case when Gender="Female" then 1 else 0 end) as female_count,
sum(case when Gender="Non-binary" then 1 else 0 end) as Non_binary_count
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
group by fs.Consume_frequency;

# Which age group prefers energy drinks more?
select dr.Age,
count(1) cnt
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
group by dr.Age;

# Which type of marketing reaches the most Youth (15-30)?
select fs.Marketing_channels,
count(1) cnt
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
group by fs.Marketing_channels
order by cnt desc;

#4. What are the preferred ingredients of energy drinks among respondents?
select fs.Ingredients_expected,
count(1) cnt
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
group by fs.Ingredients_expected
order by cnt desc;

select fs.Ingredients_expected,
count(1) cnt
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
left join dim_
group by fs.Ingredients_expected
order by cnt desc;

#5. What packaging preferences do respondents have for energy drinks?
select fs.Packaging_preference,
count(1) cnt
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
group by fs.Packaging_preference
order by cnt desc;

#6. Who are the current market leaders?
select fs.Current_brands,
count(1) cnt
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
group by fs.Current_brands
order by cnt desc;

#7. What are the primary reasons consumers prefer those brands over ours?
select fs.Reasons_preventing_trying,
count(1) cnt
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
group by fs.Reasons_preventing_trying
order by cnt desc;

#8. Which marketing channel can be used to reach more customers?
select fs.Marketing_channels,
count(1) cnt
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
group by fs.Marketing_channels
order by cnt desc;

#11. Which cities do we need to focus more on?
select dc.City,
count(1) cnt
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
left join dim_cities dc on dc.City_ID=dr.City_ID
group by dc.City
order by cnt asc
limit 5;

#13. What are the typical consumption situations for energy drinks among respondents?
select fs.Typical_consumption_situations,
count(1) cnt
from fact_survey_responses fs
left join dim_repondents dr on dr.Respondent_id=fs.Respondent_id
left join dim_cities dc on dc.City_ID=dr.City_ID
group by fs.Typical_consumption_situations
order by cnt desc
limit 5;

