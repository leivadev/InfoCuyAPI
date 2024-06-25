/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS infocuyDB;
USE infocuyDB;

DROP TABLE IF EXISTS provinces;
CREATE TABLE IF NOT EXISTS provinces (
    province_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    province_name VARCHAR(100) NOT NULL,
    created_at timestamp NULL DEFAULT current_timestamp(),
    updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO provinces (province_name) VALUES
    ('Bocas del Toro'), ('Coclé'), ('Colón'), ('Chiriquí'), ('Darién'),
    ('Herrera'), ('Los Santos'), ('Panamá'), ('Panamá Oeste'), ('Veraguas');

DROP TABLE IF EXISTS districts;
CREATE TABLE IF NOT EXISTS districts (
    district_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_province INT NOT NULL,
    district_name VARCHAR(100) NOT NULL,
    created_at timestamp NULL DEFAULT current_timestamp(),
    updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),

    FOREIGN KEY (fk_province) REFERENCES provinces(province_id)
);

INSERT INTO districts (fk_province, district_name) VALUES
    (4, 'Alanje'), (4, 'Barú'), (4, 'Boquerón'),
    (4, 'Boquete'), (4, 'Bugaba'), (4, 'David'),
    (4, 'Dolega'), (4, 'Gualaca'), (4, 'Remedios'),
    (4, 'Renacimiento'), (4, 'San Félix'), (4, 'San Lorenzo'),
    (4, 'Tierras Altas'), (4, 'Tolé');

DROP TABLE IF EXISTS statuses;
CREATE TABLE IF NOT EXISTS statuses (
    status_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL,
    created_at timestamp NULL DEFAULT current_timestamp(),
    updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO statuses (status_name) VALUES ('In Progress'), ('Canceled'), ('Completed');

DROP TABLE IF EXISTS tourist_attraction_types;
CREATE TABLE IF NOT EXISTS tourist_attraction_types (
    tourist_attraction_type_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tourist_attraction_type_name VARCHAR(100) NOT NULL,
    created_at timestamp NULL DEFAULT current_timestamp(),
    updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO tourist_attraction_types (tourist_attraction_type_name) VALUES
    ('Beaches'), ('Mountains'), ('Coffee Plantations'),
    ('Wildlife Reserves'), ('National Parks'), ('Waterfalls'),
    ('Hot Springs'), ('Rivers'), ('Caves'),
    ('Cultural Sites'), ('Adventure Sports'), ('Botanical Gardens'),
    ('Historical Landmarks'), ('Park'), ('Art Galleries'), ('Others');

DROP TABLE IF EXISTS tourist_attractions;
CREATE TABLE IF NOT EXISTS tourist_attractions (
     tourist_attraction_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     fk_district INT NOT NULL,
     fk_status INT NOT NULL,
     fk_tourist_attraction_type INT NOT NULL,
     tourist_attraction_name VARCHAR(100) NOT NULL,
     description VARCHAR(255) NOT NULL,
     photo VARCHAR(255) NOT NULL,
     address VARCHAR(255) NOT NULL,
     opening_hours JSON NOT NULL,
     phone_number VARCHAR(12),
     email VARCHAR(255),
     website_url VARCHAR(255),
     isDeleted TINYINT(1)  NOT NULL DEFAULT 0 NOT NULL DEFAULT 0,
     created_at timestamp NULL DEFAULT current_timestamp(),
     updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),

     FOREIGN KEY (fk_district) REFERENCES districts(district_id),
     FOREIGN KEY (fk_status) REFERENCES statuses(status_id),
     FOREIGN KEY (fk_tourist_attraction_type) REFERENCES tourist_attraction_types(tourist_attraction_type_id)
);

DROP TABLE IF EXISTS event_types;
CREATE TABLE IF NOT EXISTS event_types (
     event_type_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     event_type_name VARCHAR(100) NOT NULL,
     created_at timestamp NULL DEFAULT current_timestamp(),
     updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO event_types (event_type_name) VALUES
    ('Social'), ('Sports'), ('Cultural'),
    ('Music'), ('Academic'), ('Technology'),
    ('Charity'), ('Health'), ('Political'),
    ('Religious'), ('Environmental'), ('Others');

DROP TABLE IF EXISTS events;
CREATE TABLE IF NOT EXISTS events (
    event_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_district INT NOT NULL,
    fk_status INT NOT NULL,
    fk_event_type INT NOT NULL,
    event_name VARCHAR(100) NOT NULL,
    description VARCHAR(255) NOT NULL,
    photo VARCHAR(255) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    location VARCHAR(100) NOT NULL,
    phone_number VARCHAR(12),
    email VARCHAR(255),
    isDeleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at timestamp NULL DEFAULT current_timestamp(),
    updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),

    FOREIGN KEY (fk_district) REFERENCES districts(district_id),
    FOREIGN KEY (fk_status) REFERENCES statuses(status_id),
    FOREIGN KEY (fk_event_type) REFERENCES event_types(event_type_id)
);

DROP TABLE IF EXISTS authors;
CREATE TABLE IF NOT EXISTS authors (
     author_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(100) NOT NULL,
     role VARCHAR(50),
     profile_photo VARCHAR(255),
     description VARCHAR(255),
     email VARCHAR(100),
     isDeleted TINYINT(1) NOT NULL DEFAULT 0,
     created_at timestamp NULL DEFAULT current_timestamp(),
     updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

DROP TABLE IF EXISTS tags;
CREATE TABLE IF NOT EXISTS tags(
    id_tag INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_tag VARCHAR(100) NOT NULL
);

INSERT INTO tags (name_tag)
VALUES
    ('Local News'), ('Breaking News'), ('Community'),
    ('City Council'), ('Local Elections'), ('School Board'),
    ('Public Safety'), ('Traffic Updates'), ('Weather Reports'),
    ('Local Events'), ('Crime Reports'), ('Neighborhood Watch'),
    ('Public Announcements'), ('Local Businesses'), ('Education News'),
    ('Health and Safety'), ('Local Government'), ('Public Services'),
    ('Community Projects'), ('Local Sports');

DROP TABLE IF EXISTS local_news;
CREATE TABLE IF NOT EXISTS local_news (
    local_news_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_district INT,
    fk_author INT NOT NULL,
    fk_tag INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    photo VARCHAR(255) NOT NULL,
    publication_date DATE NOT NULL,
    isDeleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at timestamp NULL DEFAULT current_timestamp(),
    updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),

    FOREIGN KEY (fk_district) REFERENCES districts(district_id),
    FOREIGN KEY (fk_tag) REFERENCES tags(id_tag),
    FOREIGN KEY (fk_author) REFERENCES authors(author_id)
);

DROP TABLE IF EXISTS service_types;
CREATE TABLE IF NOT EXISTS service_types (
    service_type_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    service_type_name VARCHAR(100) NOT NULL,
    created_at timestamp NULL DEFAULT current_timestamp(),
    updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO service_types (service_type_name) VALUES
    ('Healthcare Services'), ('Educational Services'),
    ('Social Welfare Services'), ('Public Safety Services'),
    ('Environmental Services'), ('Transportation Services'),
    ('Housing Services'), ('Legal Aid Services'),
    ('Community Development Services'), ('Emergency Response Services');

DROP TABLE IF EXISTS services;
CREATE TABLE IF NOT EXISTS services (
     service_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     fk_service_type INT NOT NULL,
     public_service_name VARCHAR(100) NOT NULL,
     website VARCHAR(255),
     phone_number VARCHAR(12),
     email VARCHAR(255),
     isDeleted TINYINT(1) NOT NULL DEFAULT 0,
     created_at timestamp NULL DEFAULT current_timestamp(),
     updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),

     FOREIGN KEY (fk_service_type) REFERENCES service_types(service_type_id)
);

DROP TABLE IF EXISTS services_districts;
CREATE TABLE IF NOT EXISTS services_districts (
    fk_service INT NOT NULL,
    fk_district INT NOT NULL,
    created_at timestamp NULL DEFAULT current_timestamp(),
    updated_at timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    FOREIGN KEY (fk_service) REFERENCES services(service_id),
    FOREIGN KEY (fk_district) REFERENCES districts(district_id),
    PRIMARY KEY (fk_service, fk_district)
);
