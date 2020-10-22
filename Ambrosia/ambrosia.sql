-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 05, 2020 at 08:53 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ambrosia`
--
CREATE DATABASE IF NOT EXISTS `ambrosia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `ambrosia`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `AdminID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Username`, `Password`) VALUES
(1, 'Admin', 'Admin'),
(3, 'Admin123', '123'),
(23, 'Admin4', '1');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `ArticleID` varchar(50) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Content` json NOT NULL,
  `Author` varchar(255) NOT NULL,
  `PublishDate` date NOT NULL,
  `Tags` varchar(11) NOT NULL,
  PRIMARY KEY (`ArticleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`ArticleID`, `Title`, `Description`, `Content`, `Author`, `PublishDate`, `Tags`) VALUES
('A001', 'Is healthier food more expensive than junk food?', 'People often associate healthy food to costly expenditures. Here are some tips to help you have a healthy diet and wallet!', '[[\"Tip #1 - Canned and Frozen Fruits and Veggies \", \"Many people think that canned and frozen fruit and veggies arenu0027t as healthy as fresh, but, this isnu0027t the case! Canned and frozen foods can be equally as nutritious and are packaged when they are just ripe, meaning they lock in all the nutrients. Frozen and canned foods are often cheaper compared to their fresh varieties. Plus, these foods will last for ages in your freezer or pantry, making them a great option for when youu0027re short on time or havenu0027t been shopping. \", \"Remember to keep an eye out for the salt content in the canned foods and the added sugar in frozen fruits and veggies. Choose frozen fruit without added sugar and canned fruit in water (rather than sweetened juice or syrup). Also make sure to choose canned vegetables without added salt. \"], [\"Tip #2 - Plan for meatless meals each week \", \"Meat and fish are among the most expensive items on a shopping list while plant protein often costs less. Pulses (beans, peas and lentils) are nutritious, very cheap and work well in place of meat.\"], [\"Tip #3 - Check the specials! \", \"An easy way to save money is by checking whatu0027s on special and where. Before you go shopping, hop online and compare prices between major supermarkets. Signing up to rewards programs is another easy way to earn discounts.\"], [\"Tip #4 - Shop seasonally \", \"Foods that are in season are almost always cheaper! Not only will shopping seasonally save money, it also means added variety to your diet. If you arenu0027t fussed on whatu0027s in season at a particular time, frozen fruit and veg is another great option! Another great idea for finding cheap produce is your local farmers market!\"], [\"Tip #5 - Love your legumes \", \"Adding legumes to your meals is a cheap and easy way to spread them out and make them last longer for less. A can of lentils or chickpeas costs less than $1, and can be added to pasta sauces, stir fries, curries and salads - plus, legumes are considered a vegetable and a protein alternative, making them a real superfood!\"], [\"Tip #6 - Plan ahead \", \"The best way to eat healthy on a budget, is by PLANNING! Work out your grocery budget, what meals and snacks you are having, what ingredients you need, and check online for prices and specials. Then, make a list and stick to it! Planning ahead makes sticking to a budget and a plan way easier!\"]]', 'University of Newcastle, Australia', '2020-08-01', 'T005'),
('A002', 'Eat Healthy Be Happy', 'Not feeling so great? Here are some mood-boosters that can help you brighten up your day!', '[[\"<br>\"], [\"\", \"Some foods are known to fight mood swings, energize your body and just make you feel good. Try incorporating these foods into your daily meals to feel your most energized and happiest self all day long!\"], [\"Breakfast\", \"During your morning meal, drink some orange juice or eat an actual orange. Either way, the Vitamin C will energize your body to get you ready to take on the day ahead. Aside from oranges, berries are great way to start your morning on a happy note. Full of antioxidants, vitamins, minerals and fiber, berries not only energize you but keep you full and satisfied for a long time.\"], [\"Lunch\", \"Go for greens! Spinach salad is a great way to get those great antioxidants and folic acid to fight depression. Also, eating foods that are natural and unprocessed will prevent mood swings and actually energize your body. Resist those all-too-tempting french fries!\"], [\"Dinner\", \"Maintain that upbeat mood and high energy level with fish! If prepared properly, it can be absolutely delicious and contains omega-3 fatty acids, which increase your mood and overall brain function. Enjoy with some veggies and youu0027ll be grinning from ear to ear in no time but donu0027t forget desert!\"], [\"Dessert\", \"Go for the chocolate youu0027ve been craving. Cocoa contains phenylethylamine, which is responsible for the production of endorphins, which instantly boost your mood. Now that youu0027re on that chocolate high, wash it all down with some tasty milk. The Vitamin D in it stimulates serotonin production, another one of those chemicals in your body that makes you happy!\"]]', 'Jacqueline Girschick', '2020-08-05', 'T005'),
('A003', 'Should you go Vegan?', 'Reasons for a vegan diet', '[[\"For your Health<br>\", \"Well-planned vegan diets follow healthy eating guidelines, and contain all the nutrients that our bodies need. Both the British Dietetic Association and the American Academy of Nutrition and Dietetics recognize that they are suitable for every age and stage of life.&nbsp;\", \"Some research has linked vegan diets with lower blood pressure and cholesterol, and lower rates of heart disease, type 2 diabetes and some types of cancer.\"], [\"For the Animals\", \"Preventing the exploitation of animals is not the only reason for becoming vegan, but for many it remains the key factor in their decision to go vegan and stay vegan. Avoiding animal products is one of the most obvious ways you can take a stand against animal cruelty and animal exploitation everywhere.&nbsp;\"]]', 'The Vegan Society', '2020-08-11', 'T005'),
('A004', '2020 Food Trends', 'Here are some food trends that were predicted for 2020', '[[\"Low Sugar Chocolate<br>\", \"Dark chocolate is becoming more popular as people see it as a healthier choice over regular chocolate due to its higher cocoa, lower sugar content.\"], [\"Whey to Go\", \"Food producers are making the most of whey - a waste product of cheese-making. Raw milk whey can be used to make ricotta or reduced and caramelized to make Scandinavian-style brown cheese which is described as a salty, savory version of Caramac.\"], [\"Taste not Waste\", \"In modern kitchens and the food industry at large, there is a growing awareness of the need for sustainable, no-waste ingredients. Snacks, drinks and sauces have started using surplus foods such as surplus food cordial or crispy fish skin snacks.\"], [\"Heirloom and Ancient Flours\", \"More home bakers are expected to be experimenting with heirloom varieties, like rye and barley and ancient grains, such as teff, durum and spelt. These supposedly produce a different gluten quality that makes them easier to digest than modern wheats.&nbsp;\"], [\"Low-Alcoholic Drinks\", \"Low-alcoholic drinks are on the rise as more and more people want to sample the unique flavours offered by alcoholic mixes without the boozy hit normally associated with drinking. It is also a trend being driven by the rise of health-conscious customers who want all the fun at the bar with less calorific hits\"]]', 'Fine Dining Lovers', '2020-08-13', 'T006'),
('A005', 'Beat the Heat!', 'Hot weather can be incredibly tiring and draining. Learn what kind of food can help you stay cool and hydrated.', '[[\"Watermelons\", \"Watermelons are cooling food with high water content. Perfect for keeping yourself cool and hydrated in hot weather.\"], [\"Cucumbers\", \"Cucumbers are incredibly hydrating, and staying adequately hydrated during the hotter months is crucial. Snack on cucumber slices and hummus, or make yourself a juice out of cucumbers and lemon to stay hydrated and cool.\"], [\"Lemon\", \"Citrus has a cooling effect on the body and promotes detoxification. Adding lemon to your water not only has skin and immune-boosting benefits, but also encourages you to drink more water overall.\"]]', 'Tiffany Gagnon', '2020-08-14', 'T006'),
('A006', 'An Apple A Day Keeps the Doctor Away', 'Everyone knows an apple a day keeps the doctor away. But is this really the case?', '[[\"<br>\", \"While eating apples may not actually ward off doctors, adding them to your diet can help improve several aspects of your health.\"], [\"Highly Nutritious\", \"Apples are loaded with important nutrients, including fiber, vitamins, minerals and antioxidants. One medium apple can provide up to 9% of the daily recommended intake for Vitamin C.\", \"Vitamin C acts as an antioxidant to neutralize harmful compounds known as free radicals and protects against disease.\", \"Apples are also a great source of antioxidants like quercetin, caffeic acid and epicatechin.\"], [\"Supports Heart Health\", \"A study involving over 20000 adults found that consuming higher amounts of white-fleshed fruits and vegetables, including apples, was linked to a lower risk of stroke.\", \"This may be due to the presence of flavonoids found in apples, which are compounds that have been shown to reduce inflammation and protect heart health.&nbsp;\", \"Apples are also loaded with soluble fiber, which may help reduce blood pressure and cholesterol levels, both of which are risk factors for heart disease.&nbsp;\"], [\"Contains cancer-fighting compounds\", \"According to one review of 41 studies, consuming a higher amount of apples was associated with a decreased risk of developing lung cancer.&nbsp;\", \"Another study observed similar findings, reporting that eating more apples was tied to a lower risk of colorectal cancer.\"], [\"Bad Apples\", \"Eating an apple every day is unlikely to harm your health. However, it is possible to have too much of a good thing, and eating multiple apples each day may cause several adverse side effects.\", \"In particular, rapidly increase your intake of fiber over a short period of time can cause symptoms like gas, bloating and stomach pain.\"]]', 'Rachael Link', '2020-08-17', 'T005');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
CREATE TABLE IF NOT EXISTS `bookmarks` (
  `Number` int(50) NOT NULL AUTO_INCREMENT,
  `RecipeID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ArticleID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `UserID` varchar(50) NOT NULL,
  PRIMARY KEY (`Number`),
  KEY `ArticleID` (`ArticleID`),
  KEY `RecipeID` (`RecipeID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`Number`, `RecipeID`, `ArticleID`, `UserID`) VALUES
(47, 'R002', NULL, 'U002'),
(48, 'R003', NULL, 'U002'),
(49, 'R004', NULL, 'U002'),
(50, 'R005', NULL, 'U002'),
(51, 'R006', NULL, 'U002'),
(67, 'R001', NULL, 'U002'),
(75, NULL, 'A001', 'U002'),
(76, NULL, 'A002', 'U002'),
(77, NULL, 'A004', 'U002'),
(80, NULL, 'A003', 'U002'),
(89, 'R008', NULL, 'U002'),
(92, 'R011', NULL, 'U002'),
(93, NULL, 'A005', 'U002'),
(103, 'R009', NULL, 'U002');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `ClassID` varchar(50) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Ingredients` json NOT NULL,
  `VideoLink` text NOT NULL,
  `Author` varchar(255) NOT NULL,
  `PublishDate` date NOT NULL,
  `Type` varchar(10) NOT NULL,
  `Tags` varchar(255) NOT NULL,
  PRIMARY KEY (`ClassID`),
  KEY `Tags` (`Tags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassID`, `Title`, `Description`, `Ingredients`, `VideoLink`, `Author`, `PublishDate`, `Type`, `Tags`) VALUES
('C001', 'Chocolate Banana Cake', 'This chocolate banana cake combines tender chocolate cream with fresh bananas to create an exquisitely smooth taste in every bite', '[[\"Cake\", \"Eggs - 2    \", \"Flour - 65g     \", \"White sugar - 50g     \", \"Cocoa powder - 17g     \", \"Water - 60ml     \", \"Vegetable oil - 30ml     \", \"Baking powder - 0.5tsp     \", \"Baking soda - 0.5tsp     \", \"Pinch of salt     \"], [\"Cream\", \"Dark Chocolate (50%-60%) - 80g     \", \"Vanilla extract - 1 tsp     \", \"Powdered sugar - 1 tbsp     \"], [\"Ganache\", \"Heavy cream (35%) - 50ml     \", \"Butter - 14g     \", \"Condensed milk - 1 tbsp (Optional)     \"]]', 'https://www.youtube-nocookie.com/embed/zSjQrq15EK8', 'ATB Sweets', '2020-08-08', 'Paid', 'T001'),
('C002', 'Classic Pan-Seared Ribeye Steak', 'This classic pan-seared ribeye steak recipe results in a juicy, tender steak with a super flavorful crust. Grab your cast iron skillet and create a mouthwatering steak that will have your taste buds tingling. Here\'s how!', '[[\"Steak\", \"Angus Beef ribeye steak (16-ounce) - 1  \", \"Peanut/Canola oil - 1 tsp  \", \"Coarse kosher salt - 0.5tsp  \", \"Freshly cracked black pepper - 0.25tsp  \", \"Thyme springs -4  \", \"Garlic cloves, partially crushed - 2  \", \"Butter - 2tbsp  \"], [\"Equipment\", \"Cast iron skillet  \"]]', 'https://www.youtube-nocookie.com/embed/n1HVWjIBBnw', 'Certified Angus Beef brand Kitchen', '2020-08-10', 'Paid', 'T002'),
('C003', 'Japanese Souffle Cheesecake', 'Super fluffy and jiggly Japanese Souffle Cheesecake!', '[[\" \", \"Creamcheese - 160g \", \"Unsalted butter - 20g \", \"Hot water \", \"Milk - 50ml \", \"Cake flour - 40g \", \"Eggs - 4 (Separate the whites and the yolks) \", \"Lemon juice - 0.25tsp \", \"Sugar - 80g \"]]', 'https://www.youtube-nocookie.com/embed/0qq2MACXNWk', 'Nino\'s Home', '2020-08-12', 'Paid', 'T001'),
('C004', 'Korean Potato Cheese Pancake', 'A delectable savory treat', '[[\" \", \"Potatoes - 300g \", \"Sugar - 2 tbsp \", \"Rice flour - 3 tbsp \", \"Mozzarella Cheese \", \"Cooking oil \"]]', 'https://www.youtube-nocookie.com/embed/10MDo9o_wrY', 'Nino\'s Home', '2020-08-13', 'Paid', 'T003'),
('C005', 'Choux Au Craquelin (Cream Puffs)', 'Cream puffs with a delightfully crunchy exterior', '[[\"Craquelin\", \"Unsalted butter - 60g    \", \"Sugar - 50g    \", \"All purpose flour - 60g    \"], [\"Choux Pastry\", \"Water - 130ml    \", \"Unsalted butter - 50g    \", \"Salt - 0.25tsp    \", \"All purpose flour - 70g    \", \"Eggs - 2    \"], [\"Vanilla Cream\", \"Egg yolks - 2    \", \"Sugar - 60g    \", \"Corn starch - 25g    \", \"Milk - 240ml    \", \"Whipping cream - 180g    \", \"Vanilla extract - 1 tsp    \"]]', 'https://www.youtube.com/embed/Bqvnf787PJA', 'Nino\'s Home', '2020-08-11', 'Paid', 'T001'),
('C006', 'Caramel Custard Pudding', 'The best recipe for caramel custard pudding. Guaranteed to delight your tastebuds!', '[[\"Caramel\", \"Sugar - 80g  \", \"Water - 15ml  \"], [\"Pudding\", \"Egg yolks - 3  \", \"Eggs - 3  \", \"Milk - 500ml  \", \"Sugar - 90g  \", \"Heavy cream - 200g  \", \"Vanilla extract - 1tsp  \", \"Hot water  \"]]', 'https://www.youtube.com/embed/1_q8txKyg4E', 'Nino\'s Home', '2020-08-12', 'Paid', 'T001'),
('C007', 'Shepherd\'s Pie', 'Shepherd\'s pie - the perfect comfort food for cold winter days.', '[[\"Puree\", \"Potatoes - 1500g        \", \"Butter - 1tbsp        \", \"Milk - 120ml        \", \"Cheddar Cheese - 25g        \", \"Salt - 0.5tsp        \", \"Black pepper - 0.5tsp        \", \"Egg yolk - 1        \"], [\"Filling\", \"Ground lamb - 1kg        \", \"Onion - 1        \", \"Garlic Cloves - 3        \", \"Olive oil - 3tbsp        \", \"Flour - 4tbsp        \", \"Salt - 0.5tsp        \", \"Black pepper - 0.5tsp        \", \"Rosemary - 1tsp        \", \"Tomato paste - 1tbsp        \", \"Beef broth - 2 cups        \", \"Carrots - 200g        \", \"Peas - 200g        \"]]', 'https://www.youtube-nocookie.com/embed/a3EYQARJkLk', 'The Cooking Foodie', '2020-08-14', 'Paid', 'T002'),
('C008', 'Tteokbokki & Rice Cake', 'Craving tteokbokki and rice cakes? Here\'s how you can make them at home!', '[[\" \", \"Rice flour - 110g  \", \"Hot water - 85ml  \", \"Onion - 50g  \", \"Grilled chopped fish - 40g  \", \"Green onion - 1  \", \"Water - 200ml  \", \"Brown sugar - 15g  \", \"Gochujang chili paste - 40g  \", \"Soy sauce - 5ml  \", \"Egg - 1  \", \"Sesame seeds  \"]]', 'https://www.youtube-nocookie.com/embed/UxpWM7ISoUM', 'Nino\'s Home', '2020-08-15', 'Free', 'T003'),
('C009', 'Bubble Milk Tea Lava Cake', 'What\'s better than milk tea and lava cake? Milk Tea Lava Cake! Bringing you the best of both world\'s with this simple recipe', '[[\"Milk Tea\", \"Black tea  - 20g\", \"Milk - 250ml\"], [\"Black Tea Sponge Cake\", \"Eggs - 3pieces\", \"Milk Tea - 50ml\", \"Vegetable oil - 20g\", \"Cake flour - 70g\", \"Black Tea - 0.5tsp\", \"Lemon juice - 0.25tsp\", \"Sugar - 65g\"], [\"Milk Tea Cream\", \"Egg yolk - 1pieces\", \"Brown Sugar - 40g\", \"Milk tea - 120ml\", \"Corn Starch - 5g\", \"Whipping cream - 200g\"], [\"Tapioca pearls\", \"Tapioca pearls - 50g\", \"Brown Sugar - 20g\"]]', 'https://www.youtube-nocookie.com/embed/W0ivPXU89S4', 'Nino\'s Home', '2020-09-01', 'Upcoming', 'T001'),
('C010', 'Easy Family Lasagne', 'Simple and easy lasagne for the whole family to enjoy! ', '[[\"\", \"Rosemary - 2pieces\", \"Smoked streaky bacon - 100g\", \"Olive oil - 250ml\", \"Minced beef - 1000g\", \"Minced pork - 1000g\", \"Carrots - 4pieces\", \"Onions - 2pieces\", \"Celery - 4pieces\", \"Tomato puree - 2tbsp\", \"Plum tomatoes - 1600g\", \"Lasagne sheets - 350g\"], [\"White Sauce\", \"Mature Cheddar cheese - 150g\", \"Leeks (medium-sized) - 2pieces\", \"Bay leaves - 2pieces\", \"Plain flour  - 4tbsp\", \"Semi-skimmed milk - 1000ml\", \"Nutmeg - 1pieces\"]]', 'https://www.youtube-nocookie.com/embed/SalyS66njMY', 'Jamie Oliver', '2020-09-02', 'Upcoming', 'T002'),
('C011', 'Ultimate Crispy Fish & Chips', 'A foolproof guide to the perfect crispy battered fish and oven-baked chips', '[[\"\", \"Plain flour - 400g\", \"Baking powder - 3tsp\", \"Tumeric - 0.5tsp\", \"Cornflour - 1cups\", \"Cold beer - 320ml\", \"Cold soda water - 280ml\", \"Firm white fish (snapper/barramundi/cod) - 4pieces\", \"Sea salt - 20g\", \"Pepper - 20g\", \"Vegetable oil - 500ml\", \"Lime wedges - 4pieces\"], [\"Oven-Baked Chips\", \"Potaotes - 6pieces\", \"Vegetable oil - 3tbsp\", \"Garlic powder - 2tsp\", \"Sweet paprika - 0.5tsp\", \"Sea salt - 1tsp\"], [\"Spicy Coconut Siracha Mayo\", \"Mayonnaise - 0.5cups\", \"Coconut Sriracha - 0.25cups\"]]', 'https://www.youtube-nocookie.com/embed/DJlRRLHPfr8', 'Marion\'s Kitchen', '2020-09-04', 'Upcoming', 'T002');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE IF NOT EXISTS `recipes` (
  `RecipeID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Ingredients` json NOT NULL,
  `Steps` json NOT NULL,
  `PublishDate` date NOT NULL,
  `Author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tags` varchar(5) NOT NULL,
  PRIMARY KEY (`RecipeID`),
  KEY `Tags` (`Tags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`RecipeID`, `Title`, `Description`, `Ingredients`, `Steps`, `PublishDate`, `Author`, `Tags`) VALUES
('R001', 'Chocolate Banana Cake', 'A chocolate cake that is deliciously low in fat – It is moist enough to eat without the icing if you want to cut down on calories', '[[\"\", \"Self-raising flour - 225g\", \"Cocoa powder - 45ml\", \"Muscovado sugar - 115g\", \"Malt extract - 20ml\", \"Golden syrup - 30ml\", \"Eggs - 2pieces\", \"Skimmed milk - 60ml\", \"Sunflower oil - 60ml\", \"Ripe bananas - 2pieces\"], [\"Icing\", \"Icing sugar - 225g\", \"Cocoa powder - 35ml\", \"Warm water - 30ml\"]]', '[[\"\", \"Preheat the oven to 160u00b0C. Grease and line a deep round 8\\\"/20cm cake tin.\", \"Sift the flour into a mixing bowl with the cocoa. Stir in the sugar.\", \"Make a well in the centre and add the malt extract, golden syrup, eggs, milk and oil. Mash the bananas thoroughly and stir them into the mixture until well combined..\", \"Pour the cake mixture into the prepared tin and bake for 1 to 1 hour 15 minutes, or until the centre of the cake springs back when lightly pressed.\", \"Remove the cake form the tin and leave on a wire rack to cool.\", \"Reserve 50g of icing sugar and 5ml of cocoa powder. Make a dark icing beating the remaining sugar and cocoa powder with enough of the warm water to make a thick icing. Pour it over the cake and spread evenly.&nbsp;\", \"Make a light icing by mixing the remaining icing sugar and cocoa powder with a few drops of water. Drizzle this icing across the top of the cake.\"]]', '2020-07-31', 'Martha Day', 'T001'),
('R002', 'Mac N Cheese', 'A very quick and easy recipe for making delicious Mac N Cheese.', '[[\"\", \"Elbow macaroni - 220g\", \"Butter  - 0.25cups\", \"All-purpose flour - 0.25cups\", \"Salt - 0.5tsp\", \"Ground black pepper - 5g\", \"Milk - 2cups\", \"Shredded Cheddar cheese - 2cups\"]]', '[[\"\", \"Bring a large pot of lightly salted water to a boil. Cook elbow macaroni in the boiling water, stirring occasionally until cooked through but firm to the bit, 8 minutes. Drain.\", \"Melt butter in a saucepan over medium heat; stir in flour, salt, and pepper until smooth, about 5 minutes. Slowly pour milk into the butter-flour mixture while continuously stirring until the mixture is smooth and bubbling, about 5 minutes. Add Cheddar cheese to the milk mixture and stir for about 2-4 minutes until the cheese is melted.\", \"Fold macaroni into cheese sauce until coated\"]]', '2020-08-19', 'g0dluvsugly', 'T002'),
('R003', 'Roast Chicken', 'Simple and easy roast chicken. An easy-peasy, foolproof method to get crispy, restaurant grade roast chicken.', '[[\"\", \"Whole Chicken - 1pieces\", \"Potato - 500g\", \"Salt - 0.5tsp\", \"Pepper - 0.5tsp\", \"Onion powder - 1tsp\", \"Garlic powder - 1tsp\", \"Fresh parsley - chopped - 1tbsp\"]]', '[[\"\", \"Preheat the oven to 175u00b0C. Mix all the spices, salt and pepper in a small bowl.&nbsp;\", \"Season the chicken: Use your hands to coat the chicken in the spice mixture. Make sure to get the seasoning inside the chicken as well!\", \"Roast and serve: Add the potato wedges to the roasting pan to roast along with the chicken. Bake in a roasting pan and on a roasting rack for 40 minutes, Increase the heat to 230u00b0C for the last 20 minutes to crisp the skin.&nbsp;\", \"Let it rest for 10 - 15 minutes, carve and serve.\"]]', '2020-08-05', 'Jo Cooks', 'T002'),
('R004', 'Chocolate Chip Cookies', 'Everything a cookie connoisseur could possibly ask for. With a texture that is slightly crispy on the outside and chewy on the inside, this chocolate chip cookie recipe is guaranteed to satisfy.', '[[\"\", \"All-purpose flour - 2.25cups\", \"Baking soda - 1tsp\", \"Salt - 0.5tsp\", \"Butter - 1cups\", \"Granulated sugar - 0.75cups\", \"Brown sugar - 0.75cups\", \"Egg - 1pieces\", \"Vanilla - 1tsp\", \"Semisweet chocolate chips - 2cups\", \"Coarsely chopped nuts (if desired) - 1cups\"]]', '[[\"\", \"Heat oven to 190u00b0C. In a small bowl, mix flour, baking soda and salt; set aside.\", \"In large bowl, beat softened butter and sugars with electric mixer on medium speed, or mix with a spoon for about 1 minute or until fluffy, scraping the side of the bowl occasionally.&nbsp;\", \"Beat in egg and vanilla until smooth. Stir in flour mixture just until blended (dough will be stiff). Stir in chocolate chips and nuts.\", \"Onto ungreased cookie sheets, drop dough by rounded tablespoonfuls, 2 inches apart, or use an ice-cream scoop.\", \"Bake for 8 - 10 minutes, or until light brown (centers will be soft). Cool for 2 minutes; remove from cookie sheet to cooling rack. Cool completely (about 30 minutes). Store the cookies in an airtight container.\"]]', '2020-08-06', 'Betty Crocker', 'T001'),
('R005', 'Tofu Gimbap', 'Simple and easy to make at home. This tofu gimbap recipe is guaranteed to satisfy your taste buds ', '[[\"Ingredients\", \"Gim/Seaweed sheets - 5pieces\"], [\"Rice\", \"Short grain rice - 2cups\", \"Sesame oil - 1tbsp\", \"Salt - 0.5tsp\"], [\"Fillings\", \"Firm tofu - 280g\", \"Spinach - 230g\", \"Sesame oil - 1tsp\", \"Kirby cucumbers - 3pieces\", \"Carrots - 2pieces\", \"Burdock root  - 1pieces\", \"Sesame oil - 5ml\", \"Salt - 5g\", \"Cooking oil - 5ml\", \"Soy sauce - 1tbsp\", \"Rice syrup - 2tbsp\"]]', '[[\"\", \"Cook the rice using a little less water than usual.\", \"Cut the tofu into about 3/4-inch thick sticks. Pat dry with a paper towel, and lightly sprinkle with salt. Heat a small pan with enough oil to cover the pan. Add the tofu pieces and fry until all sides are golden brown.\", \"Bring a large pot of water to a boil over high heat, and prepare an ice bath. Blanch the spinach, place immediately in the ice bath, then squeeze out the water. Cut into short lengths by running a knife through a few of times. Season with the sesame oil (about 1/2 teaspoon) and salt.\", \"Cut the cucumber into 1/2-inch thick sticks. Do not use the seedy part. Heat the pan with a little bit of oil over medium high heat. Stir fry the cucumber until softened. Lightly season with salt.\", \"Julienne the carrots. Heat the pan with a little bit of oil over medium high heat. Stir fry the carrots until softened. Lightly season with salt.\", \"Julienne the burdock roots. Heat the pan with a little beat of sesame oil, and stir fry the burdock roots until translucent. Add 4 tablespoons water, the soy sauce, and rice syrup. Simmer over medium low heat until most of the liquid has evaporated, about 7 to 8 minutes. Sprinkle with the sesame seeds.\", \"When all the other ingredients are ready, remove the rice from the rice cooker. While the rice is still hot, add the sesame oil and salt. Mix well by gently folding with a rice paddle or large spoon until evenly seasoned. Add more salt to taste. The rice will cool down during this process and be ready to be used.\", \"Put&nbsp;a sheet of gim (seaweed sheet), shiny side down and longer side toward you, on a cutting board or a bamboo mat if available. Spread about 3/4 cup to 1 cup of rice evenly over the gim, using a rice paddle or your fingers preferably. Lay the prepared ingredients on top of the rice close to the side toward you.\", \"Lift the entire bottom edge with both hands and roll over the filling away from you, tucking in the filling with your fingers. Put firm pressure over the roll with the help of the bamboo mat, if using, to close everything in tightly. Then, continue to roll again, putting pressure evenly over the roll using both hands.\", \"Brush the roll with a little bit of sesame oil for extra flavor and shiny look. Apply a little bit of sesame oil to a sharp knife. This will keep rice from sticking to the knife. Repeat as necessary after each cut. Wipe the knife with a damp towel if the rice still sticks. Cut the roll into 1/2-inch thick bite sizes.\"]]', '2020-08-07', 'Korean Bapsang', 'T003'),
('R006', 'Shrimp Alfredo', 'Shrimp Alfredo made easy. Homemade Alfredo sauce, fettuccine and juicy Parmesan Coated Shrimp comes together in 30 minutes for a comforting family dinner.', '[[\"Ingredients\", \"Fettuccine pasta - 453g\", \"Butter - 2tbsp\", \"Shrimp - 900g\", \"Salt - 25g\", \"Black pepper - 25g\", \"Dry Parmesan cheese - 0.5cups\"], [\"Alfredo Sauce\", \"Butter - 2tbsp\", \"Garlic cloves - 2pieces\", \"All-purpose flour - 1tbsp\", \"Heavy whipping cream - 2cups\", \"Sour cream - 0.25cups\", \"Freshly grated Parmesan cheese - 0.5cups\", \"Dry Parmesan cheese - 0.5cups\", \"Salt - 10g\", \"Black pepper - 10g\"]]', '[[\"Fettuccine\", \"Start cooking the pasta at the same time as starting the sauce.\", \"Bring a pot of water to boil and add the salt to the water to season the pasta as it cooks.&nbsp;\", \"Add pasta and cook until al dante.\", \"Once pasta is done, strain it and add it back to the pot.\"], [\"Alfredo Sauce\"], [\"\", \"Measure your ingredients ahead of time because cooking the sauce goes fast.\", \"In a medium, heavy bottom sauce pot, melt butter over medium heat. Once it\'s melted, add pressed garlic. Cook the garlic until it\'s fragrant and sprinkle flour over it. Stir until flour is all mixed with butter and slowly pour in heavy whipping cream while constantly stirring.\", \"Gently stir the mixture together and let it heat through. (Don\'t let it boil!) Once the heavy cream is hot, whisk in sour cream, Parmesan cheese, salt and pepper. Lower heat to medium-low and gently stir until grated cheese melts and incorporates.\", \"Keep cooking over medium-low heat for about 5 minutes, stirring often\", \"Once sauce is ready mix it with cooked pasta. (Reserve a little bit of sauce to drizzle over shrimp.)\"], [\"Shrimp\", \"Clean, de-vein, and take all the shells off shrimp if needed.\", \"Use a mixing bowl to season shrimp with salt and pepper. Add dry Parmesan cheese and toss until itu2019s evenly spread out.\", \"Preheat a large cooking pan over medium-high heat and add butter. Melt butter and add shrimp. Cook shrimp until pink and opaque on one side and flip them all over. Cook on the other side until just turns pink and opaque. Take shrimp out of the pan right away so it doesnu2019t keep cooking.\", \"Portion sauce coated pasta into large bowls and top it off with sautu00e9ed shrimp. Drizzle a little sauce over shrimp\"]]', '2020-08-17', 'Lyuba', 'T002'),
('R007', 'Honey Garlic Salmon', 'The honey and garlic sauce makes the perfect complement to the salmon for an extremely juicy, mouthwatering meal.', '[[\"Salmon\", \"4 Salmon fillets - 170g\", \"Kosher salt - 0.5tsp\", \"Black pepper - 0.5tsp\", \"Smoked paprika - 0.5tsp\"], [\"Sauce\", \"Butter - 3tbsp\", \"Olive oil - 2tsp\", \"Garlic cloves - 6pieces\", \"Honey - 0.5cups\", \"Water - 3tbsp\", \"Soy sauce - 3tbsp\", \"Sriracha sauce - 1tbsp\", \"Lemon juice - 2tbsp\"]]', '[[\"\", \"Pat salmon fillets dry and season with salt, pepper and paprika on all sides. Adjust oven rack to middle position, then preheat broiler.\", \"Heat butter and oil in a large, oven-sage skillet over medium-high heat. Once the butter is melted, add garlic, water, soy sauce, sriracha, honey and lemon juice and cook for 30 seconds until the sauce is heated through.\", \"Add salmon, skin side down and cook for 3 minutes. While the salmon cooks, baste frequently with sauce from the pan by spooning it over the top of the salmon.\", \"Broil for 5 - 6 minutes, basting with sauce once during the broil, until salmon is caramelized and cooked to desired doneness.\", \"Garnish with minced parsley if desired.\"]]', '2020-08-18', 'The Chunky Chef', 'T002'),
('R008', 'Cheesy Scones', 'Savory, buttery scones. Goes perfectly with a cup of tea.', '[[\"\", \"Thyme, rosemary, basil mix - 1tbsp\", \"Egg - 1pieces\", \"Milk - 120ml\", \"Grated cheese (Cheddar, Mozzarella, Parmesan) - 100g\", \"Butter - 90g\", \"Flour - 180g\", \"Salt - 0.75tsp\", \"Baking powder - 1tbsp\", \"Corn starch - 20g\"]]', '[[\"\", \"Preheat the oven to 200u00b0C.\", \"Cut the butter in to small cubes, and keep refrigerated.\", \"Into a big bowl mix the dry ingredients, flour, dried herbs, salt and baking powder.\", \"Add the cold butter to the dry ingredients mix, and then with a fork or a pastry cutter, incorporate the butter into the mix, don\'t use your hand, so the butter won\'t melt.\", \"Add to the dry mix, the egg, grated cheese and fold lightly.\", \"Transfer the dough to a floured surface, and gently press it to form a big circle with 1 inch thick.\", \"Cut the dough into wedges or into small circles.\", \"Brush the scones with milk, then transfer them to a baking tray covered with parchment paper.\", \"Put the tray in the oven and bake the scones for 10 - 13 minutes or until they are lightly golden brown.\"]]', '2020-08-19', 'Farida', 'T002'),
('R009', 'Egg Fried Rice', 'A few simple tricks and easily available ingredients are all you need to make restaurant style egg fried at home!', '[[\"\", \"Oil (of choice) - 3tbsp\", \"Ginger - 1tsp\", \"Garlic - 0.5tsp\", \"Celery - 0.25cups\", \"Green beans - 0.5cups\", \"Spring onions - 0.25cups\", \"Carrots - 0.5cups\", \"Mushrooms - 1cups\", \"White rice  - 2.5cups\", \"Dark soy sauce - 1tbsp\", \"Rice vinegar - 2tsp\", \"Sesame oil - 1tsp\", \"White pepper powder - 0.5tsp\", \"Salt - 0.25tsp\", \"Eggs - 2pieces\"]]', '[[\"\", \"Heat a tablespoon of oil in a wok. Whisk the eggs and add them to the wok. Let the egg fry in the oil for 10 seconds and then scramble it, making sure not to brown it. Remove it from the wok.\", \"In the same wok, heat the remaining oil and add ginger, garlic, celery and the white part of spring onions. Stir fry the aromatics for a minute or two on high heat. Add beans, carrots and mushrooms and stir fry for another two minute, all the time making sure that its on high heat so that the veggies remain crunchy.\", \"Add cooked rice, soy sauce, rice vinegar, sesame oil, white pepper powder, salt. Stir fry again to make sure everything is mixed well. Don\'t worry if the rice sticks a little to the bottom. Just scrape it off - those crunchy buts are delicious!\", \"Add the scrambled eggs and green part of spring onions. Mix again and turn off the heat.&nbsp;\"]]', '2020-08-16', 'Richa', 'T004'),
('R010', 'Pumpkin Pie', 'An easy recipe for Homemade Pumpkin Pie. This pumpkin pie recipe is perfect for the holidays!', '[[\"\", \"Pie crust - 1pieces\", \"Light brown sugar - 1cups\", \"All-purpose flour - 1tbsp\", \"Salt - 0.5tsp\", \"Ground cinnamon - 1tsp\", \"Ground ginger - 1tsp\", \"Ground nutmeg - 0.5tsp\", \"Ground cloves - 0.125tsp\", \"Eggs - 3pieces\", \"Pumpkin puree - 443ml\", \"Evaporated milk - 1.25cups\"]]', '[[\"Pie Crust\", \"Preheat oven to 205u00b0C.\", \"Prepare the pie crust by rolling the dough out to 12 inches in diameter. Next, carefully transfer the dough to a 9-inch pie plate (make sure it\'s at least 1 and 1/2 inches deep). Gently fit it into the pie plate, trim any excess dough and flute the edges. Line the pie dough with parchment paper or foil, making sure to cover the bottom and fit it snuggly in the corners and up the sides.\", \"Bake the pie crust at 205u00b0C for 12 - 15 minutes. Remove from the oven and remove the parchment paper (or foil) and pie weights. Return the pie crust to the oven and bake for an additional 5 minutes. Remove from the oven and set aside to cool.\"], [\"Filling\", \"In a large mixing bowl, whisk together the brown sugar, flour, salt, cinnamon, ginger, nutmeg, and cloves until well combined. In a separate mixing bowl, whisk together the eggs, pumpkin puree and evaporated milk until well combined. Pour the wet ingredients into the dry ingredients and mix together until fully combined.\"], [\"Pumpkin pie\", \"Pour the pumpkin pie filling into the partially baked pie crust. Return to the oven and bake at 400u00b0F for 45-50 minutes, or until the center is almost set (it should be a little wobbly). Remove from the oven and transfer to a wire rack for 2-3 hours to cool completely. Cover tightly and refrigerate for several hours or overnight.\"]]', '2020-08-17', 'Anon', 'T001'),
('R011', 'Chicken Katsudon', 'The Katsudon is perfectly balanced between sweet and salty, filled with delightful textures, thanks to the crunchy fried chicken and fat grains of rice swimming in a creamy sea of egg.', '[[\"\", \"2 Chicken breast  - 150g\", \"Yellow onion (sliced) - 70g\", \"Eggs - 4pieces\", \"All-purpose flour - 80g\", \"Panko (Japanese bread crumbs) - 80g\", \"Mirin - 40ml\", \"Dashi powder - 4tsp\", \"Water - 440ml\", \"Light soy sauce - 40ml\", \"Salt - 25g\", \"White sugar - 65g\", \"Vegetable oil - 500ml\"]]', '[[\"Chicken Katsu\", \"Heat up enough vegetable oil for deep frying in a pot\", \"Place flour, 2 beaten eggs and panko breadcrumbs in three separate shallow bowls\", \"Dip each chicken breast into the flour, followed by the beaten eggs and finally the breadcrumbs.\", \"Deep fry for 4 - 5 minutes, until cooked through. Set aside to drain, then slice.&nbsp;\"], [\"Sauce\", \"In a shallow pan, heat 1 tbsp of vegetable oil over medium heat. Saute the yellow onion until softened.\", \"Add dashi stock, soy sauce, sugar and mirin and simmer for 1-2 minutes.\", \"Pour in the beaten eggs in a circular motion, and turn off the heat.&nbsp;\"]]', '2020-08-30', 'Asian Food Network', 'T007');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
CREATE TABLE IF NOT EXISTS `subscription` (
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `ClassID` varchar(50) NOT NULL,
  `UserID` varchar(50) NOT NULL,
  PRIMARY KEY (`Number`),
  KEY `ClassID` (`ClassID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`Number`, `ClassID`, `UserID`) VALUES
(1, 'C001', 'U002'),
(3, 'C002', 'U002'),
(4, 'C006', 'U002'),
(5, 'C005', 'U002'),
(14, 'C007', 'U002'),
(20, 'C008', 'U002'),
(22, 'C004', 'U002'),
(23, 'C003', 'U002'),
(24, 'C008', 'U003'),
(25, 'C003', 'U001');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `TagID` varchar(50) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`TagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`TagID`, `Name`) VALUES
('T001', 'Dessert'),
('T002', 'Western'),
('T003', 'Korean'),
('T004', 'Asian'),
('T005', 'Lifestyle'),
('T006', 'Ideas'),
('T007', 'Japanese');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
CREATE TABLE IF NOT EXISTS `user_account` (
  `UserID` varchar(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Address` text NOT NULL,
  `Newsletter` tinyint(1) NOT NULL DEFAULT '1',
  `CardNumber` varchar(20) NOT NULL,
  `SecurityQuestion` tinyint(1) NOT NULL DEFAULT '0',
  `SecurityAnswer` varchar(255) NOT NULL,
  `Theme` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Light',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`UserID`, `Username`, `Password`, `FullName`, `Email`, `PhoneNumber`, `Address`, `Newsletter`, `CardNumber`, `SecurityQuestion`, `SecurityAnswer`, `Theme`) VALUES
('U001', 'Leebecky', 'Ambrosia_06', 'Becky Lee', 'leebecky06@gmail.com', '012-3715205', 'Taman Sering Ukay, 68000 Ampang Selangor                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', 1, '2720996038834465', 2, 'PJO', 'Light'),
('U002', 'test', 'pass', 'Tester Bot', 'fakeEmail@gmail.com', '0124543123', 'Im homeless send help                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', 1, '5229985823470014', 3, 'Pineapple Hill Convent', 'Dark'),
('U003', 'Lydia', 'password', 'Name', 'Name@gmail.com', '0124543123', '                                          ', 1, '4485034542059493', 1, 'Pet', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`ArticleID`) REFERENCES `articles` (`ArticleID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `bookmarks_ibfk_2` FOREIGN KEY (`RecipeID`) REFERENCES `recipes` (`RecipeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `bookmarks_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `user_account` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`Tags`) REFERENCES `tags` (`TagID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`Tags`) REFERENCES `tags` (`TagID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user_account` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
