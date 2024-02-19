-- Delete tables if already exists
DROP TABLE IF EXISTS campaign, category, contacts, subcategory;

-- Table to store contact info
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY, -- Contact ID (unique)
    first_name VARCHAR(50) NOT NULL, --Contact First Name
    last_name VARCHAR(50) NOT NULL, --Contact Last Name
    email VARCHAR(100) NOT NULL --Contact Email
);

-- Table to store campaign categories
CREATE TABLE category (
    category_id VARCHAR(10) PRIMARY KEY, -- Category ID (unique)
    subcategory_name VARCHAR(50) NOT NULL -- Name of the subcategory
);

-- Table to store campaign subcategories
CREATE TABLE subcategory (
    subcategory_id VARCHAR(10) PRIMARY KEY, -- Subcategory ID (unique)
    category_name VARCHAR(50) NOT NULL -- Name of the category
);

-- Table to store campaign information
CREATE TABLE campaign (
    cf_id INT PRIMARY KEY, -- Campaign ID (unique)
    contact_id INT NOT NULL, -- Contact ID (Foreign Key)
    company_name VARCHAR(100) NOT NULL, -- Name of the company
    description TEXT NOT NULL, -- Campaign description
    goal FLOAT NOT NULL, -- Fundraising goal
    pledged FLOAT NOT NULL, -- Amount pledged
    outcome VARCHAR(50) NOT NULL, -- Outcome of campaign
    backers_count INT NOT NULL, -- Number of backers
    country VARCHAR(5) NOT NULL, -- Country of campaign
    currency VARCHAR(5) NOT NULL, -- Currency
    launch_date DATE NOT NULL, -- Campaign Launch date
    end_date DATE NOT NULL, -- Campaign End date 
    category_id VARCHAR(10) NOT NULL, -- Category ID (Foreign Key)
    subcategory_id VARCHAR(10) NOT NULL, -- Subcategory ID (Foreign Key)
	FOREIGN KEY (category_id) REFERENCES category (category_id), -- Foreign key referencing category table
    FOREIGN KEY (contact_id) REFERENCES contacts (contact_id), -- Foreign key referencing contacts table
    FOREIGN KEY (subcategory_id) REFERENCES subcategory (subcategory_id) -- Foreign key referencing subcategory table
);

-- SELECT statements to see tables once data imported
SELECT * FROM campaign;

SELECT * FROM category;

SELECT * FROM contacts;

SELECT * FROM subcategory;