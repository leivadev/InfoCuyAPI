/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS infocuyDB;
USE infocuyDB;

DROP TABLE IF EXISTS provinces;
CREATE TABLE IF NOT EXISTS provinces (
    provinceId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    provinceName VARCHAR(100) NOT NULL,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO provinces (provinceName) VALUES
    ('Bocas del Toro'), ('Coclé'), ('Colón'), ('Chiriquí'), ('Darién'),
    ('Herrera'), ('Los Santos'), ('Panamá'), ('Panamá Oeste'), ('Veraguas');

DROP TABLE IF EXISTS districts;
CREATE TABLE IF NOT EXISTS districts (
    districtId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_province INT NOT NULL,
    districtName VARCHAR(100) NOT NULL,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),

    FOREIGN KEY (fk_province) REFERENCES provinces(provinceId)
);

INSERT INTO districts (fk_province, districtName) VALUES
    (4, 'Alanje'), (4, 'Barú'), (4, 'Boquerón'),
    (4, 'Boquete'), (4, 'Bugaba'), (4, 'David'),
    (4, 'Dolega'), (4, 'Gualaca'), (4, 'Remedios'),
    (4, 'Renacimiento'), (4, 'San Félix'), (4, 'San Lorenzo'),
    (4, 'Tierras Altas'), (4, 'Tolé');

DROP TABLE IF EXISTS statuses;
CREATE TABLE IF NOT EXISTS statuses (
    statusId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    statusName VARCHAR(50) NOT NULL,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO statuses (statusName) VALUES ('In Progress'), ('Canceled'), ('Completed');

DROP TABLE IF EXISTS touristAttractionTypes;
CREATE TABLE IF NOT EXISTS touristAttractionTypes (
    touristAttractionTypeId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    touristAttractionTypeName VARCHAR(100) NOT NULL,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO touristAttractionTypes (touristAttractionTypeName) VALUES
    ('Beaches'), ('Mountains'), ('Coffee Plantations'),
    ('Wildlife Reserves'), ('National Parks'), ('Waterfalls'),
    ('Hot Springs'), ('Rivers'), ('Caves'),
    ('Cultural Sites'), ('Adventure Sports'), ('Botanical Gardens'),
    ('Historical Landmarks'), ('Park'), ('Art Galleries'), ('Others');

DROP TABLE IF EXISTS touristAttractions;
CREATE TABLE IF NOT EXISTS touristAttractions (
    touristAttractionId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_district INT NOT NULL,
    fk_TouristAttractionType INT NOT NULL,
    touristAttractionName VARCHAR(100) NOT NULL,
    description VARCHAR(255) NOT NULL,
    photo VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    openingHours JSON NOT NULL,
    phoneNumber VARCHAR(12),
    email VARCHAR(255),
    websiteUrl VARCHAR(255),
    isDeleted TINYINT(1) NOT NULL DEFAULT 0,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),

    FOREIGN KEY (fk_district) REFERENCES districts(districtId),
    FOREIGN KEY (fk_TouristAttractionType) REFERENCES touristAttractionTypes(touristAttractionTypeId)
);

DROP TABLE IF EXISTS eventTypes;
CREATE TABLE IF NOT EXISTS eventTypes (
    eventTypeId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    eventTypeName VARCHAR(100) NOT NULL,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO eventTypes (eventTypeName) VALUES
    ('Social'), ('Sports'), ('Cultural'),
    ('Music'), ('Academic'), ('Technology'),
    ('Charity'), ('Health'), ('Political'),
    ('Religious'), ('Environmental'), ('Others');

DROP TABLE IF EXISTS events;
CREATE TABLE IF NOT EXISTS events (
    eventId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_district INT NOT NULL,
    fk_status INT NOT NULL,
    fk_eventType INT NOT NULL,
    eventName VARCHAR(100) NOT NULL,
    description VARCHAR(255) NOT NULL,
    photo VARCHAR(255) NOT NULL,
    startDate DATETIME NOT NULL,
    endDate DATETIME NOT NULL,
    location VARCHAR(100) NOT NULL,
    phoneNumber VARCHAR(12),
    email VARCHAR(255),
    isDeleted TINYINT(1) NOT NULL DEFAULT 0,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),

    FOREIGN KEY (fk_district) REFERENCES districts(districtId),
    FOREIGN KEY (fk_status) REFERENCES statuses(statusId),
    FOREIGN KEY (fk_eventType) REFERENCES eventTypes(eventTypeId)
);

DROP TABLE IF EXISTS authors;
CREATE TABLE IF NOT EXISTS authors (
    authorId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50),
    profilePhoto VARCHAR(255),
    description VARCHAR(255),
    email VARCHAR(100),
    isDeleted TINYINT(1) NOT NULL DEFAULT 0,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

DROP TABLE IF EXISTS tags;
CREATE TABLE IF NOT EXISTS tags(
    tagId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tagName VARCHAR(100) NOT NULL
);

INSERT INTO tags (tagName)
VALUES
    ('Local News'), ('Breaking News'), ('Community'),
    ('City Council'), ('Local Elections'), ('School Board'),
    ('Public Safety'), ('Traffic Updates'), ('Weather Reports'),
    ('Local Events'), ('Crime Reports'), ('Neighborhood Watch'),
    ('Public Announcements'), ('Local Businesses'), ('Education News'),
    ('Health and Safety'), ('Local Government'), ('Public Services'),
    ('Community Projects'), ('Local Sports');

DROP TABLE IF EXISTS localNews;
CREATE TABLE IF NOT EXISTS localNews (
    localNewsId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_district INT,
    fk_author INT NOT NULL,
    fk_tag INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    photo VARCHAR(255) NOT NULL,
    publicationDate DATE NOT NULL,
    isDeleted TINYINT(1) NOT NULL DEFAULT 0,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),

    FOREIGN KEY (fk_district) REFERENCES districts(districtId),
    FOREIGN KEY (fk_tag) REFERENCES tags(tagId),
    FOREIGN KEY (fk_author) REFERENCES authors(authorId)
);

DROP TABLE IF EXISTS serviceTypes;
CREATE TABLE IF NOT EXISTS serviceTypes (
    serviceTypeId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    serviceTypeName VARCHAR(100) NOT NULL,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO serviceTypes (serviceTypeName) VALUES
    ('Healthcare Services'), ('Educational Services'),
    ('Social Welfare Services'), ('Public Safety Services'),
    ('Environmental Services'), ('Transportation Services'),
    ('Housing Services'), ('Legal Aid Services'),
    ('Community Development Services'), ('Emergency Response Services');

DROP TABLE IF EXISTS services;
CREATE TABLE IF NOT EXISTS services (
    serviceId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_serviceType INT NOT NULL,
    publicServiceName VARCHAR(100) NOT NULL,
    website VARCHAR(255),
    phoneNumber VARCHAR(12),
    email VARCHAR(255),
    isDeleted TINYINT(1) NOT NULL DEFAULT 0,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),

    FOREIGN KEY (fk_serviceType) REFERENCES serviceTypes(serviceTypeId)
);

DROP TABLE IF EXISTS services_districts;
CREATE TABLE IF NOT EXISTS services_districts (
    fk_service INT NOT NULL,
    fk_district INT NOT NULL,
    createdAt timestamp NULL DEFAULT current_timestamp(),
    updatedAt timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    FOREIGN KEY (fk_service) REFERENCES services(serviceId),
    FOREIGN KEY (fk_district) REFERENCES districts(districtId),
    PRIMARY KEY (fk_service, fk_district)
);
