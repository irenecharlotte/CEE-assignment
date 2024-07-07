CREATE TABLE Respondent (
    respondent_id INT PRIMARY KEY,
    own_or_rent_id INT,
    total_number_of_rooms INT,
    FOREIGN KEY (own_or_rent_id) REFERENCES OwnOrRent(id)
);

