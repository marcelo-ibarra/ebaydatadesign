-- this is a comment in SQL (yes, the space is needed!)
-- these statements will drop the tables and re-add them
-- this is akin to reformatting and reinstalling Windows (OS X never needs a reinstall...) ;)
DROP TABLE IF EXISTS starRating;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS user;

-- the CREATE TABLE function is a function that makes tons of arguments to layout the table's schema
CREATE TABLE user (
	-- this creates the attribute for the primary key
	-- auto_increment tells mySQL to number them {1, 2, 3, ...}
	-- not null means the attribute is required!
	userId INT UNSIGNED AUTO_INCREMENT NOT NULL,
	userEmail VARCHAR (128) NOT NULL,
	-- to make something optional, exclude the not null
	userName VARCHAR(32),
	userPassHash VARCHAR(32) NOT NULL,
	userPassSalt VARCHAR(32) NOT NULL,
	-- to make sure duplicate data cannot exist, create a unique index
	UNIQUE(userEmail),
	UNIQUE(userName),
	-- this officiates the primary key for entity
	PRIMARY KEY(userId)
);

-- create the product entity
CREATE TABLE user (
	-- this is fo yet another primary key...
	productId INT UNSIGNED AUTO_INCREMENT NOT NULL,
	-- this is for a foreign key; auto_incremented is omitted by design
	productSellerId INT UNSIGNED NOT NULL,
	productImage VARCHAR (140) NOT NULL,
	productDescription VARCHAR (140) NOT NULL,
	productName VARCHAR (140) NOT NULL,
	productPrice VARCHAR (140) NOT NULL
);

-- create the starRating (a weak entity from 1-to-n for product --> user
CREATE TABLE starRating (
	-- these are auto_increment because they're still foreign keys
	starRatingUserId INT UNSIGNED NOT NULL,
	starRatingProductId INT UNSIGNED NOT NULL,
	starRating DATETIME NOT NULL,
	-- index the foreign keys
	INDEX(starRatingUserId),
	INDEX(starRatingProductId),
	-- create the foreign key relations
	FOREIGN KEY(starRatingUserId) REFERENCES user(userId),
	FOREIGN KEY(starRatingProductId) REFERENCES starRating(starRatingUserId),
	-- finally, create a composite foreign key with the two foreign keys
	PRIMARY KEY(starRatingUserId, starRatingProductId)
);









