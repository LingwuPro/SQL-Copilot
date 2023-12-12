SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT name ,  country ,  age FROM singer ORDER BY age DESC
SELECT name ,  country ,  age FROM singer ORDER BY age DESC
SELECT avg(age) ,  min(age) ,  max(age) FROM singer WHERE country  =  'France'
SELECT avg(age) ,  min(age) ,  max(age) FROM singer WHERE country  =  'France'
SELECT Song_Name ,  Song_release_year FROM singer WHERE Age  =  (SELECT min(Age) FROM singer)
SELECT Song_Name ,  Song_release_year FROM singer WHERE Age  =  (SELECT min(Age) FROM singer)
SELECT DISTINCT Country FROM singer WHERE Age  >  20
SELECT DISTINCT Country FROM singer WHERE Age  >  20
SELECT Country ,  count(*) FROM singer GROUP BY Country
SELECT Country ,  count(*) FROM singer GROUP BY Country
SELECT Song_Name FROM singer WHERE Age  >  (SELECT avg(Age) FROM singer)
SELECT Song_Name FROM singer WHERE Age  >  (SELECT avg(Age) FROM singer)
SELECT location ,  name FROM stadium WHERE capacity BETWEEN 5000 AND 10000
SELECT Location ,  Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT max(capacity) ,  avg(capacity) FROM stadium
SELECT avg(capacity) ,  max(capacity) FROM stadium
SELECT Name ,  Capacity FROM stadium WHERE Capacity  =  (SELECT Capacity FROM stadium WHERE Average  =  (SELECT max(Average) FROM stadium))
SELECT Name ,  Capacity FROM stadium WHERE Average  =  (SELECT max(Average) FROM stadium)
SELECT count(*) FROM concert WHERE YEAR  =  2014 OR YEAR  =  2015
SELECT count(*) FROM concert WHERE YEAR  =  2014 OR YEAR  =  2015
SELECT Name ,  count(*) FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID  =  T2.Stadium_ID GROUP BY T1.Stadium_ID
SELECT count(*) ,  stadium_id FROM singer_in_concert GROUP BY stadium_id
SELECT T1.name ,  T1.capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T2.year  >=  2014 GROUP BY T1.stadium_id ORDER BY count(*) DESC LIMIT 1
SELECT name ,  capacity FROM stadium WHERE stadium_id IN (SELECT stadium_id FROM concert WHERE year  >  2013 GROUP BY stadium_id ORDER BY count(*) DESC LIMIT 1)
SELECT YEAR FROM concert GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1
SELECT YEAR FROM concert GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT DISTINCT Country FROM singer WHERE Age  >  40 OR Age  <  30
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert WHERE YEAR  =  2014)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE YEAR  =  2014)
SELECT concert_Name ,  Theme ,  count(*) FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID  =  T2.concert_ID GROUP BY T1.concert_ID
SELECT concert_Name ,  Theme ,  count(*) FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID  =  T2.concert_ID GROUP BY T1.concert_ID
SELECT T1.Name ,  count(*) FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Name
SELECT T1.Name ,  count(*) FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Name
SELECT name FROM singer WHERE singer_id IN (SELECT singer_id FROM singer_in_concert WHERE concert_id IN (SELECT concert_id FROM concert WHERE year  =  2014))
SELECT name FROM singer WHERE singer_id IN (SELECT singer_id FROM singer_in_concert WHERE concert_id IN (SELECT concert_id FROM concert WHERE year  =  2014))
SELECT name ,  country FROM singer WHERE singer_id IN (SELECT singer_id FROM singer_in_concert WHERE concert_id IN (SELECT concert_id FROM concert WHERE concert_name LIKE '%Hey%'))
SELECT name ,  country FROM singer WHERE singer_id IN (SELECT singer_id FROM singer_in_concert WHERE concert_id IN (SELECT concert_id FROM concert WHERE concert_name LIKE '%Hey%'))
SELECT Name ,  Location FROM stadium WHERE Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE YEAR  =  2014) AND Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE YEAR  =  2015)
SELECT Name ,  Location FROM stadium WHERE Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE YEAR  =  2014) AND Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE YEAR  =  2015)
SELECT count(*) FROM concert WHERE Stadium_ID  =  (SELECT Stadium_ID FROM stadium WHERE Capacity  =  (SELECT max(Capacity) FROM stadium))
SELECT count(*) FROM concert WHERE Stadium_ID  =  (SELECT Stadium_ID FROM stadium WHERE Capacity  =  (SELECT max(Capacity) FROM stadium))
SELECT count(*) FROM Pets WHERE weight  >  10
SELECT count(*) FROM pets WHERE weight  >  10
SELECT weight FROM Pets WHERE pet_age  =  (SELECT min(pet_age) FROM Pets WHERE PetType  =  'Dog')
SELECT weight FROM Pets WHERE pet_age  =  (SELECT min(pet_age) FROM Pets)
SELECT max(weight) ,  PetType FROM Pets GROUP BY PetType
SELECT max(weight) ,  PetType FROM Pets GROUP BY PetType
SELECT count(*) FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE Age  >  20)
SELECT count(*) FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE Age  >  20)
SELECT count(*) FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID  =  T2.StuID JOIN Pets AS T3 ON T1.PetID  =  T3.PetID WHERE T3.PetType  =  'Dog' AND T2.Sex  =  'F'
SELECT count(*) FROM Pets AS T1 JOIN Has_Pet AS T2 ON T1.PetID  =  T2.PetID JOIN Student AS T3 ON T2.StuID  =  T3.StuID WHERE T1.PetType  =  'Dog' AND T3.Sex  =  'F'
SELECT count(DISTINCT PetType) FROM Pets
SELECT count(DISTINCT PetType) FROM Pets
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'cat' OR PetType  =  'dog'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'cat' OR PetType  =  'dog'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'cat') INTERSECT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'dog'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'cat') INTERSECT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'dog'))
SELECT major ,  age FROM student WHERE id NOT IN (SELECT T1.id FROM student AS T1 JOIN Has_Pet AS T2 ON T1.id  =  T2.id JOIN Pets AS T3 ON T2.pet_id  =  T3.pet_id WHERE T3.pet_type  =  'cat')
SELECT major ,  age FROM student WHERE id NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'cat'))
SELECT StuID FROM Has_Pet WHERE PetID NOT IN (SELECT PetID FROM Pets WHERE PetType  =  'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'cat'))
SELECT Fname ,  Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'Dog') EXCEPT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'Cat'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'Dog') EXCEPT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'Cat'))
SELECT PetType ,  weight FROM Pets WHERE pet_age  =  (SELECT min(pet_age) FROM Pets)
SELECT PetType ,  weight FROM Pets WHERE pet_age  =  (SELECT min(pet_age) FROM Pets)
SELECT PetID ,  weight FROM Pets WHERE pet_age  >  1
SELECT PetID ,  weight FROM Pets WHERE pet_age  >  1
SELECT avg(pet_age) ,  max(pet_age) ,  PetType FROM Pets GROUP BY PetType
SELECT pet_type ,  avg(pet_age) ,  max(pet_age) FROM pets GROUP BY pet_type
SELECT pet_type ,  avg(weight) FROM pets GROUP BY pet_type
SELECT pet_type ,  avg(weight) FROM pets GROUP BY pet_type
SELECT Fname ,  Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet)
SELECT DISTINCT Fname ,  Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet)
SELECT petid FROM has_pet WHERE stuid IN (SELECT stuid FROM student WHERE lname  =  'Smith')
SELECT PetID FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE LName  =  'Smith')
SELECT count(*) ,  T1.StuID FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID  =  T2.PetID GROUP BY T1.StuID
SELECT T1.StuID ,  count(*) FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID  =  T2.PetID GROUP BY T1.StuID
SELECT Fname ,  Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING count(*)  >  1)
SELECT T1.Fname ,  T1.Sex FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID GROUP BY T2.StuID HAVING count(*)  >  1
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'cat' AND pet_age  =  3))
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  'cat' AND pet_age  =  3))
SELECT avg(age) FROM student WHERE id NOT IN (SELECT StuID FROM Has_Pet)
SELECT avg(age) FROM student WHERE id NOT IN (SELECT StuID FROM Has_Pet)
SELECT count(*) FROM continents
SELECT count(*) FROM continents
SELECT T1.ContId ,  T1.Continent ,  count(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId  =  T2.Continent GROUP BY T1.ContId
SELECT T1.ContId ,  T1.Continent ,  count(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId  =  T2.ContId GROUP BY T1.ContId
SELECT count(*) FROM countries
SELECT count(*) FROM countries
SELECT T1.FullName ,  T1.Id ,  count(*) FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id  =  T2.MakeId GROUP BY T1.Id
SELECT FullName ,  Id ,  count(*) FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id  =  T2.MakeId GROUP BY T1.Id
SELECT Model FROM cars_data WHERE Horsepower  =  (SELECT min(Horsepower) FROM cars_data)
SELECT model FROM cars_data WHERE horsepower  =  (SELECT min(horsepower) FROM cars_data)
SELECT model FROM cars_data WHERE weight  <  (SELECT avg(weight) FROM cars_data)
SELECT Model FROM cars_data WHERE Weight  <  (SELECT avg(Weight) FROM cars_data)
SELECT Maker FROM car_makers WHERE Id IN (SELECT MakeId FROM cars_data WHERE YEAR  =  1970)
SELECT DISTINCT T1.Maker FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id  =  T2.MakeId JOIN cars_data AS T3 ON T2.Model  =  T3.Model WHERE T3.Year  =  1970
SELECT Make ,  Year FROM cars_data WHERE Year  =  (SELECT min(Year) FROM cars_data)
SELECT Maker ,  min(Year) FROM cars_data GROUP BY Maker
SELECT DISTINCT Model FROM cars_data WHERE YEAR  >  1980
SELECT DISTINCT Model FROM cars_data WHERE Year  >  1980
SELECT T2.Continent ,  count(*) FROM car_makers AS T1 JOIN continents AS T2 ON T1.ContId  =  T2.ContId GROUP BY T2.Continent
SELECT T1.Continent ,  count(*) FROM continents AS T1 JOIN car_makers AS T2 ON T1.ContId  =  T2.Id GROUP BY T1.ContId
SELECT Country FROM countries WHERE CountryId IN (SELECT Country FROM car_makers GROUP BY Country ORDER BY count(*) DESC LIMIT 1)
SELECT Country FROM countries WHERE CountryId IN (SELECT Country FROM car_makers GROUP BY Country ORDER BY count(*) DESC LIMIT 1)
SELECT count(*) ,  T2.FullName FROM car_names AS T1 JOIN car_makers AS T2 ON T1.MakeId  =  T2.Id GROUP BY T2.FullName
SELECT count(*) ,  T1.id ,  T1.fullname FROM car_makers AS T1 JOIN car_names AS T2 ON T1.id  =  T2.makeid GROUP BY T1.id ,  T1.fullname
SELECT accelerate FROM cars_data WHERE id  =  (SELECT id FROM car_names WHERE model  =  'amc hornet sportabout (sw)')
SELECT accelerate FROM cars_data WHERE id IN (SELECT id FROM car_names WHERE model  =  'amc hornet sportabout (sw)')
SELECT count(*) FROM car_makers WHERE country  =  'France'
SELECT count(*) FROM car_makers WHERE Country  =  'France'
SELECT count(*) FROM car_names WHERE Make  =  'usa'
SELECT count(*) FROM car_names WHERE MakeId IN (SELECT Id FROM car_makers WHERE Country  =  'United States')
SELECT avg(mpg) FROM cars_data WHERE cylinders  =  4
SELECT avg(MPG) FROM cars_data WHERE Cylinders  =  4
SELECT min(weight) FROM cars_data WHERE cylinders  =  8 AND YEAR  =  1974
SELECT min(weight) FROM cars_data WHERE cylinders  =  8 AND year  =  1974
SELECT Maker ,  Model FROM car_names
SELECT Maker ,  Model FROM car_names
SELECT DISTINCT CountryName ,  CountryId FROM countries WHERE CountryId IN (SELECT Country FROM car_makers)
SELECT DISTINCT T1.CountryName ,  T1.CountryId FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId  =  T2.Country
SELECT count(*) FROM cars_data WHERE horsepower  >  150
SELECT count(*) FROM cars_data WHERE horsepower  >  150
SELECT avg(weight) ,  year FROM cars_data GROUP BY year
SELECT avg(weight) ,  year FROM cars_data GROUP BY year
SELECT DISTINCT Country FROM countries WHERE Continent  =  'Europe' AND CountryId IN (SELECT DISTINCT CountryId FROM car_makers GROUP BY CountryId HAVING count(*)  >  3)
SELECT DISTINCT T2.CountryName FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country  =  T2.CountryName WHERE T2.Continent  =  'Europe' GROUP BY T2.CountryName HAVING count(*)  >  2
SELECT max(Horsepower) ,  Make FROM cars_data WHERE Cylinders  =  3 GROUP BY Make
SELECT max(horsepower) ,  make FROM cars_data WHERE cylinders  =  3
SELECT Model FROM cars_data WHERE MPG  =  (SELECT max(MPG) FROM cars_data)
SELECT Model FROM cars_data WHERE MPG  =  (SELECT max(MPG) FROM cars_data)
SELECT avg(horsepower) FROM cars_data WHERE year  <  1980
SELECT avg(horsepower) FROM cars_data WHERE year  <  1980
SELECT avg(edispl) FROM cars_data WHERE model  =  'volvo'
SELECT avg(edispl) FROM cars_data WHERE Make  =  'volvo'
SELECT max(accelerate) ,  cylinders FROM cars_data GROUP BY cylinders
SELECT max(accelerate) ,  cylinders FROM cars_data GROUP BY cylinders
SELECT model FROM model_list GROUP BY model ORDER BY count(*) DESC LIMIT 1
SELECT model FROM cars_data GROUP BY model ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM cars_data WHERE Cylinders  >  4
SELECT count(*) FROM cars_data WHERE Cylinders  >  4
SELECT count(*) FROM cars_data WHERE YEAR  =  1980
SELECT count(*) FROM cars_data WHERE YEAR  =  1980
SELECT count(*) FROM car_names WHERE MakeId IN (SELECT Id FROM car_makers WHERE FullName  =  'American Motor Company')
SELECT count(*) FROM car_names WHERE MakeId IN (SELECT Id FROM car_makers WHERE Maker  =  'American Motor Company')
SELECT FullName ,  Id FROM car_makers WHERE Id IN (SELECT MakeId FROM car_names GROUP BY MakeId HAVING count(*)  >  3)
SELECT Maker ,  Id FROM car_makers WHERE Id IN (SELECT MakeId FROM car_names GROUP BY MakeId HAVING count(*)  >  3)
SELECT DISTINCT model FROM model_list WHERE maker IN (SELECT maker FROM car_makers WHERE fullname  =  'General Motors') OR model IN (SELECT model FROM cars_data WHERE weight  >  3500)
SELECT DISTINCT model FROM cars_data WHERE maker  =  'General Motors' OR weight  >  3500
SELECT DISTINCT YEAR FROM cars_data WHERE weight BETWEEN 3000 AND 4000
SELECT DISTINCT YEAR FROM cars_data WHERE weight  <  4000 INTERSECT SELECT DISTINCT YEAR FROM cars_data WHERE weight  >  3000
SELECT horsepower FROM cars_data WHERE accelerate  =  (SELECT max(accelerate) FROM cars_data)
SELECT horsepower FROM cars_data WHERE accelerate  =  (SELECT max(accelerate) FROM cars_data)
SELECT cylinders FROM cars_data WHERE model  =  'volvo' AND accelerate  =  (SELECT min(accelerate) FROM cars_data WHERE model  =  'volvo')
SELECT cylinders FROM cars_data WHERE model  =  'volvo' AND accelerate  =  (SELECT min(accelerate) FROM cars_data WHERE model  =  'volvo')
SELECT count(*) FROM cars_data WHERE accelerate  >  (SELECT max(accelerate) FROM cars_data)
SELECT count(*) FROM cars_data WHERE accelerate  >  (SELECT max(horsepower) FROM cars_data)
SELECT count(*) FROM (SELECT count(*) ,  Country FROM car_makers GROUP BY Country HAVING count(*)  >  2) AS T1
SELECT count(*) FROM (SELECT count(*) ,  Country FROM car_makers GROUP BY Country HAVING count(*)  >  2) AS T1
SELECT count(*) FROM cars_data WHERE Cylinders  >  6
SELECT count(*) FROM cars_data WHERE Cylinders  >  6
SELECT Model FROM cars_data WHERE Cylinders  =  4 ORDER BY Horsepower DESC LIMIT 1
SELECT model FROM cars_data WHERE cylinders  =  4 ORDER BY horsepower DESC LIMIT 1
SELECT T1.makeid ,  T1.make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.makeid  =  T2.makeid WHERE T2.horsepower  >  (SELECT min(horsepower) FROM cars_data) AND T2.cylinders  <  3
SELECT T1.make_id ,  T1.make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.make_id  =  T2.make_id WHERE T2.horsepower  >  (SELECT min(horsepower) FROM cars_data) AND T2.cylinders  <  4
SELECT max(MPG) FROM cars_data WHERE Cylinders  =  8 OR YEAR  <  1980
SELECT max(mpg) FROM cars_data WHERE cylinders  =  8 OR year  <  1980
SELECT Model FROM cars_data WHERE Weight  <  3500 AND Make  <>  'Ford Motor Company'
SELECT DISTINCT model FROM cars_data WHERE weight  <  3500 AND maker  !=  'Ford Motor Company'
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT DISTINCT T1.Id ,  T1.Maker FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id  =  T2.MakeId GROUP BY T1.Id HAVING count(*)  >  2 AND count(*)  >  3
SELECT DISTINCT T1.Id ,  T1.Maker FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id  =  T2.MakeId JOIN cars_data AS T3 ON T2.Model  =  T3.Model WHERE T1.Id IN (SELECT MakeId FROM car_names GROUP BY MakeId HAVING count(*)  >  2) GROUP BY T1.Id HAVING count(*)  >  3
SELECT id ,  name FROM countries WHERE id IN (SELECT countryid FROM car_makers GROUP BY countryid HAVING count(*)  >  3) OR id IN (SELECT countryid FROM car_makers WHERE maker  =  'fiat')
SELECT DISTINCT T1.CountryId ,  T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId  =  T2.CountryId WHERE T2.Maker  =  'Fiat' OR T1.CountryId IN (SELECT CountryId FROM car_makers GROUP BY CountryId HAVING count(*)  >  3)
SELECT Country FROM airlines WHERE Airline  =  'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline  =  'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline  =  'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline  =  'Jetblue Airways'
SELECT Airline ,  Abbreviation FROM airlines WHERE Country  =  'USA'
SELECT Airline ,  Abbreviation FROM airlines WHERE Country  =  'USA'
SELECT AirportCode ,  AirportName FROM airports WHERE City  =  'Anthony'
SELECT AirportCode ,  AirportName FROM airports WHERE City  =  'Anthony'
SELECT count(*) FROM airlines
SELECT count(*) FROM airlines
SELECT count(*) FROM airports
SELECT count(*) FROM airports
SELECT count(*) FROM flights
SELECT count(*) FROM flights
SELECT Airline FROM airlines WHERE Abbreviation  =  'UAL'
SELECT Airline FROM airlines WHERE Abbreviation  =  'UAL'
SELECT count(*) FROM airlines WHERE Country  =  'USA'
SELECT count(*) FROM airlines WHERE Country  =  'USA'
SELECT City ,  Country FROM airports WHERE AirportName  =  'Alton'
SELECT City ,  Country FROM airports WHERE AirportCode  =  'ALN'
SELECT AirportName FROM airports WHERE AirportCode  =  'AKO'
SELECT AirportName FROM airports WHERE AirportCode  =  'AKO'
SELECT AirportName FROM airports WHERE City  =  'Aberdeen'
SELECT AirportName FROM airports WHERE City  =  'Aberdeen'
SELECT count(*) FROM flights WHERE SourceAirport  =  'APG'
SELECT count(*) FROM flights WHERE SourceAirport  =  'APG'
SELECT count(*) FROM flights WHERE DestAirport  =  'ATO'
SELECT count(*) FROM flights WHERE DestAirport  =  'ATO'
SELECT count(*) FROM flights WHERE SourceAirport  =  'ABZ'
SELECT count(*) FROM flights WHERE SourceAirport  =  'ABR'
SELECT count(*) FROM flights WHERE DestAirport  =  'ABZ'
SELECT count(*) FROM flights WHERE DestAirport  =  'ABZ'
SELECT count(*) FROM flights WHERE SourceAirport  =  'Aberdeen' AND DestAirport  =  'Ashley'
SELECT count(*) FROM flights WHERE SourceAirport  =  'ABR' AND DestAirport  =  'ASY'
SELECT count(*) FROM flights WHERE Airline  =  'JetBlue Airways'
SELECT count(*) FROM flights WHERE Airline  =  'Jetblue Airways'
SELECT count(*) FROM flights WHERE Airline  =  'United Airlines' AND DestAirport  =  'ASY'
SELECT count(*) FROM flights WHERE DestAirport  =  'ASY' AND Airline  =  'United Airlines'
SELECT count(*) FROM flights WHERE Airline  =  'United Airlines' AND SourceAirport  =  'AHD'
SELECT count(*) FROM flights WHERE SourceAirport  =  'AHD' AND Airline  =  'United Airlines'
SELECT count(*) FROM flights WHERE Airline  =  'United Airlines' AND DestAirport  =  'Aberdeen'
SELECT count(*) FROM flights WHERE DestAirport  =  'ABR' AND Airline  =  'United Airlines'
SELECT City FROM airports WHERE AirportCode IN (SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY count(*) DESC LIMIT 1)
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY count(*) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY count(*) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY count(*) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY count(*) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY count(*) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY count(*) LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY count(*) LIMIT 1
SELECT Airline FROM flights GROUP BY Airline ORDER BY count(*) DESC LIMIT 1
SELECT Airline FROM flights GROUP BY Airline ORDER BY count(*) DESC LIMIT 1
SELECT abbreviation ,  country FROM airlines WHERE uid  =  (SELECT uid FROM flights GROUP BY uid ORDER BY count(*) ASC LIMIT 1)
SELECT Abbreviation ,  Country FROM airlines WHERE uid  =  (SELECT uid FROM flights GROUP BY uid ORDER BY count(*) ASC LIMIT 1)
SELECT DISTINCT Airline FROM flights WHERE SourceAirport  =  'AHD'
SELECT DISTINCT Airline FROM flights WHERE SourceAirport  =  'AHD'
SELECT Airline FROM flights WHERE DestAirport  =  'AHD'
SELECT DISTINCT Airline FROM flights WHERE DestAirport  =  'AHD'
SELECT DISTINCT Airline FROM flights WHERE SourceAirport  =  'APG' AND DestAirport  =  'CVO'
SELECT DISTINCT Airline FROM flights WHERE SourceAirport  =  'APG' AND DestAirport  =  'CVO'
SELECT DISTINCT Airline FROM flights WHERE SourceAirport  =  'CVO' EXCEPT SELECT DISTINCT Airline FROM flights WHERE SourceAirport  =  'APG'
SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport  =  T2.AirportCode WHERE T2.City  =  'CVO' EXCEPT SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport  =  T2.AirportCode WHERE T2.City  =  'APG'
SELECT Airline FROM flights GROUP BY Airline HAVING count(*)  >  10
SELECT Airline FROM flights GROUP BY Airline HAVING count(*)  >  10
SELECT Airline FROM flights GROUP BY Airline HAVING count(*)  <  200
SELECT Airline FROM flights GROUP BY Airline HAVING count(*)  <  200
SELECT FlightNo FROM flights WHERE Airline  =  'United Airlines'
SELECT FlightNo FROM flights WHERE Airline  =  'United Airlines'
SELECT FlightNo FROM flights WHERE SourceAirport  =  'APG'
SELECT FlightNo FROM flights WHERE SourceAirport  =  'APG'
SELECT FlightNo FROM flights WHERE DestAirport  =  'APG'
SELECT FlightNo FROM flights WHERE DestAirport  =  'APG'
SELECT FlightNo FROM flights WHERE SourceAirport  =  'Aberdeen'
SELECT FlightNo FROM flights WHERE SourceAirport  =  'ABR'
SELECT FlightNo FROM flights WHERE DestAirport  =  'Aberdeen'
SELECT FlightNo FROM flights WHERE DestAirport  =  'ABZ'
SELECT count(*) FROM flights WHERE DestAirport  =  'ABE' OR DestAirport  =  'ABI'
SELECT count(*) FROM flights WHERE DestAirport  =  'ABR' OR DestAirport  =  'ABI'
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT count(*) FROM employee
SELECT count(*) FROM employee
SELECT Name FROM employee ORDER BY Age
SELECT Name FROM employee ORDER BY Age
SELECT count(*) ,  city FROM employee GROUP BY city
SELECT count(*) ,  City FROM employee GROUP BY City
SELECT city FROM employee WHERE age  <  30 GROUP BY city HAVING count(*)  >  1
SELECT city FROM employee WHERE age  <  30 GROUP BY city HAVING count(*)  >  1
SELECT count(*) ,  Location FROM shop GROUP BY Location
SELECT count(*) ,  Location FROM shop GROUP BY Location
SELECT manager_name ,  district FROM shop WHERE number_products  =  (SELECT max(number_products) FROM shop)
SELECT manager_name ,  district FROM shop WHERE number_products  =  (SELECT max(number_products) FROM shop)
SELECT min(Number_products) ,  max(Number_products) FROM shop
SELECT min(Number_products) ,  max(Number_products) FROM shop
SELECT Name ,  Location ,  District FROM shop ORDER BY Number_products DESC
SELECT Name ,  Location ,  District FROM shop ORDER BY Number_products DESC
SELECT Name FROM shop WHERE Number_products  >  (SELECT avg(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products  >  (SELECT avg(Number_products) FROM shop)
SELECT T1.name FROM employee AS T1 JOIN evaluation AS T2 ON T1.employee_id  =  T2.employee_id GROUP BY T2.employee_id ORDER BY count(*) DESC LIMIT 1
SELECT name FROM employee WHERE Employee_ID IN (SELECT Employee_ID FROM evaluation GROUP BY Employee_ID ORDER BY count(*) DESC LIMIT 1)
SELECT name FROM employee WHERE Employee_ID  =  (SELECT Employee_ID FROM evaluation WHERE bonus  =  (SELECT max(bonus) FROM evaluation))
SELECT name FROM employee WHERE Employee_ID  =  (SELECT Employee_ID FROM evaluation WHERE Bonus  =  (SELECT max(Bonus) FROM evaluation))
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM shop WHERE Shop_ID  =  (SELECT Shop_ID FROM hiring GROUP BY Shop_ID ORDER BY count(*) DESC LIMIT 1)
SELECT T1.name FROM shop AS T1 JOIN hiring AS T2 ON T1.shop_id  =  T2.shop_id GROUP BY T1.shop_id ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT count(*) ,  T2.name FROM hiring AS T1 JOIN shop AS T2 ON T1.shop_id  =  T2.shop_id GROUP BY T1.shop_id
SELECT count(*) ,  T1.name FROM shop AS T1 JOIN hiring AS T2 ON T1.shop_id  =  T2.shop_id GROUP BY T1.shop_id
SELECT sum(bonus) FROM evaluation
SELECT sum(bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT district FROM shop WHERE number_products  <  3000 INTERSECT SELECT district FROM shop WHERE number_products  >  10000
SELECT DISTINCT district FROM shop WHERE number_products  <  3000 INTERSECT SELECT DISTINCT district FROM shop WHERE number_products  >  10000
SELECT count(DISTINCT Location) FROM shop
SELECT count(DISTINCT Location) FROM shop
SELECT count(*) FROM Documents
SELECT count(*) FROM Documents
SELECT Document_ID ,  Document_Name ,  Document_Description FROM Documents
SELECT Document_ID ,  Document_Name ,  Document_Description FROM Documents
SELECT Document_Name ,  Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name ,  Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_ID ,  Template_ID ,  Document_Description FROM Documents WHERE Document_Name  =  'Robbin CV'
SELECT Document_ID ,  Template_ID ,  Document_Description FROM Documents WHERE Document_Name  =  'Robbin CV'
SELECT count(*) FROM (SELECT DISTINCT T1.Template_ID FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID  =  T2.Template_ID)
SELECT count(DISTINCT T1.Template_ID) FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID  =  T2.Template_ID
SELECT count(*) FROM documents WHERE template_id IN (SELECT template_id FROM templates WHERE template_type_code  =  'PPT')
SELECT count(*) FROM documents WHERE template_id IN (SELECT template_id FROM templates WHERE template_type_code  =  'PPT')
SELECT T1.template_id ,  count(*) FROM templates AS T1 JOIN documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_id
SELECT Template_ID ,  count(*) FROM Documents GROUP BY Template_ID
SELECT T1.template_id ,  T1.template_type_code FROM templates AS T1 JOIN documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.template_id ,  T1.template_type_code FROM templates AS T1 JOIN documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_id ORDER BY count(*) DESC LIMIT 1
SELECT template_id FROM documents GROUP BY template_id HAVING count(*)  >  1
SELECT template_id FROM documents GROUP BY template_id HAVING count(*)  >  1
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT count(*) FROM Templates
SELECT count(*) FROM Templates
SELECT Template_ID ,  Version_Number ,  Template_Type_Code FROM Templates
SELECT Template_ID ,  Version_Number ,  Template_Type_Code FROM Templates
SELECT DISTINCT T1.Template_Type_Code FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code  =  T2.Template_Type_Code
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code  =  'PP' OR Template_Type_Code  =  'PPT'
SELECT Template_ID FROM Templates WHERE Template_Type_Code  =  'PP' OR Template_Type_Code  =  'PPT'
SELECT count(*) FROM Templates WHERE Template_Type_Code  =  'CV'
SELECT count(*) FROM Templates WHERE Template_Type_Code  =  'CV'
SELECT version_number ,  template_type_code FROM templates WHERE version_number  >  5
SELECT Version_Number ,  Template_Type_Code FROM Templates WHERE Version_Number  >  5
SELECT T1.Template_Type_Code ,  count(*) FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code  =  T2.Template_Type_Code GROUP BY T1.Template_Type_Code
SELECT Template_Type_Code ,  count(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code  =  T2.Template_Type_Code GROUP BY T1.Template_Type_Code HAVING count(*)  <  3
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING count(*)  <  3
SELECT min(version_number) ,  template_type_code FROM templates
SELECT min(version_number) ,  template_type_code FROM templates
SELECT T2.template_type_code FROM documents AS T1 JOIN templates AS T2 ON T1.template_id  =  T2.template_id WHERE T1.document_name  =  'Data base'
SELECT template_type_code FROM templates WHERE template_id IN (SELECT template_id FROM documents WHERE document_name  =  'Data base')
SELECT Document_Name FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code  =  'BK')
SELECT Document_Name FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code  =  'BK')
SELECT T1.Template_Type_Code ,  count(*) FROM Ref_Template_Types AS T1 JOIN Documents AS T2 ON T1.Template_Type_Code  =  T2.Template_Type_Code GROUP BY T1.Template_Type_Code
SELECT T1.Template_Type_Code ,  count(*) FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID  =  T2.Template_ID GROUP BY T1.Template_Type_Code
SELECT Template_Type_Code FROM Documents GROUP BY Template_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT T1.template_type_code FROM ref_template_types AS T1 JOIN templates AS T2 ON T1.template_type_code  =  T2.template_type_code GROUP BY T1.template_type_code ORDER BY count(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Documents)
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates)
SELECT * FROM Ref_Template_Types
SELECT Template_Type_Code ,  Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code  =  'AD'
SELECT template_type_description FROM ref_template_types WHERE template_type_code  =  'AD'
SELECT template_type_code FROM ref_template_types WHERE template_type_description  =  'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description  =  'Book'
SELECT DISTINCT T2.template_type_description FROM documents AS T1 JOIN ref_template_types AS T2 ON T1.template_type_code  =  T2.template_type_code
SELECT DISTINCT T2.Template_Description FROM Documents AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code  =  T2.Template_Type_Code
SELECT template_id FROM templates WHERE template_type_code IN (SELECT template_type_code FROM ref_template_types WHERE template_type_description  =  'Presentation')
SELECT Template_ID FROM Templates WHERE Template_Details LIKE '%Presentation%'
SELECT count(*) FROM Paragraphs
SELECT count(*) FROM Paragraphs
SELECT count(*) FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name  =  'Summer Show')
SELECT count(*) FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name  =  'Summer Show')
SELECT * FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_Text FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_ID ,  Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name  =  'Welcome to NY')
SELECT Paragraph_ID ,  Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name  =  'Welcome to NY')
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name  =  'Customer reviews')
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name  =  'Customer reviews')
SELECT T1.Document_ID ,  count(*) FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID  =  T2.Document_ID GROUP BY T1.Document_ID ORDER BY T1.Document_ID
SELECT Document_ID ,  count(*) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID
SELECT T1.Document_ID ,  T1.Document_Name ,  count(*) FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID  =  T2.Document_ID GROUP BY T1.Document_ID
SELECT T1.Document_ID ,  T1.Document_Name ,  count(*) FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID  =  T2.Document_ID GROUP BY T1.Document_ID
SELECT T1.document_id FROM documents AS T1 JOIN paragraphs AS T2 ON T1.document_id  =  T2.document_id GROUP BY T1.document_id HAVING count(*)  >  1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(*)  >  1
SELECT Document_ID ,  Document_Name FROM Documents WHERE Document_ID  =  (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY count(*) DESC LIMIT 1)
SELECT Document_ID ,  Document_Name FROM Documents WHERE Document_ID  =  (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY count(*) DESC LIMIT 1)
SELECT Document_ID FROM Documents WHERE Document_ID  =  (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY count(*) ASC LIMIT 1)
SELECT Document_ID FROM Documents WHERE Document_ID  =  (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY count(*) ASC LIMIT 1)
SELECT Document_ID FROM Documents WHERE Document_ID IN (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(*) BETWEEN 1 AND 2)
SELECT Document_ID FROM Documents WHERE Document_ID IN (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(*) BETWEEN 1 AND 2)
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Brazil%' AND Paragraph_Text LIKE '%Ireland%'
SELECT DISTINCT T1.Document_ID FROM Paragraphs AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID  =  T2.Document_ID WHERE T1.Paragraph_Text  =  'Brazil' AND T2.Paragraph_Text  =  'Ireland'
SELECT count(*) FROM teacher
SELECT count(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age
SELECT Name FROM teacher ORDER BY Age
SELECT Age ,  Hometown FROM teacher
SELECT Age ,  Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown  !=  'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown  !=  'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age  =  32 OR Age  =  33
SELECT Name FROM teacher WHERE Age  =  32 OR Age  =  33
SELECT hometown FROM teacher WHERE age  =  (SELECT min(age) FROM teacher)
SELECT hometown FROM teacher WHERE age  =  (SELECT min(age) FROM teacher)
SELECT hometown ,  count(*) FROM teacher GROUP BY hometown
SELECT Hometown ,  count(*) FROM teacher GROUP BY Hometown
SELECT hometown FROM teacher GROUP BY hometown ORDER BY count(*) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY count(*) DESC LIMIT 1
SELECT hometown FROM teacher GROUP BY hometown HAVING count(*)  >  1
SELECT hometown FROM teacher GROUP BY hometown HAVING count(*)  >  1
SELECT T2.Name ,  T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID
SELECT T2.Name ,  T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID
SELECT T2.Name ,  T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID ORDER BY T2.Name
SELECT T2.Name ,  T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID ORDER BY T2.Name
SELECT Name FROM teacher WHERE Teacher_ID IN (SELECT Teacher_ID FROM course_arrange WHERE Course_ID IN (SELECT Course_ID FROM course WHERE Course  =  'Math'))
SELECT name FROM instructor WHERE id IN (SELECT id FROM teaches WHERE course_id IN (SELECT course_id FROM course WHERE dept_name  =  'Math'))
SELECT Name ,  count(*) FROM teacher JOIN course_arrange ON teacher.Teacher_ID  =  course_arrange.Teacher_ID GROUP BY Name
SELECT T2.Name ,  count(*) FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID GROUP BY T1.Teacher_ID
SELECT Name FROM teacher WHERE Teacher_ID IN (SELECT Teacher_ID FROM course_arrange GROUP BY Teacher_ID HAVING count(*)  >  1)
SELECT Name FROM teacher WHERE Teacher_ID IN (SELECT Teacher_ID FROM course_arrange GROUP BY Teacher_ID HAVING count(*)  >  1)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT count(*) FROM visitor WHERE age  <  30
SELECT name FROM visitor WHERE Level_of_membership  >  4 ORDER BY Level_of_membership DESC
SELECT avg(age) FROM visitor WHERE level_of_membership  <=  4
SELECT name ,  Level_of_membership FROM visitor WHERE Level_of_membership  >  4 ORDER BY age
SELECT Museum_ID ,  Name FROM museum WHERE Num_of_Staff  =  (SELECT max(Num_of_Staff) FROM museum)
SELECT avg(Num_of_Staff) FROM museum WHERE Open_Year  <  2009
SELECT Open_Year ,  Num_of_Staff FROM museum WHERE Name  =  'Plaza Museum'
SELECT name FROM museum WHERE num_of_staff  >  (SELECT min(num_of_staff) FROM museum WHERE open_year  >  2010)
SELECT id ,  name ,  age FROM visitor WHERE id IN (SELECT visitor_id FROM visit GROUP BY visitor_id HAVING count(*)  >  1)
SELECT id ,  name ,  Level_of_membership FROM visitor WHERE id  =  (SELECT visitor_id FROM visit GROUP BY visitor_id ORDER BY sum(Total_spent) DESC LIMIT 1)
SELECT Museum_ID ,  Name FROM museum WHERE Museum_ID  =  (SELECT Museum_ID FROM visit GROUP BY Museum_ID ORDER BY count(*) DESC LIMIT 1)
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT name ,  age FROM visitor WHERE id  =  (SELECT visitor_id FROM visit ORDER BY num_of_ticket DESC LIMIT 1)
SELECT avg(Num_of_Ticket) ,  max(Num_of_Ticket) FROM visit
SELECT sum(Total_spent) FROM visit WHERE visitor_ID IN (SELECT ID FROM visitor WHERE Level_of_membership  =  1)
SELECT name FROM visitor WHERE id IN (SELECT visitor_id FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year  <  2009) INTERSECT SELECT visitor_id FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year  >  2011))
SELECT count(*) FROM visitor WHERE id NOT IN (SELECT visitor_id FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year  >  2010))
SELECT count(*) FROM museum WHERE Open_Year  >  2013 OR Open_Year  <  2008
SELECT count(*) FROM players
SELECT count(*) FROM players
SELECT count(*) FROM matches
SELECT count(*) FROM matches
SELECT first_name ,  birth_date FROM players WHERE country_code  =  'USA'
SELECT first_name ,  birth_date FROM players WHERE country_code  =  'USA'
SELECT avg(winner_age) ,  avg(loser_age) FROM matches
SELECT avg(winner_age) ,  avg(loser_age) FROM matches
SELECT avg(winner_rank) FROM matches
SELECT avg(winner_rank) FROM matches
SELECT max(loser_rank) FROM matches
SELECT min(loser_rank) FROM matches
SELECT count(DISTINCT country_code) FROM players
SELECT count(DISTINCT country_code) FROM players
SELECT count(DISTINCT loser_name) FROM matches
SELECT count(DISTINCT loser_name) FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*)  >  10
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*)  >  10
SELECT winner_name FROM matches WHERE year  =  2013 INTERSECT SELECT winner_name FROM matches WHERE year  =  2016
SELECT DISTINCT winner_name FROM matches WHERE year  =  2013 INTERSECT SELECT DISTINCT winner_name FROM matches WHERE year  =  2016
SELECT count(*) FROM matches WHERE YEAR  =  2013 OR YEAR  =  2016
SELECT count(*) FROM matches WHERE year  =  2013 OR year  =  2016
SELECT T1.country_code ,  T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'WTA Championships' INTERSECT SELECT T1.country_code ,  T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'Australian Open'
SELECT first_name ,  country_code FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE tourney_name  =  'WTA Championships' AND YEAR  =  '2011') AND player_id IN (SELECT winner_id FROM matches WHERE tourney_name  =  'Australian Open' AND YEAR  =  '2011')
SELECT first_name ,  country_code FROM players ORDER BY birth_date LIMIT 1
SELECT first_name ,  country_code FROM players ORDER BY birth_date LIMIT 1
SELECT first_name ,  last_name FROM players ORDER BY birth_date
SELECT first_name ,  last_name FROM players ORDER BY birth_date
SELECT first_name ,  last_name FROM players WHERE hand  =  'L' ORDER BY birth_date
SELECT first_name ,  last_name FROM players WHERE hand  =  'L' ORDER BY birth_date
SELECT first_name ,  country_code FROM players WHERE player_id  =  (SELECT player_id FROM rankings GROUP BY player_id ORDER BY sum(tours) DESC LIMIT 1)
SELECT first_name ,  country_code FROM players WHERE player_id  =  (SELECT player_id FROM rankings GROUP BY player_id ORDER BY sum(tours) DESC LIMIT 1)
SELECT year FROM matches GROUP BY year ORDER BY count(*) DESC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY count(*) DESC LIMIT 1
SELECT winner_name ,  winner_rank_points FROM matches GROUP BY winner_name ORDER BY count(*) DESC LIMIT 1
SELECT winner_name ,  winner_rank_points FROM matches WHERE winner_id  =  (SELECT winner_id FROM matches GROUP BY winner_id ORDER BY count(*) DESC LIMIT 1)
SELECT winner_name FROM matches WHERE tourney_id  =  'AUSO' ORDER BY winner_rank_points DESC LIMIT 1
SELECT winner_name FROM matches WHERE tourney_name  =  'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1
SELECT loser_name ,  winner_name FROM matches WHERE minutes  =  (SELECT max(minutes) FROM matches)
SELECT winner_name ,  loser_name FROM matches WHERE minutes  =  (SELECT max(minutes) FROM matches)
SELECT first_name ,  avg(ranking) FROM rankings JOIN players ON rankings.player_id  =  players.player_id GROUP BY players.player_id
SELECT first_name ,  avg(ranking) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY first_name
SELECT sum(ranking_points) ,  first_name FROM rankings AS T1 JOIN players AS T2 ON T1.player_id  =  T2.player_id GROUP BY T2.player_id
SELECT first_name ,  sum(ranking_points) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.player_id
SELECT country_code ,  count(*) FROM players GROUP BY country_code
SELECT country_code ,  count(*) FROM players GROUP BY country_code
SELECT country_code FROM players GROUP BY country_code ORDER BY count(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code ORDER BY count(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING count(*)  >  50
SELECT country_code FROM players GROUP BY country_code HAVING count(*)  >  50
SELECT sum(tours) ,  ranking_date FROM rankings GROUP BY ranking_date
SELECT ranking_date ,  sum(tours) FROM rankings GROUP BY ranking_date
SELECT year ,  count(*) FROM matches GROUP BY year
SELECT count(*) ,  year FROM matches GROUP BY year
SELECT winner_name ,  winner_rank FROM matches ORDER BY winner_age LIMIT 3
SELECT winner_name ,  winner_rank FROM matches ORDER BY winner_age LIMIT 3
SELECT count(*) FROM matches WHERE winner_id IN (SELECT player_id FROM players WHERE hand  =  'L') AND winner_id IN (SELECT player_id FROM matches WHERE tourney_name  =  'WTA Championships')
SELECT count(*) FROM matches AS T1 JOIN players AS T2 ON T1.winner_id  =  T2.player_id WHERE T2.hand  =  'L' AND T1.tourney_name  =  'WTA Championships'
SELECT first_name ,  country_code ,  birth_date FROM players WHERE player_id  =  (SELECT winner_id FROM matches WHERE winner_rank_points  =  (SELECT max(winner_rank_points) FROM matches))
SELECT first_name ,  country_code ,  birth_date FROM players WHERE player_id  =  (SELECT winner_id FROM matches ORDER BY winner_rank_points DESC LIMIT 1)
SELECT hand ,  count(*) FROM players GROUP BY hand
SELECT hand ,  count(*) FROM players GROUP BY hand
SELECT count(*) FROM ship WHERE disposition_of_ship  =  'Captured'
SELECT name ,  tonnage FROM ship ORDER BY name DESC
SELECT name ,  date ,  result FROM battle
SELECT max(killed) ,  min(killed) FROM death
SELECT avg(injured) FROM death
SELECT killed ,  injured FROM death WHERE caused_by_ship_id IN (SELECT id FROM ship WHERE tonnage  =  't')
SELECT name ,  result FROM battle WHERE bulgarian_commander  <>  'Boril'
SELECT id ,  name FROM battle WHERE id IN (SELECT lost_in_battle FROM ship WHERE ship_type  =  'Brig')
SELECT id ,  name FROM battle WHERE id IN (SELECT id FROM death GROUP BY id HAVING sum(killed)  >  10)
SELECT T1.id ,  T1.name FROM ship AS T1 JOIN death AS T2 ON T1.id  =  T2.caused_by_ship_id GROUP BY T1.id ORDER BY sum(T2.injured) DESC LIMIT 1
SELECT DISTINCT name FROM battle WHERE bulgarian_commander  =  'Kaloyan' AND latin_commander  =  'Baldwin I'
SELECT count(DISTINCT result) FROM battle
SELECT count(*) FROM battle WHERE id NOT IN (SELECT id FROM ship WHERE tonnage  =  225)
SELECT name ,  date FROM battle WHERE id IN (SELECT id FROM death WHERE caused_by_ship_id IN (SELECT id FROM ship WHERE name  =  'Lettice' OR name  =  'HMS Atalanta'))
SELECT name ,  result ,  bulgarian_commander FROM battle WHERE id NOT IN (SELECT id FROM ship WHERE lost_in_battle  =  'yes' AND location  =  'English Channel')
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1 ,  line_2 FROM Addresses
SELECT line_1 ,  line_2 FROM addresses
SELECT count(*) FROM course
SELECT count(*) FROM course
SELECT course_description FROM courses WHERE course_name  =  'Math'
SELECT course_description FROM courses WHERE course_name LIKE '%math%'
SELECT zip_postcode FROM Addresses WHERE city  =  'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city  =  'Port Chelsea'
SELECT department_name ,  department_id FROM degree_programs GROUP BY department_id ORDER BY count(*) DESC LIMIT 1
SELECT dept_name ,  id FROM department WHERE dept_name  =  (SELECT dept_name FROM degree_programs GROUP BY dept_name ORDER BY count(*) DESC LIMIT 1)
SELECT count(*) FROM department WHERE dept_name IN (SELECT dept_name FROM degree_program)
SELECT count(DISTINCT dept_name) FROM degree
SELECT count(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT count(*) FROM degree_program
SELECT count(*) FROM degree_program WHERE department_id  =  (SELECT department_id FROM department WHERE department_name  =  'Engineering')
SELECT count(*) FROM degree_program WHERE department_id  =  (SELECT department_id FROM department WHERE department_name  =  'Engineering')
SELECT section_name ,  section_description FROM Sections
SELECT section_name ,  section_description FROM sections
SELECT T1.title ,  T1.course_id FROM course AS T1 JOIN section AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  <=  2
SELECT T1.title ,  T1.course_id FROM course AS T1 JOIN section AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  <  2
SELECT section_name FROM section ORDER BY section_name DESC
SELECT sec_id FROM section ORDER BY sec_id DESC
SELECT semester ,  count(*) FROM takes GROUP BY semester ORDER BY count(*) DESC LIMIT 1
SELECT T1.name ,  T1.id FROM student AS T1 JOIN takes AS T2 ON T1.id  =  T2.id GROUP BY T2.semester ,  T2.YEAR ,  T1.id ORDER BY count(*) DESC
SELECT department_description FROM Departments WHERE department_name LIKE '%the computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT T1.first_name ,  T1.middle_name ,  T1.last_name ,  T1.student_id FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T1.id ,  T1.first_name ,  T1.middle_name ,  T1.last_name FROM students AS T1 JOIN student_enrolment AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id HAVING count(*)  =  2
SELECT first_name ,  middle_name ,  last_name FROM students WHERE student_id IN (SELECT student_id FROM student_enrolment WHERE degree_program_id  =  1)
SELECT first_name ,  middle_name ,  last_name FROM students WHERE student_id IN (SELECT student_id FROM student_enrolment WHERE degree_program_id  =  1)
SELECT degree_summary_name FROM degree_programs WHERE degree_program_id  =  (SELECT degree_program_id FROM student_enrolment GROUP BY degree_program_id ORDER BY count(*) DESC LIMIT 1)
SELECT degree_summary_name FROM degree_programs WHERE degree_program_id  =  (SELECT degree_program_id FROM student_enrolment GROUP BY degree_program_id ORDER BY count(*) DESC LIMIT 1)
SELECT degree_program_id ,  degree_summary_name FROM degree_programs GROUP BY degree_program_id ORDER BY count(*) DESC LIMIT 1
SELECT degree_program_id ,  degree_summary_name FROM degree_programs WHERE degree_program_id  =  (SELECT degree_program_id FROM student_enrolment GROUP BY degree_program_id ORDER BY count(*) DESC LIMIT 1)
SELECT T1.id ,  T1.first_name ,  T1.middle_name ,  T1.last_name ,  count(*) ,  T1.student_id FROM students AS T1 JOIN student_enrolment AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.first_name ,  T1.middle_name ,  T1.last_name ,  T1.student_id ,  count(*) FROM students AS T1 JOIN student_enrolment AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT semester FROM section WHERE course_id NOT IN (SELECT course_id FROM takes)
SELECT title FROM course WHERE course_id IN (SELECT course_id FROM takes)
SELECT title FROM course WHERE course_id IN (SELECT course_id FROM takes)
SELECT title FROM course WHERE course_id  =  (SELECT course_id FROM takes GROUP BY course_id ORDER BY count(*) DESC LIMIT 1)
SELECT title FROM course WHERE course_id  =  (SELECT course_id FROM takes GROUP BY course_id ORDER BY count(*) DESC LIMIT 1)
SELECT last_name FROM student WHERE current_address_id IN (SELECT address_id FROM addresses WHERE state_province_county  =  'North Carolina') AND student_id NOT IN (SELECT student_id FROM student_enrolment)
SELECT last_name FROM student WHERE current_address_id IN (SELECT address_id FROM addresses WHERE state_province_county  =  'North Carolina') AND student_id NOT IN (SELECT student_id FROM student_enrolment)
SELECT transcript_date ,  transcript_id FROM transcripts WHERE transcript_id IN (SELECT transcript_id FROM transcript_contents GROUP BY transcript_id HAVING count(*)  >  1)
SELECT transcript_date ,  transcript_id FROM transcripts WHERE transcript_id IN (SELECT transcript_id FROM transcript_contents GROUP BY transcript_id HAVING count(*)  >  1)
SELECT phone_number FROM person WHERE first_name  =  'Timmothy' AND last_name  =  'Ward'
SELECT cell_mobile_number FROM students WHERE first_name  =  'Timmothy' AND last_name  =  'Ward'
SELECT first_name ,  middle_name ,  last_name FROM students ORDER BY date_first_registered LIMIT 1
SELECT first_name ,  middle_name ,  last_name FROM student ORDER BY date_first_registered LIMIT 1
SELECT first_name ,  middle_name ,  last_name FROM students WHERE date_left  =  (SELECT min(date_left) FROM students)
SELECT first_name ,  middle_name ,  last_name FROM student WHERE date_left  =  (SELECT min(date_left) FROM student)
SELECT first_name FROM students WHERE current_address_id  <>  permanent_address_id
SELECT first_name FROM students WHERE current_address_id  <>  permanent_address_id
SELECT T1.address_id ,  T1.line_1 ,  T1.line_2 ,  T1.line_3 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id  =  T2.current_address_id GROUP BY T1.address_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.address_id ,  T1.line_1 ,  T1.line_2 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id  =  T2.current_address_id GROUP BY T1.address_id ORDER BY count(*) DESC LIMIT 1
SELECT avg(transcript_date) FROM transcripts
SELECT avg(transcript_date) FROM transcripts
SELECT transcript_date ,  other_details FROM transcripts ORDER BY transcript_date LIMIT 1
SELECT min(transcript_date) ,  other_details FROM transcripts
SELECT count(*) FROM transcripts
SELECT count(*) FROM transcripts
SELECT max(transcript_date) FROM transcripts
SELECT max(transcript_date) FROM transcripts
SELECT count(*) ,  student_course_id FROM transcript_contents GROUP BY student_course_id ORDER BY count(*) DESC LIMIT 1
SELECT max(count(*)) ,  T1.course_id FROM transcript_contents AS T1 JOIN student_enrolment_courses AS T2 ON T1.student_course_id  =  T2.student_course_id GROUP BY T1.course_id
SELECT transcript_date ,  transcript_id FROM transcripts GROUP BY transcript_id ORDER BY count(*) ASC LIMIT 1
SELECT transcript_date ,  transcript_id FROM transcripts WHERE transcript_id  =  (SELECT transcript_id FROM transcript_contents GROUP BY transcript_id ORDER BY count(*) ASC LIMIT 1)
SELECT semester FROM takes WHERE id IN (SELECT id FROM student WHERE dept_name  =  'Master') INTERSECT SELECT semester FROM takes WHERE id IN (SELECT id FROM student WHERE dept_name  =  'Bachelor')
SELECT semester_id FROM student_enrolment WHERE degree_program_id  =  1 AND semester_id IN (SELECT semester_id FROM student_enrolment WHERE degree_program_id  =  2)
SELECT count(DISTINCT current_address_id) FROM student
SELECT DISTINCT T1.address_id FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id  =  T2.current_address_id
SELECT * FROM student ORDER BY name DESC
SELECT other_student_details FROM students ORDER BY last_name DESC
SELECT * FROM section WHERE sec_id  =  'h'
SELECT section_description FROM sections WHERE section_name  =  'h'
SELECT first_name FROM students WHERE permanent_address_id IN (SELECT address_id FROM addresses WHERE country  =  'Haiti') OR cell_mobile_number  =  '09700166582'
SELECT first_name FROM students WHERE permanent_address_id IN (SELECT address_id FROM addresses WHERE country  =  'Haiti') OR cell_mobile_number  =  '09700166582'
SELECT title FROM Cartoon ORDER BY title
SELECT title FROM Cartoon ORDER BY title
SELECT * FROM Cartoon WHERE Directed_by  =  'Ben Jones'
SELECT title FROM Cartoon WHERE directed_by  =  'Ben Jones'
SELECT count(*) FROM Cartoon WHERE Written_by  =  'Joseph Kuhr'
SELECT count(*) FROM Cartoon WHERE Written_by  =  'Joseph Kuhr'
SELECT title ,  directed_by FROM cartoon ORDER BY original_air_date
SELECT title ,  Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT title FROM Cartoon WHERE Directed_by  =  'Ben Jones' OR Directed_by  =  'Brandon Vietti'
SELECT title FROM Cartoon WHERE Directed_by  =  'Ben Jones' OR Directed_by  =  'Brandon Vietti'
SELECT Country ,  count(*) FROM TV_Channel GROUP BY Country ORDER BY count(*) DESC LIMIT 1
SELECT Country ,  count(*) FROM TV_Channel GROUP BY Country ORDER BY count(*) DESC LIMIT 1
SELECT count(DISTINCT series_name) ,  count(DISTINCT content) FROM TV_Channel
SELECT count(DISTINCT series_name) ,  count(DISTINCT Content) FROM TV_Channel
SELECT content FROM TV_Channel WHERE series_name  =  'Sky Radio'
SELECT content FROM TV_Channel WHERE series_name  =  'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name  =  'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name  =  'Sky Radio'
SELECT count(*) FROM TV_Channel WHERE Language  =  'English'
SELECT count(*) FROM TV_Channel WHERE Language  =  'English'
SELECT Language ,  count(*) FROM TV_Channel GROUP BY Language ORDER BY count(*) ASC LIMIT 1
SELECT Language ,  count(*) FROM TV_Channel GROUP BY Language ORDER BY count(*) LIMIT 1
SELECT Language ,  count(*) FROM TV_Channel GROUP BY Language
SELECT Language ,  count(*) FROM TV_Channel GROUP BY Language
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.id  =  T2.id WHERE T1.Title  =  'The Rise of the Blue Beetle!'
SELECT series_name FROM TV_Channel WHERE id IN (SELECT id FROM Cartoon WHERE Title  =  'The Rise of the Blue Beetle')
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.id  =  T2.id WHERE T2.series_name  =  'Sky Radio'
SELECT title FROM Cartoon WHERE id IN (SELECT id FROM TV_Channel WHERE series_name  =  'Sky Radio')
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode ,  Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT Episode ,  Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT min(share) ,  max(share) FROM TV_series
SELECT max(share) ,  min(share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode  =  'A Love of a Lifetime'
SELECT Air_Date FROM TV_series WHERE Episode  =  'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode  =  'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode  =  'A Love of a Lifetime'
SELECT T2.series_name FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.id  =  T2.id WHERE T1.Episode  =  'A Love of a Lifetime'
SELECT series_name FROM TV_series WHERE episode  =  'A Love of a Lifetime'
SELECT Episode FROM TV_series WHERE Channel IN (SELECT id FROM TV_Channel WHERE series_name  =  'Sky Radio')
SELECT episode FROM TV_series WHERE series_name  =  'Sky Radio'
SELECT Directed_by ,  count(*) FROM Cartoon GROUP BY Directed_by
SELECT Directed_by ,  count(*) FROM Cartoon GROUP BY Directed_by
SELECT Production_code ,  Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Production_code ,  Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Package_Option ,  series_name FROM TV_Channel WHERE Hight_definition_TV  =  'Yes'
SELECT T2.Package_Option ,  T2.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id  =  T2.id WHERE T1.Hight_definition_TV  =  'Yes'
SELECT DISTINCT Country FROM TV_Channel WHERE id IN (SELECT id FROM Cartoon WHERE Written_by  =  'Todd Casey')
SELECT DISTINCT T2.Country FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.id  =  T2.id WHERE T1.Written_by  =  'Todd Casey'
SELECT DISTINCT Country FROM TV_Channel WHERE id NOT IN (SELECT id FROM Cartoon WHERE Written_by  =  'Todd Casey')
SELECT DISTINCT Country FROM TV_Channel WHERE id NOT IN (SELECT id FROM Cartoon WHERE Written_by  =  'Todd Casey')
SELECT series_name ,  Country FROM TV_Channel WHERE id IN (SELECT id FROM Cartoon WHERE Directed_by  =  'Ben Jones' OR Directed_by  =  'Michael Chang')
SELECT series_name ,  Country FROM TV_Channel WHERE id IN (SELECT id FROM Cartoon WHERE Directed_by  =  'Ben Jones' OR Directed_by  =  'Michael Chang')
SELECT Pixel_aspect_ratio_PAR ,  Country FROM TV_Channel WHERE Language  !=  'English'
SELECT Pixel_aspect_ratio_PAR ,  Country FROM TV_Channel WHERE Language  !=  'English'
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING count(*)  >  2)
SELECT id FROM TV_Channel WHERE id IN (SELECT id FROM TV_Channel GROUP BY id HAVING count(*)  >  2)
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT id FROM Cartoon WHERE Directed_by  =  'Ben Jones')
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT id FROM Cartoon WHERE Directed_by  =  'Ben Jones')
SELECT package_option FROM TV_Channel WHERE id NOT IN (SELECT id FROM Cartoon WHERE directed_by  =  'Ben Jones')
SELECT package_option FROM tv_channel WHERE id NOT IN (SELECT T1.id FROM tv_channel AS T1 JOIN cartoon AS T2 ON T1.id  =  T2.id WHERE T2.directed_by  =  'Ben Jones')
SELECT count(*) FROM poker_player
SELECT count(*) FROM poker_player
SELECT earnings FROM poker_player ORDER BY earnings DESC
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made ,  Best_Finish FROM poker_player
SELECT Final_Table_Made ,  Best_Finish FROM poker_player
SELECT avg(earnings) FROM poker_player
SELECT avg(earnings) FROM poker_player
SELECT Money_Rank FROM poker_player WHERE Earnings  =  (SELECT max(Earnings) FROM poker_player)
SELECT Money_Rank FROM poker_player WHERE Earnings  =  (SELECT max(Earnings) FROM poker_player)
SELECT max(final_table_made) FROM poker_player WHERE earnings  <  200000
SELECT max(final_table_made) FROM poker_player WHERE earnings  <  200000
SELECT name FROM people WHERE people_id IN (SELECT people_id FROM poker_player)
SELECT Name FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player)
SELECT name FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player WHERE Earnings  >  300000)
SELECT name FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player WHERE Earnings  >  300000)
SELECT name FROM people AS T1 JOIN poker_player AS T2 ON T1.people_id  =  T2.people_id ORDER BY final_table_made
SELECT name FROM people AS T1 JOIN poker_player AS T2 ON T1.people_id  =  T2.people_id ORDER BY final_table_made
SELECT Birth_Date FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player WHERE Earnings  =  (SELECT min(Earnings) FROM poker_player))
SELECT Birth_Date FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player WHERE Earnings  =  (SELECT min(Earnings) FROM poker_player))
SELECT Money_Rank FROM poker_player WHERE People_ID IN (SELECT People_ID FROM people WHERE Height  =  (SELECT max(Height) FROM people))
SELECT Money_Rank FROM poker_player WHERE People_ID  =  (SELECT People_ID FROM people WHERE Height  =  (SELECT max(Height) FROM people))
SELECT avg(earnings) FROM poker_player WHERE people_id IN (SELECT people_id FROM people WHERE height  >  200)
SELECT avg(earnings) FROM poker_player WHERE people_id IN (SELECT people_id FROM people WHERE height  >  200)
SELECT name FROM people AS T1 JOIN poker_player AS T2 ON T1.people_id  =  T2.people_id ORDER BY earnings DESC
SELECT name FROM people AS T1 JOIN poker_player AS T2 ON T1.people_id  =  T2.people_id ORDER BY earnings DESC
SELECT Nationality ,  count(*) FROM people GROUP BY Nationality
SELECT Nationality ,  count(*) FROM people GROUP BY Nationality
SELECT Nationality FROM people GROUP BY Nationality ORDER BY count(*) DESC LIMIT 1
SELECT nationality FROM people GROUP BY nationality ORDER BY count(*) DESC LIMIT 1
SELECT nationality FROM people GROUP BY nationality HAVING count(*)  >  1
SELECT nationality FROM people GROUP BY nationality HAVING count(*)  >  1
SELECT name ,  birth_date FROM people ORDER BY name
SELECT name ,  birth_date FROM people ORDER BY name
SELECT name FROM people WHERE nationality  <>  'Russia'
SELECT name FROM people WHERE nationality  <>  'Russia'
SELECT name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT count(DISTINCT Nationality) FROM people
SELECT count(DISTINCT Nationality) FROM people
SELECT count(*) FROM AREA_CODE_STATE
SELECT contestant_number ,  contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC
SELECT vote_id ,  phone_number ,  state FROM votes
SELECT max(area_code) ,  min(area_code) FROM AREA_CODE_STATE
SELECT max(created) FROM votes WHERE state  =  'CA'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name NOT IN ('Jessie Alloway')
SELECT DISTINCT state ,  created FROM votes
SELECT contestant_number ,  contestant_name FROM CONTESTANTS WHERE contestant_number IN (SELECT contestant_number FROM VOTES GROUP BY contestant_number HAVING count(*)  >  1)
SELECT contestant_number ,  contestant_name FROM CONTESTANTS WHERE contestant_number IN (SELECT contestant_number FROM VOTES GROUP BY contestant_number ORDER BY count(*) ASC LIMIT 1)
SELECT count(*) FROM VOTES WHERE state  =  'NY' OR state  =  'CA'
SELECT count(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)
SELECT area_code FROM AREA_CODE_STATE WHERE area_code IN (SELECT area_code FROM VOTES GROUP BY area_code ORDER BY count(*) DESC LIMIT 1)
SELECT created ,  state ,  phone_number FROM votes WHERE contestant_number IN (SELECT contestant_number FROM contestants WHERE contestant_name  =  'Tabatha Gehling')
SELECT area_code FROM VOTES WHERE contestant_number IN (SELECT contestant_number FROM CONTESTANTS WHERE contestant_name  =  'Tabatha Gehling') INTERSECT SELECT area_code FROM VOTES WHERE contestant_number IN (SELECT contestant_number FROM CONTESTANTS WHERE contestant_name  =  'Kelly Clauss')
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear  >  1950
SELECT name FROM country WHERE IndepYear  >  1950
SELECT count(*) FROM country WHERE GovernmentForm  =  'Republic'
SELECT count(*) FROM country WHERE GovernmentForm LIKE '%republic%'
SELECT sum(surfacearea) FROM country WHERE region  =  'Caribbean'
SELECT sum(surfacearea) FROM country WHERE region  =  'Caribbean'
SELECT continent FROM country WHERE name  =  'Anguilla'
SELECT continent FROM country WHERE code  =  (SELECT countrycode FROM city WHERE name  =  'Anguilla')
SELECT region FROM country WHERE code IN (SELECT countrycode FROM city WHERE name  =  'Kabul')
SELECT Region FROM city AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T1.Name  =  'Kabul'
SELECT Language FROM countrylanguage WHERE CountryCode  =  'ABW' ORDER BY Percentage DESC LIMIT 1
SELECT Language FROM countrylanguage WHERE CountryCode  =  (SELECT Code FROM country WHERE Name  =  'Aruba')
SELECT T1.population ,  T2.lifeexpectancy FROM country AS T1 JOIN country AS T2 ON T1.code  =  T2.code WHERE T1.name  =  'Brazil'
SELECT population ,  lifeexpectancy FROM country WHERE name  =  'Brazil'
SELECT region ,  population FROM country WHERE name  =  'Angola'
SELECT Region ,  Population FROM country WHERE Name  =  'Angola'
SELECT avg(LifeExpectancy) FROM country WHERE Region  =  'Central Africa'
SELECT avg(LifeExpectancy) FROM country WHERE Region  =  'Central Africa'
SELECT name FROM country WHERE continent  =  'Asia' AND LifeExpectancy  =  (SELECT min(LifeExpectancy) FROM country WHERE continent  =  'Asia')
SELECT name FROM country WHERE continent  =  'Asia' ORDER BY lifeexpectancy LIMIT 1
SELECT sum(population) ,  max(GNP) FROM country WHERE continent  =  'Asia'
SELECT sum(population) ,  max(GNP) FROM country WHERE continent  =  'Asia'
SELECT avg(LifeExpectancy) FROM country WHERE Continent  =  'Africa' AND GovernmentForm  =  'Republic'
SELECT avg(LifeExpectancy) FROM country WHERE Continent  =  'Africa' AND GovernmentForm  =  'Republic'
SELECT sum(SurfaceArea) FROM country WHERE Continent  =  'Asia' OR Continent  =  'Europe'
SELECT sum(surfacearea) FROM country WHERE continent  =  'Asia' OR continent  =  'Europe'
SELECT sum(population) FROM city WHERE district  =  'Gelderland'
SELECT sum(population) FROM city WHERE district  =  'Gelderland'
SELECT avg(GNP) ,  sum(Population) FROM country WHERE GovernmentForm  =  'US Territory'
SELECT avg(GNP) ,  sum(Population) FROM country WHERE GovernmentForm  =  'Dependent Territory of the US'
SELECT count(DISTINCT Language) FROM countrylanguage
SELECT count(DISTINCT language) FROM countrylanguage
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent  =  'Africa'
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent  =  'Africa'
SELECT sum(Percentage) FROM countrylanguage WHERE CountryCode  =  'ABW'
SELECT count(*) FROM countrylanguage WHERE CountryCode  =  'ABW'
SELECT count(*) FROM countrylanguage WHERE CountryCode  =  'AFG' AND IsOfficial  =  'T'
SELECT count(*) FROM countrylanguage WHERE CountryCode  =  'AFG' AND IsOfficial  =  'T'
SELECT T1.name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.countrycode GROUP BY T2.countrycode ORDER BY count(*) DESC LIMIT 1
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage GROUP BY countrycode ORDER BY count(*) DESC LIMIT 1)
SELECT continent FROM country GROUP BY continent ORDER BY count(DISTINCT language) DESC LIMIT 1
SELECT continent FROM country GROUP BY continent ORDER BY sum(population) DESC LIMIT 1
SELECT count(*) FROM countrylanguage WHERE Language  =  'English' AND CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language  =  'Dutch')
SELECT count(*) FROM countrylanguage WHERE language  =  'English' AND language  =  'Dutch'
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language  =  'English' INTERSECT SELECT countrycode FROM countrylanguage WHERE language  =  'French')
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language  =  'English' INTERSECT SELECT countrycode FROM countrylanguage WHERE language  =  'French')
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language  =  'English' AND isofficial  =  'T') AND code IN (SELECT countrycode FROM countrylanguage WHERE language  =  'French' AND isofficial  =  'T')
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language  =  'English' AND isofficial  =  'T') AND code IN (SELECT countrycode FROM countrylanguage WHERE language  =  'French' AND isofficial  =  'T')
SELECT count(DISTINCT T2.Continent) FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T1.Language  =  'Chinese'
SELECT count(DISTINCT T1.Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'Chinese'
SELECT DISTINCT region FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language  =  'English' OR language  =  'Dutch')
SELECT DISTINCT region FROM countrylanguage AS T1 JOIN country AS T2 ON T1.countrycode  =  T2.code WHERE T1.language  =  'Dutch' OR T1.language  =  'English'
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language  =  'English' OR Language  =  'Dutch'
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language  =  'English' OR Language  =  'Dutch'
SELECT language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE Continent  =  'Asia') GROUP BY language ORDER BY sum(Percentage) DESC LIMIT 1
SELECT language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE Continent  =  'Asia') GROUP BY language ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT T1.language FROM countrylanguage AS T1 JOIN country AS T2 ON T1.countrycode  =  T2.code WHERE T2.governmentform  =  'Republic' AND T1.countrycode IN (SELECT countrycode FROM countrylanguage GROUP BY countrycode HAVING count(*)  =  1)
SELECT DISTINCT T1.Language FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T2.GovernmentForm  =  'Republic' AND T1.Language NOT IN (SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE GovernmentForm  =  'Republic' AND Code  <>  T1.CountryCode))
SELECT Name FROM city WHERE CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language  =  'English') AND Population  =  (SELECT max(Population) FROM city WHERE CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language  =  'English'))
SELECT Name FROM city WHERE id IN (SELECT id FROM countrylanguage WHERE Language  =  'English' AND Percentage  =  (SELECT max(Percentage) FROM countrylanguage WHERE Language  =  'English'))
SELECT name ,  population ,  lifeexpectancy FROM country WHERE continent  =  'Asia' ORDER BY surfacearea DESC LIMIT 1
SELECT name ,  population ,  lifeexpectancy FROM country WHERE continent  =  'Asia' AND surfacearea  =  (SELECT max(surfacearea) FROM country WHERE continent  =  'Asia')
SELECT avg(lifeexpectancy) FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE isofficial  =  'F' AND language  =  'English')
SELECT avg(T1.lifeexpectancy) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.countrycode WHERE T2.language  <>  'English'
SELECT sum(population) FROM city WHERE id IN (SELECT id FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language  =  'English'))
SELECT sum(population) FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language  =  'English')
SELECT language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE HeadOfState  =  'Beatrix') AND IsOfficial  =  'T'
SELECT language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE HeadOfState  =  'Beatrix') AND IsOfficial  =  'T'
SELECT count(DISTINCT language) FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE IndepYear  <  1930) AND IsOfficial  =  'T'
SELECT count(DISTINCT language) FROM countrylanguage WHERE countrycode IN (SELECT code FROM country WHERE indepyear  <  1930)
SELECT Name FROM country WHERE SurfaceArea  >  (SELECT max(SurfaceArea) FROM country WHERE Continent  =  'Europe')
SELECT Name FROM country WHERE SurfaceArea  >  (SELECT max(SurfaceArea) FROM country WHERE Continent  =  'Europe')
SELECT Name FROM country WHERE Continent  =  'Africa' AND Population  <  (SELECT min(Population) FROM country WHERE Continent  =  'Asia')
SELECT Name FROM country WHERE Continent  =  'Africa' AND Population  <  (SELECT min(Population) FROM country WHERE Continent  =  'Asia')
SELECT Name FROM country WHERE Continent  =  'Asia' AND Population  >  (SELECT max(Population) FROM country WHERE Continent  =  'Africa')
SELECT Name FROM country WHERE Continent  =  'Asia' AND Population  >  (SELECT max(Population) FROM country WHERE Continent  =  'Africa')
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language  <>  'English'
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language  <>  'English'
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language  <>  'English'
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language  <>  'English'
SELECT code FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language  =  'English') AND governmentform NOT IN (SELECT governmentform FROM country WHERE governmentform  =  'Republic')
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language  <>  'English' EXCEPT SELECT DISTINCT Code FROM country WHERE GovernmentForm  =  'Republic'
SELECT T1.name FROM city AS T1 JOIN country AS T2 ON T1.countrycode  =  T2.code WHERE T2.continent  =  'Europe' AND T2.code NOT IN (SELECT countrycode FROM countrylanguage WHERE language  =  'English' AND isofficial  =  'T')
SELECT Name FROM city WHERE CountryCode IN (SELECT CountryCode FROM country WHERE Continent  =  'Europe') AND id NOT IN (SELECT id FROM countrylanguage WHERE IsOfficial  =  'T' AND Language  =  'English')
SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code JOIN countrylanguage AS T3 ON T2.Code  =  T3.CountryCode WHERE T2.Continent  =  'Asia' AND T3.Language  =  'Chinese' AND T3.IsOfficial  =  'T'
SELECT DISTINCT T1.name FROM city AS T1 JOIN country AS T2 ON T1.countrycode  =  T2.code JOIN countrylanguage AS T3 ON T2.code  =  T3.countrycode WHERE T2.continent  =  'Asia' AND T3.language  =  'Chinese' AND T3.isofficial  =  'T'
SELECT Name ,  IndepYear ,  SurfaceArea FROM country WHERE Population  =  (SELECT min(Population) FROM country)
SELECT name ,  IndepYear ,  SurfaceArea FROM country WHERE population  =  (SELECT min(population) FROM country)
SELECT population ,  name ,  headofstate FROM country WHERE surfacearea  =  (SELECT max(surfacearea) FROM country)
SELECT name ,  population ,  headofstate FROM country WHERE surfacearea  =  (SELECT max(surfacearea) FROM country)
SELECT T1.name ,  count(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.countrycode GROUP BY T1.code HAVING count(*)  >  3
SELECT Name ,  count(*) FROM countrylanguage GROUP BY CountryCode HAVING count(*)  >  2
SELECT count(*) ,  district FROM city WHERE population  >  (SELECT avg(population) FROM city) GROUP BY district
SELECT count(*) ,  district FROM city GROUP BY district HAVING count(*)  >  (SELECT avg(population) FROM city)
SELECT governmentform ,  sum(population) FROM country GROUP BY governmentform HAVING avg(lifeexpectancy)  >  72
SELECT governmentform ,  sum(population) FROM country GROUP BY governmentform HAVING avg(lifeexpectancy)  >  72
SELECT avg(lifeexpectancy) ,  sum(population) ,  continent FROM country GROUP BY continent HAVING avg(lifeexpectancy)  <  72
SELECT T1.Continent ,  sum(T1.Population) ,  avg(T1.LifeExpectancy) FROM country AS T1 GROUP BY T1.Continent HAVING avg(T1.LifeExpectancy)  <  72
SELECT Name ,  SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT name ,  surfacearea FROM country ORDER BY surfacearea DESC LIMIT 5
SELECT name FROM country ORDER BY population DESC LIMIT 3
SELECT name FROM country ORDER BY population DESC LIMIT 3
SELECT name FROM country ORDER BY population LIMIT 3
SELECT name FROM country ORDER BY population LIMIT 3
SELECT count(*) FROM country WHERE continent  =  'Asia'
SELECT count(*) FROM country WHERE continent  =  'Asia'
SELECT name FROM country WHERE continent  =  'Europe' AND population  =  80000
SELECT name FROM country WHERE continent  =  'Europe' AND population  =  80000
SELECT sum(population) ,  avg(surfacearea) FROM country WHERE continent  =  'North America' AND surfacearea  >  3000
SELECT sum(population) ,  avg(surfacearea) FROM country WHERE continent  =  'North America' AND surfacearea  >  3000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT language FROM countrylanguage GROUP BY language ORDER BY count(*) DESC LIMIT 1
SELECT language FROM countrylanguage GROUP BY language ORDER BY count(*) DESC LIMIT 1
SELECT T1.Language ,  T1.CountryCode FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T1.Percentage  =  (SELECT max(Percentage) FROM countrylanguage AS T3 WHERE T3.CountryCode  =  T1.CountryCode)
SELECT T1.Code ,  T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Percentage  =  (SELECT max(Percentage) FROM countrylanguage WHERE CountryCode  =  T1.Code)
SELECT count(*) FROM countrylanguage WHERE Percentage  =  (SELECT max(Percentage) FROM countrylanguage WHERE Language  =  'Spanish')
SELECT count(*) FROM countrylanguage WHERE Language  =  'Spanish' AND Percentage  >  50
SELECT CountryCode FROM countrylanguage WHERE Language  =  'Spanish' GROUP BY CountryCode ORDER BY Percentage DESC LIMIT 1
SELECT CountryCode FROM countrylanguage WHERE Language  =  'Spanish' AND Percentage  >  (SELECT avg(Percentage) FROM countrylanguage WHERE Language  =  'Spanish')
SELECT count(*) FROM conductor
SELECT count(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor WHERE Nationality  !=  'USA'
SELECT Name FROM conductor WHERE Nationality  !=  'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT avg(attendance) FROM show
SELECT avg(attendance) FROM show
SELECT max(share) ,  min(share) FROM performance WHERE type  <>  'Live final'
SELECT max(share) ,  min(share) FROM performance WHERE type  <>  'Live final'
SELECT count(DISTINCT Nationality) FROM conductor
SELECT count(DISTINCT nationality) FROM conductor
SELECT name FROM conductor ORDER BY year_of_work DESC
SELECT name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor WHERE Year_of_Work  =  (SELECT max(Year_of_Work) FROM conductor)
SELECT Name FROM conductor WHERE Age  =  (SELECT max(Age) FROM conductor)
SELECT T1.Name ,  T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID
SELECT T1.Name ,  T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID
SELECT name FROM conductor WHERE conductor_id IN (SELECT conductor_id FROM orchestra GROUP BY conductor_id HAVING count(*)  >  1)
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING count(*)  >  1
SELECT name FROM conductor WHERE conductor_id  =  (SELECT conductor_id FROM orchestra GROUP BY conductor_id ORDER BY count(*) DESC LIMIT 1)
SELECT T1.name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.conductor_id  =  T2.conductor_id GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.conductor_id  =  T2.conductor_id WHERE T2.year_of_founded  >  2008
SELECT T1.name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.conductor_id  =  T2.conductor_id WHERE T2.year_of_founded  >  2008
SELECT Record_Company ,  count(*) FROM orchestra GROUP BY Record_Company
SELECT count(*) ,  Record_Company FROM orchestra GROUP BY Record_Company
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY count(*)
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY count(*) DESC
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY count(*) DESC LIMIT 1
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY count(*) DESC LIMIT 1
SELECT orchestra FROM orchestra WHERE orchestra_id NOT IN (SELECT orchestra_id FROM performance)
SELECT orchestra FROM orchestra WHERE orchestra_id NOT IN (SELECT orchestra_id FROM performance)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded  <  2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded  >  2003
SELECT DISTINCT Record_Company FROM orchestra WHERE Year_of_Founded  <  2003 INTERSECT SELECT DISTINCT Record_Company FROM orchestra WHERE Year_of_Founded  >  2003
SELECT count(*) FROM orchestra WHERE Major_Record_Format  =  'CD' OR Major_Record_Format  =  'DVD'
SELECT count(*) FROM orchestra WHERE Major_Record_Format  =  'CD' OR Major_Record_Format  =  'DVD'
SELECT YEAR_of_Founded FROM orchestra WHERE Orchestra_ID IN (SELECT T1.Orchestra_ID FROM performance AS T1 GROUP BY T1.Orchestra_ID HAVING count(*)  >  1)
SELECT Year_of_Founded FROM orchestra WHERE Orchestra_ID IN (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING count(*)  >  1)
SELECT count(*) FROM highschooler
SELECT count(*) FROM highschooler
SELECT name ,  grade FROM highschooler
SELECT name ,  grade FROM highschooler
SELECT * FROM highschooler
SELECT T1.name ,  T2.grade FROM highschooler AS T1 JOIN likes AS T2 ON T1.id  =  T2.student_id
SELECT grade FROM takes WHERE id  =  (SELECT id FROM student WHERE name  =  'Kyle')
SELECT grade FROM highschooler WHERE name  =  'Kyle'
SELECT name FROM Highschooler WHERE grade  =  10
SELECT name FROM Highschooler WHERE grade  =  10
SELECT id FROM highschooler WHERE name  =  'Kyle'
SELECT id FROM Highschooler WHERE name  =  'Kyle'
SELECT count(*) FROM Highschooler WHERE grade  =  9 OR grade  =  10
SELECT count(*) FROM Highschooler WHERE grade  =  9 OR grade  =  10
SELECT grade ,  count(*) FROM highschooler GROUP BY grade
SELECT grade ,  count(*) FROM highschooler GROUP BY grade
SELECT grade FROM highschooler GROUP BY grade ORDER BY count(*) DESC LIMIT 1
SELECT grade FROM highschooler GROUP BY grade ORDER BY count(*) DESC LIMIT 1
SELECT grade FROM takes GROUP BY grade HAVING count(*)  >  3
SELECT grade FROM highschooler GROUP BY grade HAVING count(*)  >  3
SELECT student_id ,  count(*) FROM Friend GROUP BY student_id
SELECT T1.name ,  count(*) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id  =  T2.student_id GROUP BY T1.name
SELECT name ,  count(*) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id  =  T2.student_id GROUP BY T1.id
SELECT T1.name ,  count(*) FROM highschooler AS T1 JOIN friend AS T2 ON T1.id  =  T2.student_id GROUP BY T1.id
SELECT name FROM highschooler WHERE id  =  (SELECT student_id FROM friend GROUP BY student_id ORDER BY count(*) DESC LIMIT 1)
SELECT name FROM highschooler WHERE id  =  (SELECT student_id FROM friend GROUP BY student_id ORDER BY count(*) DESC LIMIT 1)
SELECT name FROM highschooler WHERE id IN (SELECT student_id FROM friend GROUP BY student_id HAVING count(*)  >  2)
SELECT name FROM highschooler WHERE id IN (SELECT student_id FROM friend GROUP BY student_id HAVING count(*)  >  2)
SELECT name FROM highschooler WHERE id IN (SELECT friend_id FROM friend WHERE student_id IN (SELECT id FROM highschooler WHERE name  =  'Kyle'))
SELECT T2.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id  =  T2.student_id WHERE T1.name  =  'Kyle'
SELECT count(*) FROM Friend WHERE student_id  =  (SELECT id FROM Highschooler WHERE name  =  'Kyle')
SELECT count(*) FROM Friend WHERE student_id  =  (SELECT id FROM Highschooler WHERE name  =  'Kyle')
SELECT id FROM student WHERE id NOT IN (SELECT student_id FROM Friend)
SELECT id FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend)
SELECT name FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend)
SELECT name FROM student WHERE id NOT IN (SELECT student_id FROM Friend)
SELECT T1.id FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id  =  T2.student_id JOIN Likes AS T3 ON T1.id  =  T3.student_id
SELECT DISTINCT T1.id FROM student AS T1 JOIN Friend AS T2 ON T1.id  =  T2.id JOIN Likes AS T3 ON T1.id  =  T3.id
SELECT name FROM student WHERE id IN (SELECT student_id FROM Friend) AND id IN (SELECT liked_id FROM Likes)
SELECT name FROM highschooler WHERE id IN (SELECT student_id FROM friend) AND id IN (SELECT student_id FROM likes)
SELECT student_id ,  count(*) FROM Likes GROUP BY student_id
SELECT student_id ,  count(*) FROM Likes GROUP BY student_id
SELECT T1.name ,  count(*) FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.id  =  T2.student_id GROUP BY T1.id
SELECT T1.name ,  count(*) FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.id  =  T2.student_id GROUP BY T1.id
SELECT name FROM highschooler WHERE id  =  (SELECT student_id FROM likes GROUP BY student_id ORDER BY count(*) DESC LIMIT 1)
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.id  =  T2.student_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT name FROM student WHERE id IN (SELECT student_id FROM likes GROUP BY student_id HAVING count(*)  >  1)
SELECT name FROM student WHERE id IN (SELECT student_id FROM likes GROUP BY student_id HAVING count(*)  >  1)
SELECT name FROM student WHERE id IN (SELECT id FROM takes WHERE grade  >  5) AND id IN (SELECT student_id FROM Friend GROUP BY student_id HAVING count(*)  >  1)
SELECT name FROM highschooler WHERE grade  >  5 AND id IN (SELECT student_id FROM friend GROUP BY student_id HAVING count(*)  >  1)
SELECT count(*) FROM likes WHERE student_id  =  (SELECT id FROM highschooler WHERE name  =  'Kyle')
SELECT count(*) FROM likes WHERE student_id IN (SELECT id FROM highschooler WHERE name  =  'Kyle')
SELECT avg(grade) FROM takes WHERE id IN (SELECT student_id FROM Friend)
SELECT avg(grade) FROM takes WHERE id IN (SELECT student_id FROM Friend)
SELECT min(grade) FROM takes WHERE id NOT IN (SELECT student_id FROM Friend)
SELECT min(grade) FROM takes WHERE id NOT IN (SELECT student_id FROM Friend)
SELECT state FROM owners WHERE state IN (SELECT state FROM professionals)
SELECT state FROM owners WHERE state IN (SELECT state FROM professionals)
SELECT avg(age) FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments)
SELECT avg(age) FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments)
SELECT professional_id ,  last_name ,  cell_number FROM professionals WHERE state  =  'Indiana' OR professional_id IN (SELECT professional_id FROM treatments GROUP BY professional_id HAVING count(*)  >  2)
SELECT professional_id ,  last_name ,  cell_number FROM professionals WHERE state  =  'Indiana' OR professional_id IN (SELECT professional_id FROM treatments GROUP BY professional_id HAVING count(*)  >  2)
SELECT name FROM dogs WHERE dog_id NOT IN (SELECT dog_id FROM treatments WHERE cost_of_treatment  >  1000)
SELECT name FROM dogs WHERE dog_id NOT IN (SELECT dog_id FROM treatments WHERE cost_of_treatment  >  1000)
SELECT first_name FROM owners WHERE first_name NOT IN (SELECT name FROM dogs) UNION SELECT first_name FROM professionals WHERE first_name NOT IN (SELECT name FROM dogs)
SELECT first_name FROM owners WHERE first_name NOT IN (SELECT name FROM dogs) UNION SELECT first_name FROM professionals WHERE first_name NOT IN (SELECT name FROM dogs)
SELECT professional_id ,  role_code ,  email_address FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT professional_id ,  role_code ,  email_address FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT T1.owner_id ,  T1.first_name ,  T1.last_name FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id GROUP BY T1.owner_id ORDER BY count(*) DESC LIMIT 1
SELECT owner_id ,  first_name ,  last_name FROM owners WHERE owner_id  =  (SELECT owner_id FROM dogs GROUP BY owner_id ORDER BY count(*) DESC LIMIT 1)
SELECT T1.professional_id ,  T1.role_code ,  T1.first_name FROM professionals AS T1 JOIN treatments AS T2 ON T1.professional_id  =  T2.professional_id GROUP BY T1.professional_id HAVING count(*)  >  1
SELECT T1.professional_id ,  T1.role_code ,  T1.first_name FROM professionals AS T1 JOIN treatments AS T2 ON T1.professional_id  =  T2.professional_id GROUP BY T1.professional_id HAVING count(*)  >  1
SELECT breed_name FROM breeds WHERE breed_code  =  (SELECT breed_code FROM dogs GROUP BY breed_code ORDER BY count(*) DESC LIMIT 1)
SELECT breed_name FROM breeds WHERE breed_code  =  (SELECT breed_code FROM dogs GROUP BY breed_code ORDER BY count(*) DESC LIMIT 1)
SELECT T1.owner_id ,  T1.last_name FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN treatments AS T3 ON T2.dog_id  =  T3.dog_id GROUP BY T1.owner_id ORDER BY sum(T3.cost_of_treatment) DESC LIMIT 1
SELECT T1.owner_id ,  T1.last_name FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN treatments AS T3 ON T2.dog_id  =  T3.dog_id GROUP BY T1.owner_id ORDER BY sum(T3.cost_of_treatment) DESC LIMIT 1
SELECT treatment_type_description FROM treatment_types WHERE treatment_type_code  =  (SELECT treatment_type_code FROM treatments GROUP BY treatment_type_code ORDER BY sum(cost_of_treatment) ASC LIMIT 1)
SELECT treatment_type_description FROM treatment_types WHERE treatment_type_code  =  (SELECT treatment_type_code FROM treatments GROUP BY treatment_type_code ORDER BY sum(cost_of_treatment) ASC LIMIT 1)
SELECT T1.owner_id ,  T1.zip_code FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN treatments AS T3 ON T2.dog_id  =  T3.dog_id GROUP BY T1.owner_id ORDER BY sum(T3.cost_of_treatment) DESC LIMIT 1
SELECT T1.owner_id ,  T1.zip_code FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN treatments AS T3 ON T2.dog_id  =  T3.dog_id GROUP BY T1.owner_id ORDER BY sum(T3.cost_of_treatment) DESC LIMIT 1
SELECT professional_id ,  cell_number FROM treatments AS T1 JOIN professionals AS T2 ON T1.professional_id  =  T2.professional_id GROUP BY T1.professional_id HAVING count(DISTINCT T1.treatment_type_code)  >  1
SELECT professional_id ,  cell_number FROM professionals WHERE professional_id IN (SELECT professional_id FROM treatments GROUP BY professional_id HAVING count(*)  >  1)
SELECT first_name ,  last_name FROM professionals WHERE professional_id IN (SELECT professional_id FROM treatments WHERE cost_of_treatment  <  (SELECT avg(cost_of_treatment) FROM treatments))
SELECT first_name ,  last_name FROM professionals WHERE professional_id IN (SELECT professional_id FROM treatments WHERE cost_of_treatment  <  (SELECT avg(cost_of_treatment) FROM treatments))
SELECT date_of_treatment ,  first_name FROM treatments AS T1 JOIN professionals AS T2 ON T1.professional_id  =  T2.professional_id
SELECT date_of_treatment ,  first_name FROM treatments AS T1 JOIN professionals AS T2 ON T1.professional_id  =  T2.professional_id
SELECT T1.cost_of_treatment ,  T2.treatment_type_description FROM treatments AS T1 JOIN treatment_types AS T2 ON T1.treatment_type_code  =  T2.treatment_type_code
SELECT T1.cost_of_treatment ,  T2.treatment_type_description FROM treatments AS T1 JOIN treatment_types AS T2 ON T1.treatment_type_code  =  T2.treatment_type_code
SELECT T1.first_name ,  T1.last_name ,  T2.size_description FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id
SELECT T1.first_name ,  T1.last_name ,  T2.size_description FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id
SELECT T1.first_name ,  T2.name FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id
SELECT T1.first_name ,  T2.name FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id
SELECT T1.name ,  T2.date_of_treatment FROM dogs AS T1 JOIN treatments AS T2 ON T1.dog_id  =  T2.dog_id WHERE T1.breed_code  =  (SELECT breed_code FROM dogs GROUP BY breed_code ORDER BY count(*) ASC LIMIT 1)
SELECT name ,  date_of_treatment FROM dogs AS T1 JOIN breeds AS T2 ON T1.breed_code  =  T2.breed_code WHERE T2.breed_code  =  (SELECT breed_code FROM breeds GROUP BY breed_code ORDER BY count(*) ASC LIMIT 1)
SELECT T2.first_name ,  T1.name FROM dogs AS T1 JOIN owners AS T2 ON T1.owner_id  =  T2.owner_id WHERE T2.state  =  'Virginia'
SELECT T1.first_name ,  T2.name FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id WHERE T1.state  =  'Virginia'
SELECT date_arrived ,  date_departed FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments)
SELECT date_arrived ,  date_departed FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments)
SELECT last_name FROM owners WHERE owner_id  =  (SELECT owner_id FROM dogs WHERE date_of_birth  =  (SELECT min(date_of_birth) FROM dogs))
SELECT last_name FROM owners WHERE owner_id  =  (SELECT owner_id FROM dogs ORDER BY age ASC LIMIT 1)
SELECT email_address FROM professionals WHERE state  =  'Hawaii' OR state  =  'Wisconsin'
SELECT email_address FROM professionals WHERE state  =  'Hawaii' OR state  =  'Wisconsin'
SELECT date_arrived ,  date_departed FROM dogs
SELECT date_arrived ,  date_departed FROM dogs
SELECT count(*) FROM treatments
SELECT count(*) FROM treatments
SELECT count(DISTINCT professional_id) FROM treatments
SELECT count(*) FROM professional WHERE professional_id IN (SELECT professional_id FROM treatments)
SELECT role_code ,  street ,  city ,  state FROM professionals WHERE city LIKE '%West%'
SELECT role_code ,  street ,  city ,  state FROM professionals WHERE city LIKE '%West%'
SELECT first_name ,  last_name ,  email_address FROM owners WHERE state LIKE '%North%'
SELECT first_name ,  last_name ,  email_address FROM owners WHERE state LIKE '%North%'
SELECT count(*) FROM dogs WHERE age  <  (SELECT avg(age) FROM dogs)
SELECT count(*) FROM dogs WHERE age  <  (SELECT avg(age) FROM dogs)
SELECT cost_of_treatment FROM treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT cost_of_treatment FROM treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT count(*) FROM dogs WHERE dog_id NOT IN (SELECT dog_id FROM treatments)
SELECT count(*) FROM dogs WHERE dog_id NOT IN (SELECT dog_id FROM treatments)
SELECT count(*) FROM owners WHERE owner_id NOT IN (SELECT owner_id FROM dogs)
SELECT count(*) FROM owners WHERE owner_id NOT IN (SELECT owner_id FROM dogs)
SELECT count(*) FROM professional WHERE professional_id NOT IN (SELECT professional_id FROM treatment)
SELECT count(*) FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT name ,  age ,  weight FROM dogs WHERE abandoned_yn  =  1
SELECT name ,  age ,  weight FROM dogs WHERE abandoned_yn  =  1
SELECT avg(age) FROM Dogs
SELECT avg(age) FROM Dogs
SELECT max(age) FROM dogs
SELECT max(age) FROM Dogs
SELECT charge_type ,  charge_amount FROM charges
SELECT charge_type ,  charge_amount FROM charges
SELECT charge_amount FROM charges WHERE charge_amount  =  (SELECT max(charge_amount) FROM charges)
SELECT charge_amount FROM charges WHERE charge_amount  =  (SELECT max(charge_amount) FROM charges)
SELECT email_address ,  cell_number ,  home_phone FROM professionals
SELECT email_address ,  cell_number ,  home_phone FROM professionals
SELECT T1.breed_name ,  T2.size_description FROM breeds AS T1 JOIN sizes AS T2 ON T1.size_code  =  T2.size_code
SELECT DISTINCT T1.breed_code ,  T2.size_code FROM breeds AS T1 JOIN dogs AS T2 ON T1.breed_code  =  T2.breed_code
SELECT T1.first_name ,  T3.treatment_type_description FROM professionals AS T1 JOIN treatments AS T2 ON T1.professional_id  =  T2.professional_id JOIN treatment_types AS T3 ON T2.treatment_type_code  =  T3.treatment_type_code
SELECT T1.first_name ,  T2.treatment_type_description FROM professionals AS T1 JOIN treatments AS T2 ON T1.professional_id  =  T2.professional_id
SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT name FROM singer ORDER BY net_worth_millions
SELECT Name FROM singer ORDER BY Net_Worth_Millions
SELECT Birth_Year ,  Citizenship FROM singer
SELECT Birth_Year ,  Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship  !=  'France'
SELECT Name FROM singer WHERE Citizenship  <>  'French'
SELECT Name FROM singer WHERE Birth_Year  =  1948 OR Birth_Year  =  1949
SELECT Name FROM singer WHERE Birth_Year  =  1948 OR Birth_Year  =  1949
SELECT name FROM singer WHERE net_worth_millions  =  (SELECT max(net_worth_millions) FROM singer)
SELECT name FROM singer ORDER BY net_worth_millions DESC LIMIT 1
SELECT citizenship ,  count(*) FROM singer GROUP BY citizenship
SELECT Citizenship ,  count(*) FROM singer GROUP BY Citizenship
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY count(*) DESC LIMIT 1
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY count(*) DESC LIMIT 1
SELECT Citizenship ,  max(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT max(Net_Worth_Millions) ,  Citizenship FROM singer GROUP BY Citizenship
SELECT T1.Title ,  T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID
SELECT T1.Title ,  T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID
SELECT DISTINCT T1.name FROM singer AS T1 JOIN song AS T2 ON T1.singer_id  =  T2.singer_id WHERE T2.sales  >  300000
SELECT DISTINCT Name FROM singer WHERE Singer_ID IN (SELECT Singer_ID FROM song WHERE Sales  >  300000)
SELECT name FROM singer WHERE singer_id IN (SELECT singer_id FROM song GROUP BY singer_id HAVING count(*)  >  1)
SELECT name FROM singer WHERE singer_id IN (SELECT singer_id FROM song GROUP BY singer_id HAVING count(*)  >  1)
SELECT T1.name ,  sum(T2.sales) FROM singer AS T1 JOIN song AS T2 ON T1.singer_id  =  T2.singer_id GROUP BY T1.singer_id
SELECT T1.name ,  sum(T2.sales) FROM singer AS T1 JOIN song AS T2 ON T1.singer_id  =  T2.singer_id GROUP BY T1.name
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT sname FROM singer WHERE singer_id NOT IN (SELECT singer_id FROM song)
SELECT DISTINCT citizenship FROM singer WHERE birth_year  <  1945 AND birth_year  >  1955
SELECT DISTINCT Citizenship FROM singer WHERE Birth_Year  <  1945 AND Birth_Year  >  1955
SELECT count(*) FROM Other_Available_Features
SELECT feature_type_name FROM ref_feature_types WHERE feature_type_code IN (SELECT feature_type_code FROM other_available_features WHERE feature_name  =  'AirCon')
SELECT property_type_description FROM Ref_Property_Types WHERE property_type_code  =  'APT'
SELECT property_name FROM properties WHERE property_type_code  =  'HSE' OR property_type_code  =  'APT' AND room_count  >  1