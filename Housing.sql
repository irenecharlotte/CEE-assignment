CREATE TABLE Housing (
    housing_id SERIAL PRIMARY KEY,
    respondent_id INT,
    type_of_housing_unit INT,
    central_ac BOOLEAN,
    heating_fuel_id INT,
    major_outside_wall_material_id INT,
    FOREIGN KEY (respondent_id) REFERENCES Respondent(respondent_id),
    FOREIGN KEY (type_of_housing_unit) REFERENCES HousingType(id),
    FOREIGN KEY (heating_fuel_id) REFERENCES HeatingFuel(id),
    FOREIGN KEY (major_outside_wall_material_id) REFERENCES OutsideWallMaterial(id)
);