CREATE TABLE Climate (
    climate_id SERIAL PRIMARY KEY,
    respondent_id INT,
    heating_degree_days_2020 INT,
    cooling_degree_days_2020 INT,
    FOREIGN KEY (respondent_id) REFERENCES Respondent(respondent_id)
);


