CREATE DATABASE  IF NOT EXISTS `little_lemon`;
USE `little_lemon`;




--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;

CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `ContactNumber` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;

INSERT INTO `Customers` VALUES (1,'John Doe','555-1234','customer1@email.com'),(2,'Jane Doe','555-2345','customer2@email.com'),(3,'Alice','555-3456','customer3@email.com'),(4,'Bob','555-4567','customer4@email.com'),(5,'Charlie','555-5678','customer5@email.com'),(6,'David','555-6789','customer6@email.com'),(7,'Emily','555-7890','customer7@email.com'),(8,'Frank','555-8901','customer8@email.com'),(9,'Grace','555-9012','customer9@email.com'),(10,'Hannah','555-0123','customer10@email.com');

UNLOCK TABLES;

--
-- Table structure for table `staffinformation`
--

DROP TABLE IF EXISTS `staffinformation`;

CREATE TABLE `staffinformation` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Salary` decimal(10,0) NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `staffinformation`
--

LOCK TABLES `staffinformation` WRITE;

INSERT INTO `staffinformation` VALUES (1,'Sarah','Manager',55000),(2,'Tom','Waiter',30000),(3,'Linda','Chef',40000),(4,'Robert','Cashier',31000),(5,'Daniel','Waiter',32000),(6,'Susan','Hostess',28000),(7,'Chris','Manager',60000),(8,'Jessica','Chef',38000),(9,'Brian','Waiter',29000),(10,'Kim','Hostess',27000);

UNLOCK TABLES;


--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `StaffID` int NOT NULL,
  `Date` datetime NOT NULL,
  `TableNumber` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `customer_fk_idx` (`CustomerID`),
  KEY `staff_fk_idx` (`StaffID`),
  CONSTRAINT `customer_fk` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  CONSTRAINT `staff_fk` FOREIGN KEY (`StaffID`) REFERENCES `staffinformation` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;

INSERT INTO `bookings` VALUES (1,1,1,'2023-09-01 12:00:00',10),(2,2,2,'2023-09-01 12:30:00',12),(3,3,3,'2023-09-02 13:00:00',14),(4,4,4,'2023-09-02 14:00:00',16),(5,5,5,'2023-09-03 15:00:00',18),(6,6,6,'2023-09-03 16:00:00',20),(7,7,7,'2023-09-04 17:00:00',22),(8,8,8,'2023-09-04 18:00:00',24),(10,10,10,'2023-09-05 20:00:00',28),(11,1,1,'2022-10-10 00:00:00',5),(12,3,2,'2022-11-12 00:00:00',3),(13,2,3,'2022-10-11 00:00:00',2),(14,1,1,'2022-10-13 00:00:00',2),(15,1,1,'2022-10-11 00:00:00',5),(16,1,2,'2022-10-10 00:00:00',5);

UNLOCK TABLES;



--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;

CREATE TABLE `menuitems` (
  `MenuItemsID` int NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(45) DEFAULT NULL,
  `StarterName` varchar(45) DEFAULT NULL,
  `DesertName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MenuItemsID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;

INSERT INTO `menuitems` VALUES (1,'Grilled Chicken','Caesar Salad','Cheesecake'),(2,'Beef Steak','Tomato Soup','Chocolate Mousse'),(3,'Vegetarian Pizza','Garlic Bread','Fruit Salad'),(4,'Spaghetti Carbonara','Bruschetta','Tiramisu'),(5,'Fish and Chips','Coleslaw','Apple Pie'),(6,'Sushi Platter','Miso Soup','Green Tea Ice Cream'),(7,'BBQ Ribs','Cornbread','Peach Cobbler'),(8,'Chicken Curry','Samosas','Gulab Jamun'),(9,'Lobster Tail','Oysters','Key Lime Pie'),(10,'Vegan Burger','Sweet Potato Fries','Vegan Brownie');

UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `MenuItemsID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Cuisine` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `menu_items_menu_fk_idx` (`MenuItemsID`),
  CONSTRAINT `menus_items_menu_fk` FOREIGN KEY (`MenuItemsID`) REFERENCES `menuitems` (`MenuItemsID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;

INSERT INTO `menus` VALUES (1,1,'Cheese Burger','Main',10,NULL),(2,2,'Veggie Burger','Main',9,NULL),(3,3,'French Fries','Side',3,NULL),(4,4,'Caesar Salad','Main',8,NULL),(5,5,'Chicken Wings','Appetizer',6,NULL),(6,6,'Coca Cola','Drink',2,NULL),(7,7,'Pasta','Main',11,NULL),(8,8,'Rice','Side',4,NULL),(9,9,'Margarita','Drink',5,NULL),(10,10,'Ice Cream','Dessert',4,NULL);

UNLOCK TABLES;


--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `MenuItemID` int NOT NULL,
  `StaffID` int NOT NULL,
  `Date` datetime NOT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` decimal(10,0) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `customer_fk_idx` (`CustomerID`),
  KEY `menu_fk_idx` (`MenuItemID`),
  KEY `staff_fk_idx` (`StaffID`),
  CONSTRAINT `customer_orders_fk` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  CONSTRAINT `menu_orders_fk` FOREIGN KEY (`MenuItemID`) REFERENCES `menus` (`MenuID`),
  CONSTRAINT `staff_orders_fk` FOREIGN KEY (`StaffID`) REFERENCES `staffinformation` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;

INSERT INTO `orders` VALUES (1,1,1,1,'2023-09-01 12:00:00',2,171),(2,2,2,2,'2023-09-01 12:30:00',1,174),(3,3,3,3,'2023-09-02 13:00:00',3,358),(4,4,4,4,'2023-09-02 14:00:00',1,265),(6,6,6,6,'2023-09-03 16:00:00',2,465),(7,7,7,7,'2023-09-04 17:00:00',1,65),(8,8,8,8,'2023-09-04 18:00:00',2,437),(9,9,9,9,'2023-09-05 19:00:00',3,484),(10,10,10,10,'2023-09-05 20:00:00',1,111);

UNLOCK TABLES;



--
-- Table structure for table `orderdeliverystatuses`
--

DROP TABLE IF EXISTS `orderdeliverystatuses`;

CREATE TABLE `orderdeliverystatuses` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `Date` datetime NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `order_fk_idx` (`OrderID`),
  CONSTRAINT `order_delivery_fk` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `orderdeliverystatuses`
--

LOCK TABLES `orderdeliverystatuses` WRITE;

INSERT INTO `orderdeliverystatuses` VALUES (1,1,'2023-09-01 12:15:00','Delivered'),(2,2,'2023-09-01 12:45:00','Preparing'),(3,3,'2023-09-02 13:15:00','Preparing'),(4,4,'2023-09-02 14:15:00','Out for delivery'),(6,6,'2023-09-03 16:15:00','Delivered'),(7,7,'2023-09-04 17:15:00','Preparing'),(8,8,'2023-09-04 18:15:00','Delivered'),(9,9,'2023-09-05 19:15:00','Delivered'),(10,10,'2023-09-05 20:15:00','Delivered');

UNLOCK TABLES;






--
-- Dumping routines for database 'little_lemon'
--

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxQuantity`()
BEGIN
  DECLARE maxQty INT;

  SELECT MAX(Quantity) INTO maxQty FROM `little_lemon`.`Orders`;

  SELECT maxQty AS 'Maximum Ordered Quantity';
END $$
DELIMITER ;




DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageBooking`(
    IN action_type VARCHAR(10),         -- 'ADD', 'UPDATE', or 'CANCEL'
    IN p_booking_id INT,                -- Required for UPDATE and CANCEL
    IN p_customer_id INT,               -- Required for ADD
    IN p_booking_date DATETIME,         -- Required for ADD and UPDATE
    IN p_table_number INT,              -- Required for ADD
    IN p_staff_id INT                   -- Required for ADD
)
BEGIN
    IF action_type = 'ADD' THEN
        INSERT INTO `little_lemon`.`Bookings` (
            `CustomerID`, `Date`, `TableNumber`, `StaffID`
        ) VALUES (
            p_customer_id, p_booking_date, p_table_number, p_staff_id
        );

        SELECT CONCAT('New booking added for Customer ID ', p_customer_id) AS 'Result';

    ELSEIF action_type = 'UPDATE' THEN
        UPDATE `little_lemon`.`Bookings`
        SET `Date` = p_booking_date
        WHERE `BookingID` = p_booking_id;

        SELECT CONCAT('Booking ID ', p_booking_id, ' updated') AS 'Result';

    ELSEIF action_type = 'CANCEL' THEN
        DELETE FROM `little_lemon`.`Bookings`
        WHERE `BookingID` = p_booking_id;

        SELECT CONCAT('Booking ID ', p_booking_id, ' cancelled') AS 'Result';

    ELSE
        SELECT 'Invalid action. Use ADD, UPDATE, or CANCEL.' AS 'Result';
    END IF;
END $$

DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(
    IN booking_id_to_update INT, 
    IN new_booking_date DATE)
BEGIN
    -- Update the booking record
    UPDATE `little_lemon`.`Bookings`
    SET `Date` = new_booking_date
    WHERE `BookingID` = booking_id_to_update;

    SELECT CONCAT('Booking ', booking_id_to_update, ' updated') AS 'Confirmation';
END $$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(
    IN new_booking_id INT, 
    IN new_customer_id INT, 
    IN new_booking_date DATE, 
    IN new_table_number INT, 
    IN new_staff_id INT)
BEGIN
    -- Insert the new booking record
    INSERT INTO `little_lemon`.`Bookings`(
        `BookingID`, 
        `CustomerID`, 
        `Date`, 
        `TableNumber`, 
        `StaffID`)
    VALUES(
        new_booking_id, 
        new_customer_id, 
        new_booking_date, 
        new_table_number,
        new_staff_id
    );

    SELECT 'New booking added' AS 'Confirmation';
END $$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN booking_id_to_cancel INT)
BEGIN
    -- Delete the booking record
    DELETE FROM `little_lemon`.`Bookings`
    WHERE `BookingID` = booking_id_to_cancel;

    SELECT CONCAT('Booking ', booking_id_to_cancel, ' cancelled') AS 'Confirmation';
END $$
DELIMITER ;





