SELECT owm.description AS wall_material,
       COUNT(*) AS home_count
FROM Housing h
JOIN Respondent r ON r.respondent_id = h.respondent_id
JOIN Location l ON r.respondent_id = l.respondent_id
JOIN HeatingFuel hf ON h.heating_fuel_id = hf.id
JOIN OutsideWallMaterial owm ON h.major_outside_wall_material_id = owm.id
JOIN HousingType ht ON h.type_of_housing_unit = ht.id
WHERE ht.description IN ('Single-family house detached from any other house',
	'Single-family house attached to one or more other houses (duplex, row house, or townhome)')
  AND h.central_ac = true
  AND hf.description = 'Natural gas from underground pipes'
  AND l.state_name = 'Minnesota'
GROUP BY owm.description;

