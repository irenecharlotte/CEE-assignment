CREATE TABLE Location (
    location_id SERIAL PRIMARY KEY,
    respondent_id INT,
    state_name VARCHAR(255),
    FOREIGN KEY (respondent_id) REFERENCES Respondent(respondent_id)
);