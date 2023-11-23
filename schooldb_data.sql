-- Add 4 email addresses (may be shared)
INSERT INTO email (email_adress)
VALUES
  ('lion@example.com'),
  ('elephant@example.com'),
  ('pizza_lover@example.com'),
  ('sushi_master@example.com');


  -- Add 16 different instruments
INSERT INTO instrument (instrument_type)
VALUES
  ('Drums'),
  ('Violin'),
  ('Piano'),
  ('Guitar'),
  ('Saxophone'),
  ('Flute'),
  ('Trumpet'),
  ('Clarinet'),
  ('Violin'),
  ('Guitar'),
  ('Saxophone'),
  ('Flute'),
  ('Piano'),
  ('Drums'),
  ('Clarinet'),
  ('Trumpet');


 -- Add 8 different instruments
INSERT INTO instrument_catalogue (instrument_brand, intrument_type, rental_price)
VALUES
  ('HarmonySounds', 'Drums', '100'),
  ('MelodyCraft', 'Violin', '150'),
  ('RhythmHarbor', 'Piano', '120'),
  ('SonicStrings', 'Guitar', '130'),
  ('VirtuosoVibes', 'Flute', '140'),
  ('TrumpetTunes', 'Trumpet', '160'),
  ('NoteMasters', 'Drums', '120'),
  ('StringsUniverse', 'Violin', '130');


-- Add 8 persons
INSERT INTO person (first_name, last_name, person_nr, street, zip_code, city)
VALUES
  ('Michael', 'Johnson', '1234567890', '123 Main St', '12345', 'Springfield'),
  ('Emily', 'Smith', '2345678901', '123 Main St', '12345', 'Springfield'), -- Shares address with Michael
  ('Daniel', 'Miller', '3456789012', '789 Pine St', '54321', 'Meadowville'),
  ('Sophia', 'Brown', '4567890123', '789 Elm St', '54321', 'Meadowville'),
  ('William', 'Davis', '5678901234', '789 Birch St', '23456', 'Sunset City'),
  ('Ava', 'Williams', '6789012345', '890 Cedar St', '34567', 'Greenfield'),
  ('Oliver', 'Thomas', '7890123456', '901 Maple St', '45678', 'Maplewood'),
  ('Isabella', 'Clark', '8901234567', '901 Maple St', '45678', 'Maplewood'); -- Shares address with Oliver


-- Add 6 phone numbers (may be shared)
INSERT INTO phone (phone_nr)
VALUES
  ('123-456-7890'),
  ('987-654-3210'),
  ('555-123-4567'),
  ('111-222-3333'),
  ('444-555-6666'),
  ('777-888-9999');


    -- Add prices for different lessons
INSERT INTO pricing_scheme (skill_level, lesson_type, lesson_price)
VALUES
  ('Beginner', 'Private', '50'),
  ('Beginner', 'Group', '40'),
  ('Beginner', 'Ensemble', '30'),
  ('Intermediate', 'Private', '100'),
  ('Intermediate', 'Group', '90'),
  ('Intermediate', 'Ensemble', '80'),
  ('Advanced', 'Private', '160'),
  ('Advanced', 'Group', '135'),
  ('Advanced', 'Ensemble', '115');


  -- Add 4 contact persons for students NOT ADDED
INSERT INTO contact_person (relation)
VALUES
  ('Parent'),
  ('Parent'),
  ('Grandma'),
  ('Uncle');


  -- Add 4 instructors
INSERT INTO instructor (teach_ensemble)
VALUES
  (TRUE),  -- Instructor teaches ensemble
  (FALSE), -- Instructor does not teach ensemble
  (TRUE),
  (FALSE);


  -- Add data for lessons NOT ADDED
INSERT INTO lesson_schedule (class_room_id, date_and_time, min_student, max_student)
VALUES
  ('101', '2023-12-01 09:00:00', '2', '5'),
  ('102', '2023-12-02 10:30:00', '3', '8'),
  ('103', '2023-12-03 13:45:00', '1', '4'),
  ('104', '2023-12-04 15:30:00', '2', '6'),
  ('101', '2023-12-05 11:15:00', '3', '7'),
  ('102', '2023-12-06 14:00:00', '2', '5'),
  ('103', '2023-12-07 12:45:00', '1', '4'),
  ('104', '2023-12-08 09:30:00', '3', '8');


  -- Add 4 sibling id:s (may be shared) NOT ADDED
INSERT INTO student (sibling_id)
VALUES
  ('1001'), -- Sibling pair 1
  ('1001'), -- Sibling pair 1
  ('2002'), -- Sibling pair 2
  ('2002'); -- Sibling pair 2


  -- Add 6 expired rental periods NOT ADDED
INSERT INTO student_instrument_rental (expired_rental_period)
VALUES
  ('2023-12-01 12:00:00'),
  ('2023-11-15 10:30:00'),
  ('2023-10-20 15:45:00'),
  ('2023-09-05 08:20:00'),
  ('2023-08-12 14:15:00'),
  ('2023-07-25 09:40:00');