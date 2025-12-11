-- AIRCRAFT DATA 
-- (Mixing UAVs, RDF military, civilian, foreign, with random last_seen and statuses)

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF101', 'RDF-101', 'Cessna-172', 'Rwanda', SYSTIMESTAMP, 'Normal', 'Training flight over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UNKNOWN', NULL, 'UAV', 'Unknown', NULL, 'Unknown', 'Detected over northern border');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF102', 'RDF-102', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '2' HOUR, 'Normal', 'Surveillance mission near Akagera');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_ALPHA', NULL, 'UAV', 'Unknown', SYSTIMESTAMP - INTERVAL '1' DAY, 'Suspicious', 'High-altitude UAV detected near Nyungwe');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF103', 'RDF-103', 'Cessna-182', 'Rwanda', SYSTIMESTAMP - INTERVAL '3' HOUR, 'Normal', 'Routine flight over Kigali-Rwanda corridor');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN01', 'FR-501', 'Airbus-A320', 'France', SYSTIMESTAMP - INTERVAL '1' DAY, 'Normal', 'International flight Kigali–Paris');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF104', 'RDF-104', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '30' MINUTE, 'Normal', 'Medical evacuation training');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_BRAVO', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Unidentified UAV near Lake Kivu');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA01', 'RWA-M01', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '4' HOUR, 'Normal', 'Routine air patrol');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA02', 'RWA-M02', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '6' HOUR, 'Normal', 'Border security flight');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN02', 'US-201', 'Cessna-172', 'USA', SYSTIMESTAMP - INTERVAL '12' HOUR, 'Normal', 'Private flight near Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_CHARLIE', NULL, 'UAV', 'Unknown', SYSTIMESTAMP - INTERVAL '5' HOUR, 'Suspicious', 'Drone detected near Gisenyi');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF105', 'RDF-105', 'Cessna-172', 'Rwanda', SYSTIMESTAMP - INTERVAL '7' HOUR, 'Normal', 'Training flight over Huye');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA03', 'RWA-M03', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '2' DAY, 'Normal', 'Patrol mission near Musanze');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN03', 'FR-502', 'Airbus-A320', 'France', SYSTIMESTAMP - INTERVAL '3' DAY, 'Normal', 'International flight Kigali–Paris');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_DELTA', NULL, 'UAV', 'Unknown', SYSTIMESTAMP - INTERVAL '2' DAY, 'Suspicious', 'Drone detected near Akagera National Park');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF106', 'RDF-106', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '6' HOUR, 'Normal', 'Transport mission over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA04', 'RWA-M04', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '10' HOUR, 'Normal', 'Border monitoring flight');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_ECHO', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Unidentified UAV near Nyungwe');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN04', 'KE-101', 'Cessna-172', 'Kenya', SYSTIMESTAMP - INTERVAL '8' HOUR, 'Normal', 'Private flight along Rwanda–Kenya border');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF107', 'RDF-107', 'Cessna-182', 'Rwanda', SYSTIMESTAMP - INTERVAL '1' HOUR, 'Normal', 'Training over Musanze region');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA05', 'RWA-M05', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '3' HOUR, 'Normal', 'Air patrol near Lake Kivu');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_FOXTROT', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected near Southern Province');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN05', 'UG-203', 'Cessna-172', 'Uganda', SYSTIMESTAMP - INTERVAL '1' DAY, 'Normal', 'Flight over Kigali corridor');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF108', 'RDF-108', 'Cessna-172', 'Rwanda', SYSTIMESTAMP - INTERVAL '2' HOUR, 'Normal', 'Training flight near Nyungwe');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA06', 'RWA-M06', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '8' HOUR, 'Normal', 'Routine air patrol near Lake Muhazi');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_GOLF', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN06', 'FR-503', 'Airbus-A320', 'France', SYSTIMESTAMP - INTERVAL '3' DAY, 'Normal', 'International flight Kigali–Paris');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF109', 'RDF-109', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '30' MINUTE, 'Normal', 'Medical mission near Huye');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA07', 'RWA-M07', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '6' HOUR, 'Normal', 'Border security patrol');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_HOTEL', NULL, 'UAV', 'Unknown', SYSTIMESTAMP - INTERVAL '12' HOUR, 'Suspicious', 'Unidentified UAV near Nyungwe National Park');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN07', 'KE-102', 'Cessna-182', 'Kenya', SYSTIMESTAMP - INTERVAL '1' DAY, 'Normal', 'Private flight near Rwanda–Kenya border');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF110', 'RDF-110', 'Cessna-172', 'Rwanda', SYSTIMESTAMP - INTERVAL '3' HOUR, 'Normal', 'Training over Musanze region');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA08', 'RWA-M08', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '5' HOUR, 'Normal', 'Air patrol near Lake Kivu');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_INDIA', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected near Southern Province');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN08', 'UG-204', 'Cessna-172', 'Uganda', SYSTIMESTAMP - INTERVAL '2' DAY, 'Normal', 'Flight over Kigali corridor');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF111', 'RDF-111', 'Cessna-182', 'Rwanda', SYSTIMESTAMP - INTERVAL '4' HOUR, 'Normal', 'Training over Nyamagabe region');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA09', 'RWA-M09', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '7' HOUR, 'Normal', 'Border surveillance mission');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_JULIET', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected near Akagera River');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN09', 'TZ-301', 'Cessna-172', 'Tanzania', SYSTIMESTAMP - INTERVAL '1' DAY, 'Normal', 'Private flight near Rwanda–Tanzania border');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF112', 'RDF-112', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '2' HOUR, 'Normal', 'Medical mission near Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA10', 'RWA-M10', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '10' HOUR, 'Normal', 'Air patrol near Nyungwe National Park');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_KILO', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Unidentified UAV near Eastern Province');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN10', 'RW-601', 'Cessna-172', 'Rwanda', SYSTIMESTAMP - INTERVAL '6' HOUR, 'Normal', 'Private flight over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF113', 'RDF-113', 'Cessna-172', 'Rwanda', SYSTIMESTAMP - INTERVAL '3' HOUR, 'Normal', 'Training flight over Musanze');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA11', 'RWA-M11', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '5' HOUR, 'Normal', 'Border security flight');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_LIMA', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected near Lake Muhazi');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN11', 'FR-504', 'Airbus-A320', 'France', SYSTIMESTAMP - INTERVAL '2' DAY, 'Normal', 'International flight Kigali–Paris');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF114', 'RDF-114', 'Cessna-182', 'Rwanda', SYSTIMESTAMP - INTERVAL '4' HOUR, 'Normal', 'Training flight over Huye');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA12', 'RWA-M12', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '8' HOUR, 'Normal', 'Patrol mission near Akagera');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_MIKE', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Unidentified UAV over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN12', 'US-202', 'Cessna-172', 'USA', SYSTIMESTAMP - INTERVAL '3' DAY, 'Normal', 'Private flight near Kigali corridor');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF115', 'RDF-115', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '1' HOUR, 'Normal', 'Medical mission over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA13', 'RWA-M13', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '9' HOUR, 'Normal', 'Border patrol near Lake Kivu');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_NOVEMBER', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected near Northern Province');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN13', 'KE-103', 'Cessna-172', 'Kenya', SYSTIMESTAMP - INTERVAL '1' DAY, 'Normal', 'Private flight near Rwanda–Kenya border');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF116', 'RDF-116', 'Cessna-182', 'Rwanda', SYSTIMESTAMP - INTERVAL '2' HOUR, 'Normal', 'Training over Musanze');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA14', 'RWA-M14', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '6' HOUR, 'Normal', 'Air patrol near Nyungwe');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_OSCAR', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Unidentified UAV over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN14', 'UG-205', 'Cessna-172', 'Uganda', SYSTIMESTAMP - INTERVAL '2' DAY, 'Normal', 'Flight near Kigali corridor');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF117', 'RDF-117', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '3' HOUR, 'Normal', 'Medical mission near Huye');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA15', 'RWA-M15', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '5' HOUR, 'Normal', 'Border security patrol');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_PAPA', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected near Akagera');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN15', 'TZ-302', 'Cessna-172', 'Tanzania', SYSTIMESTAMP - INTERVAL '1' DAY, 'Normal', 'Private flight near Rwanda–Tanzania border');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF118', 'RDF-118', 'Cessna-172', 'Rwanda', SYSTIMESTAMP - INTERVAL '2' HOUR, 'Normal', 'Training over Musanze region');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA16', 'RWA-M16', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '7' HOUR, 'Normal', 'Air patrol near Lake Kivu');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_QUEBEC', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected over Southern Province');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN16', 'FR-505', 'Airbus-A320', 'France', SYSTIMESTAMP - INTERVAL '3' DAY, 'Normal', 'International flight Kigali–Paris');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF119', 'RDF-119', 'Cessna-182', 'Rwanda', SYSTIMESTAMP - INTERVAL '4' HOUR, 'Normal', 'Training flight over Huye');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA17', 'RWA-M17', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '8' HOUR, 'Normal', 'Patrol mission near Akagera');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_ROMEO', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Unidentified UAV over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN17', 'US-203', 'Cessna-172', 'USA', SYSTIMESTAMP - INTERVAL '2' DAY, 'Normal', 'Private flight near Kigali corridor');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF120', 'RDF-120', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '1' HOUR, 'Normal', 'Medical mission over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA18', 'RWA-M18', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '9' HOUR, 'Normal', 'Border patrol near Lake Kivu');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_SIERRA', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected near Lake Muhazi');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN18', 'FR-506', 'Airbus-A320', 'France', SYSTIMESTAMP - INTERVAL '4' DAY, 'Normal', 'International flight Kigali–Paris');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF121', 'RDF-121', 'Cessna-182', 'Rwanda', SYSTIMESTAMP - INTERVAL '3' HOUR, 'Normal', 'Training flight over Nyamagabe');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA19', 'RWA-M19', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '10' HOUR, 'Normal', 'Patrol mission near Akagera');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_TANGO', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Unidentified UAV over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN19', 'US-204', 'Cessna-172', 'USA', SYSTIMESTAMP - INTERVAL '3' DAY, 'Normal', 'Private flight near Kigali corridor');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF122', 'RDF-122', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '2' HOUR, 'Normal', 'Medical mission over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA20', 'RWA-M20', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '11' HOUR, 'Normal', 'Border patrol near Lake Kivu');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_UNIFORM', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected near Southern Province');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN20', 'FR-507', 'Airbus-A320', 'France', SYSTIMESTAMP - INTERVAL '5' DAY, 'Normal', 'International flight Kigali–Paris');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_NOVEMBER', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected near Northern Province');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN13', 'KE-103', 'Cessna-172', 'Kenya', SYSTIMESTAMP - INTERVAL '1' DAY, 'Normal', 'Private flight near Rwanda–Kenya border');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF116', 'RDF-116', 'Cessna-182', 'Rwanda', SYSTIMESTAMP - INTERVAL '2' HOUR, 'Normal', 'Training over Musanze');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA14', 'RWA-M14', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '6' HOUR, 'Normal', 'Air patrol near Nyungwe');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_OSCAR', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Unidentified UAV over Kigali');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN14', 'UG-205', 'Cessna-172', 'Uganda', SYSTIMESTAMP - INTERVAL '2' DAY, 'Normal', 'Flight near Kigali corridor');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF117', 'RDF-117', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '3' HOUR, 'Normal', 'Medical mission near Huye');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA15', 'RWA-M15', 'Helicopter', 'Rwanda', SYSTIMESTAMP - INTERVAL '5' HOUR, 'Normal', 'Border security patrol');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_PAPA', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected near Akagera');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN15', 'TZ-302', 'Cessna-172', 'Tanzania', SYSTIMESTAMP - INTERVAL '1' DAY, 'Normal', 'Private flight near Rwanda–Tanzania border');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'RDF118', 'RDF-118', 'Cessna-172', 'Rwanda', SYSTIMESTAMP - INTERVAL '2' HOUR, 'Normal', 'Training over Musanze region');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'MIL_RWA16', 'RWA-M16', 'Fighter Jet', 'Rwanda', SYSTIMESTAMP - INTERVAL '7' HOUR, 'Normal', 'Air patrol near Lake Kivu');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'UAV_QUEBEC', NULL, 'UAV', 'Unknown', NULL, 'Suspicious', 'Drone detected over Southern Province');

INSERT INTO AIRCRAFT(aircraft_id, callsign, reg_number, aircraft_type, owner_country, last_seen, status, note)
VALUES (seq_aircraft.NEXTVAL, 'FOREIGN16', 'FR-505', 'Airbus-A320', 'France', SYSTIMESTAMP - INTERVAL '3' DAY, 'Normal', 'International flight Kigali–Paris');

commit;