
USE WorldEvents
SELECT *
FROM INFORMATION_SCHEMA.TABLES

select * from tblCategory
select * from tblCountry
select * from tblContinent
select * from tblEvent

--Q1)Create a stored procedure called uspCountriesAsia to list out all the countries with ContinentId equal to 1, in alphabetical order
create proc uspCountriesAsia @continentid int
as
begin
select distinct(CountryName) from tblCountry where ContinentID =@continentid order by CountryName
end
exec uspCountriesAsia @continentid =1

--Q2)Using the tblAuthor and tblEpisode tables, create a stored procedure called spMoffats to list out the 32 
--episodes written by Steven Moffat in date order (with the most recent first):

use [DoctorWho]
select * from INFORMATION_SCHEMA.tables
select * from tblAuthor 
select * from tblEpisode

create proc spMoffats @name varchar(30) 
as
begin
select EpisodeType, Title, EpisodeDate, tblAuthor.AuthorId, AuthorName from tblEpisode inner join tblAuthor on tblAuthor.AuthorId = tblEpisode.AuthorId
where tblAuthor.AuthorName = @name order by EpisodeDate desc
end

exec spMoffats @name = 'Steven Moffat'