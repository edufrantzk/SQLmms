#create schema house_prices;

USE house_price;

#Let's filter some columns
SELECT
	Id,
    LotArea,
	Neighborhood,
    HouseStyle,
    YearBuilt,
    Foundation,
    CentralAir,
    BedroomAbvGr,
    KitchenAbvGr,
    GarageType,
    GarageCars,
    MoSold,
    YrSold,
    SaleType,
    SalePrice
FROM house_prices.train_house;

#Some informations about the LotArea from all houses
SELECT 
    MAX(LotArea) AS Maior,
    MIN(LotArea) AS Menor,
    AVG(LotArea) AS Média
FROM house_prices.train_house;

#Average Year of Construction of the houses by Neighborhood
SELECT
	ROUND(AVG(YearBuilt),0),
    Neighborhood
FROM house_prices.train_house
GROUP BY Neighborhood
ORDER BY ROUND(AVG(YearBuilt),0) DESC;

#Most populars types of foundation
SELECT
	Foundation,
    COUNT(Foundation)
FROM house_prices.train_house
GROUP BY Foundation
ORDER BY COUNT(Foundation) DESC;


#Most of the houses with a PCONC foundation were built after 2004
SELECT YearBuilt,
	COUNT(YearBuilt),
	Foundation
FROM house_prices.train_house
WHERE Foundation in ('PConc')
GROUP BY YearBuilt
ORDER BY COUNT(YearBuilt) DESC;

#Neighborhood with the most expensive houses on average
SELECT
	ROUND(AVG(SalePrice),2),
    Neighborhood
FROM house_prices.train_house
GROUP BY Neighborhood
ORDER BY AVG(SalePrice) DESC;
#Noridge


#SUBQUERY
#Quantidade de casas com o valor acima da média por Ano de construção
SELECT 
	COUNT(*) AS Qtd_de_casas_com_valor_maior_Que_a_media,
	YearBuilt
FROM house_prices.train_house
WHERE SalePrice > 
(SELECT 
	ROUND(AVG(SalePrice),2)
FROM house_prices.train_house)
GROUP BY YearBuilt
ORDER BY COUNT(YearBuilt) DESC;


SELECT
	MAX(YearBuilt),
    MIN(YearBuilt)
FROM house_prices.train_house;


#Number of houses built before 1950 and what is the average value of these houses
SELECT 
	ROUND(AVG(saleprice),2),
	COUNT(*),
	YearBuilt
FROM house_prices.train_house
WHERE YearBuilt < 1950 
GROUP BY YearBuilt
ORDER BY ROUND(AVG(saleprice),2) DESC;

SELECT SalePrice,
	YearBuilt
FROM house_prices.train_house
WHERE Yearbuilt = 1892;

#Which month since 2005 we had the most sales
SELECT 
	COUNT(*),
    MoSold
FROM house_prices.train_house
WHERE YrSold >= 2005
GROUP BY MoSold
ORDER BY COUNT(*) DESC;

#Year with more sales and year with less sales
SELECT 
	COUNT(*),
    YrSold
FROM house_prices.train_house
GROUP BY YrSold
ORDER BY COUNT(*) DESC;

#Average sale value of houses with CentralAir and without CentralAir, does it affect the value?
SELECT
	ROUND(AVG(SalePrice),1),
    CentralAir
FROM house_prices.train_house
GROUP BY CentralAir;
#In Average the houses with Central Air are sale for 80k more

#Average of the sale value of the houses by the amount of BedroonAbvGr and garagecars, not counting the ones that don't have any rooms
SELECT
	ROUND(AVG(SalePrice),1),
    BedroomAbvGr,
    GarageCars
FROM house_prices.train_house
WHERE BedroomAbvGr BETWEEN 1 AND 10
GROUP BY BedroomAbvGr, GarageCars
ORDER BY ROUND(AVG(SalePrice),1) DESC;







