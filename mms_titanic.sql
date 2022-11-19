/*create schema results;
create schema inputs;
create schema sqlmms;*/
USE inputs;
/* Understanding the contents of the train table */
SELECT *
FROM inputs.train
LIMIT 100;

/* Applying some filters */

/* Only male passengers */
SELECT *
FROM inputs.train
WHERE Sex in ('male');


/* Counting how many people over 60 have survived */
SELECT
	COUNT(*)
FROM inputs.train
WHERE AGE >=60 AND SURVIVED = 1;

/* Let's see the list of females that have embarked on Q and S */
SELECT
	*
FROM inputs.train
WHERE Sex in ('female') AND
Embarked in ('Q', 'S');

/* Now we will see the males who are between 20 and 45 years old who only embarked in the port the Q */
SELECT 
	*
FROM inputs.train
WHERE Sex in ('male') AND
Age BETWEEN 20 AND 45 AND
Embarked in ('Q');

/* Some aggregations */

# Mean age of individuals who survived by class
SELECT
	Pclass,
    ROUND(AVG(AGE),0) AS Mean_Age,
    COUNT(*) AS Survivors
FROM
	inputs.train
WHERE Survived = 1
GROUP BY Pclass
ORDER BY Pclass;

# Calculating the volume (per port) and the survivor rate per port, considering only ports S, Q and C.
SELECT
	Embarked,
	ROUND(100*AVG(Survived),1) AS Survivor_rate,
    COUNT(*) AS Volume
FROM 
	inputs.train
WHERE
	Embarked in ('S', 'Q', 'C')
GROUP BY Embarked;

# Following with more stats...

#Rate Survivors by Class (PClass)
SELECT 
	Pclass,
	ROUND(100*AVG(Survived),1) AS rate_survivors
FROM 
	inputs.train
GROUP BY Pclass
ORDER BY Pclass;

#Rate Survivors by Gender
SELECT 
	Sex,
    COUNT(*) AS Survivors,
	ROUND(100*AVG(Survived),1) AS rate_survivors
FROM 
	inputs.train
GROUP BY Sex;

 # Rate of survivors under 10 years old
SELECT
	ROUND(100*AVG(Survived),1) AS SURVIVORS
FROM
	inputs.train
WHERE Age < 10;


# Média de sobreviventes por Quantidade de Parentes no Navio (SibSp + Parch)
----------


# Calculating a new variable that will represent the family size on the ship

CREATE TABLE results.abt_01
SELECT 
	*,
    SibSp + Parch AS Family_size
FROM
	inputs.train;
    
SELECT * FROM results.abt_01;
    




