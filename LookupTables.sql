-- Create table for OwnOrRent
CREATE TABLE OwnOrRent (
    id INT PRIMARY KEY,
    description VARCHAR(50) NOT NULL
);

-- Populate OwnOrRent table
INSERT INTO OwnOrRent (id, description)
VALUES
    (1, 'Own'),
    (2, 'Rent'),
    (3, 'Occupy without payment of rent');

-- Create table for HousingType
CREATE TABLE HousingType (
    id INT PRIMARY KEY,
    description VARCHAR(255) NOT NULL
);

-- Populate HousingType table
INSERT INTO HousingType (id, description)
VALUES
    (1, 'Mobile home'),
    (2, 'Single-family house detached from any other house'),
    (3, 'Single-family house attached to one or more other houses (duplex, row house, or townhome)'),
    (4, 'Apartment in a building with 2 to 4 units'),
    (5, 'Apartment in a building with 5 or more units');

-- Create table for HeatingFuel
CREATE TABLE HeatingFuel (
    id INT PRIMARY KEY,
    description VARCHAR(255) NOT NULL
);

-- Populate HeatingFuel table
INSERT INTO HeatingFuel (id, description) VALUES
(5, 'Electricity'),
(1, 'Natural gas from underground pipes'),
(2, 'Propane (bottled gas)'),
(3, 'Fuel oil'),
(7, 'Wood or pellets'),
(99, 'Other'),
(-2, 'Not applicable');

-- Create table for OutsideWallMaterial
CREATE TABLE OutsideWallMaterial (
    id INT PRIMARY KEY,
    description VARCHAR(255) NOT NULL
);

-- Populate OutsideWallMaterial table
INSERT INTO OutsideWallMaterial (id, description)
VALUES
    (1, 'Brick'),
    (2, 'Wood'),
    (3, 'Siding (aluminum, fiber cement, vinyl, or steel)'),
    (4, 'Stucco'),
    (5, 'Shingle (composition)'),
    (6, 'Stone'),
    (7, 'Concrete block'),
    (99, 'Other');