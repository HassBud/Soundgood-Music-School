-- Add 17 persons
INSERT INTO person (first_name, last_name, person_nr, street, zip_code, city)
VALUES
-- Contact person
  ('Michael', 'Johnson', '1234567890', '123 Main St', 12345, 'Springfield'), -- Contact person = Emily and Daniel
  ('Ava', 'Williams', '6789012345', '890 Cedar St', 34567, 'Greenfield'), -- Contact person = Sophia
  ('Johanna', 'Danielson', '8783712648', '789 Birch St', 23456, 'Sunset City'), -- Contact person = William
  ('Avery', 'Lopez', '6667788990', '777 Maple St', 67890, 'Maple City'), -- Additional person, contact person = Ella and Jackson
-- Student
  ('Emily', 'Smith', '2345678901', '123 Main St', 12345, 'Springfield'), -- Shares address with Michael and Liam, sibling Daniel and Liam
  ('Daniel', 'Miller', '3456789012', '789 Pine St', 54321, 'Meadowville'), -- Sibling = Emily and Liam
  ('Sophia', 'Brown', '4567890123', '789 Elm St', 54321, 'Meadowville'),
  ('William', 'Davis', '5678901234', '789 Birch St', 23456, 'Sunset City'),
  ('Liam', 'Anderson', '2345078901', '123 Main St', 12345, 'Springfield'), -- Additional person, , shares adress with Michael and Emily, sibling = Emily and Daniel, contact person = Michael
  ('Ella', 'Wilson', '2223344556', '333 Pine St', 23456, 'Pinewood'), -- Additional person, sibling = Jackson
  ('Jackson', 'Martinez', '3334455667', '444 Cedar St', 34567, 'Cedar City'), -- Additional person, sibling = Ella
  ('Aria', 'Baker', '8889900112', '999 Pine St', 89012, 'Pineville'), -- Additional person
-- Instructors 
  ('Oliver', 'Thomas', '7890123456', '901 Maple St', 45678, 'Maplewood'),
  ('Isabella', 'Clark', '8901234567', '901 Maple St', 45678, 'Maplewood'), -- Shares address with Oliver
  ('Sophie', 'Taylor', '4445566778', '555 Elm St', 45678, 'Elmwood'), -- Additional person
  ('Benjamin', 'Hernandez', '5556677889', '666 Birch St', 56789, 'Birchville'), -- Additional person
  ('Lucas', 'Hill', '7778899001', '888 Oak St', 78901, 'Oaksville'); -- Additional person, ALSO contact person = Aria

-- Add 5 contact persons for students
INSERT INTO contact_person (relation, person_id)
VALUES
  ('parent', 1), -- Michael
  ('aunt', 2), -- Ava
  ('grandma', 3), -- Johanna
  ('mother', 4), -- Avery
  ('uncle', 17); -- Lucas

-- Add 8 students
INSERT INTO student (sibling_id, person_id, contact_person_id)
VALUES
  (1001, 5, 1), -- Emily
  (1001, 6, 1), -- Daniel
  (NULL, 7, 2), -- Sophia
  (NULL, 8, 3), -- William
  (1001, 9, 1), -- Liam
  (1002, 10, 4), -- Ella
  (1002, 11, 4), -- Jackson
  (NULL, 12, 5); -- Aria

-- Add 5 instructors
INSERT INTO instructor (teach_ensemble, person_id)
VALUES
  (FALSE, 13),  -- Oliver does not teach ensemble
  (TRUE, 14), -- Isabella teaches ensemble
  (FALSE, 15),  -- Sophie does not teach ensemble
  (TRUE, 16), -- Benjamin teaches ensemble
  (TRUE, 14); -- Lucas teaches ensemble

-- Add 10 phone numbers (may be shared)
INSERT INTO phone (phone_nr)
VALUES
  ('123-456-7890'), -- Michael (1), Emily (5), Daniel (6), Liam (9)
  ('987-654-3210'), -- Michael (1)
  ('555-123-4567'), -- Ava (2), Sophia (7)
  ('111-222-3333'), -- Johanna (3)
  ('444-555-6666'), -- William (8)
  ('777-888-9999'), -- Oliver (13), Isabella (14)
  ('111-222-3334'), -- Avery (4), Ella (10), Jackson (11)
  ('999-888-7777'), -- Aria (12), Lucas (17)
  ('444-444-5555'), -- Sophie (15), Benjamin (16)
  ('555-555-7777'); -- Benjamin (16)

INSERT INTO person_phone (person_id, phone_id)
VALUES
  (1, 1),
  (5, 1),
  (6, 1),
  (9, 1),
  (1, 2),
  (2, 3),
  (7, 3),
  (3, 4),
  (8, 5),
  (13, 6),
  (14, 6),
  (4, 7),
  (10, 7),
  (11, 7),
  (12, 8),
  (17, 8),
  (15, 9),
  (16, 9),
  (16, 10);

-- Add 8 email addresses (may be shared)
INSERT INTO email (email_address)
VALUES
  ('lion@example.com'),
  ('elephant@example.com'),
  ('pizza_lover@example.com'),
  ('sushi_master@example.com'),
  ('guitar_player@example.com'),
  ('traveler@example.com'),
  ('chocolate_lover@example.com'),
  ('bookworm@example.com');

INSERT INTO person_email(person_id, email_id )
  VALUES 
  (1,1),
  (4,1),
  (10,2),
  (8,3),
  (12,4),
  (13,5),
  (14,5),
  (3,6),
  (6,7),
  (15,8),
  (16,8);

-- Add 16 different instruments
INSERT INTO instrument (instrument_type)
VALUES
  ('drums'), -- 1
  ('violin'), -- 2
  ('piano'), -- 3
  ('guitar'), -- 4
  ('saxophone'), -- 5
  ('flute'), -- 6
  ('trumpet'), -- 7
  ('clarinet'), -- 8
  ('violin'), -- 9
  ('guitar'), -- 10
  ('saxophone'), -- 11
  ('flute'), -- 12
  ('piano'), -- 13
  ('drums'), -- 14
  ('clarinet'), -- 15
  ('trumpet'); -- 16

-- Add instrument type to instructor
INSERT INTO instructor_instrument (instructor_id, instrument_id)
VALUES
  (1, 3), -- Oliver
  (1, 5),
  (1, 10),
  (1, 14),
  (1, 9),
  (1, 4),
  (1, 12),
  (1, 6),
  (1, 1),
  (1, 11),
  (1, 2),
  (1, 7),
  (2, 3), -- Isabella
  (2, 5),
  (2, 10),
  (2, 14),
  (2, 9),
  (2, 4),
  (2, 12),
  (2, 6),
  (2, 1),
  (2, 16),
  (2, 2),
  (2, 7),
  (3, 8), -- Sophie
  (3, 11),
  (3, 6),
  (3, 15),
  (4, 1), -- Benjamin
  (4, 2),
  (4, 3),
  (4, 4),
  (4, 5),
  (5, 6), -- Lucas
  (5, 7),
  (5, 8),
  (5, 9),
  (5, 10),
  (5, 11),
  (5, 12);

-- Add instrument type to student
INSERT INTO student_instrument (student_id, instrument_id)
VALUES
  (1, 3),   -- Emily plays piano
  (1, 6),   -- Emily plays flute
  (1, 8),  -- Emily also plays clarinet
  (2, 11),  -- Daniel plays saxophone
  (2, 8),  -- Daniel plays clarinet
  (3, 7),   -- Sophia plays trumpet
  (3, 4),   -- Sophia plays guitar
  (3, 2),   -- Sophia also plays violin
  (4, 1),  -- William plays drums
  (4, 4),   -- William also plays guitar
  (4, 2),   -- William also plays violin
  (5, 14),   -- Liam plays drums
  (5, 11),   -- Liam also plays saxophone
  (6, 11),   -- Ella plays saxophone
  (6, 4),   -- Ella also plays guitar
  (7, 2),  -- Jackson plays violin
  (7, 6),  -- Jackson also plays flute
  (8, 1),  -- Aria plays drums
  (8, 3),   -- Aria also plays piano
  (8, 4);   -- Aria also plays guitar

-- Add 8 different instruments
INSERT INTO instrument_catalogue (instrument_brand, instrument_catalogue_type, rental_price)
VALUES
  ('HarmonySounds', 'drums', 100),
  ('MelodyCraft', 'violin', 150),
  ('RhythmHarbor', 'piano', 120),
  ('SonicStrings', 'guitar', 130),
  ('VirtuosoVibes', 'flute', 140),
  ('TrumpetTunes', 'trumpet', 160),
  ('NoteMasters', 'drums', 120),
  ('StringsUniverse', 'violin', 130);

-- Add 8 expired rental periods
INSERT INTO student_instrument_rental (expired_rental_period, instrument_catalogue_id, student_id)
VALUES
  ('2023-12-01 12:00:00',1,1), -- Instr id: drums, student: Emily
  ('2023-11-15 10:30:00',3,1), -- instr id: piano, student: Emily
  ('2023-10-20 15:45:00',4,4), -- instr id: guitar, student: William
  ('2023-08-12 14:15:00',5,2), -- instr id: flute, student: Daniel
  ('2023-07-25 09:40:00',2,2), -- instr id: violin, student: Daniel
  ('2023-09-05 11:20:00',6,8), -- instr id: trumpet, student: Aria
  ('2023-09-05 11:20:00',7,8), -- instr id: drums, student: Aria
  ('2023-09-05 11:20:00',8,7); -- instr id: violin, student: Jackson

-- Add different lesson combinations
INSERT INTO lesson_combination (skill_level, lesson_type)
VALUES
  ('beginner', 'individual'),
  ('beginner', 'group'),
  ('beginner', 'ensemble'),
  ('intermediate', 'individual'),
  ('intermediate', 'group'),
  ('intermediate', 'ensemble'),
  ('advanced', 'individual'),
  ('advanced', 'group'),
  ('advanced', 'ensemble');

-- Add prices to lesson combinations (same price for beginner and intermediate)
INSERT INTO pricing_scheme (lesson_combination_id, lesson_price)
  VALUES
  (1, 200),
  (2, 150),
  (3, 150),
  (4, 200),
  (5, 150),
  (6, 150),
  (7, 300),
  (8, 255),
  (9, 270);

-- Add min and max number of students for lesson combinations
INSERT INTO student_capacity(lesson_combination_id, min_student, max_student)
VALUES
  (1, 1, 1), -- 1: Individual
  (2, 2, 6), -- 2: Group
  (3, 3, 10), -- 3: Ensemble
  (4, 1, 1), -- 4: Individual
  (5, 2, 6), -- 5: Group
  (6, 3, 10), -- 6: Ensemble
  (7, 1, 1), -- 7: Individual
  (8, 2, 6), -- 8: Group
  (9, 3, 10); -- 9: Ensemble

-- Update student_capacity for lesson combination 3 (ensemble) to see option "1 Seat" in the table
-- UPDATE student_capacity
-- SET max_student = 5
-- WHERE lesson_combination_id = 3;

-- Add data for lessons
INSERT INTO lesson_schedule (class_room_id, start_time, end_time, instructor_id, lesson_combination_id)
VALUES
  (101, '2023-12-01 09:00:00', '2023-12-01 11:00:00', 1, 1), -- 1: Oliver, Individual
  (102, '2023-12-02 10:30:00', '2023-12-02 13:30:00', 2, 7), -- 2: Isabella, Individual
  (103, '2023-12-03 13:45:00', '2023-12-03 14:45:00', 1, 4), -- 3: Oliver, Individual
  (104, '2023-12-04 15:30:00', '2023-12-04 17:30:00', 2, 3), -- 4: Isabella, Ensemble
  (101, '2023-12-05 11:15:00', '2023-12-05 14:15:00', 2, 6), -- 5: Isabella, Ensemble
  (105, '2023-11-20 10:00:00', '2023-11-20 12:00:00', 3, 7), -- 6: Sophie, Individual
  (106, '2023-11-21 15:30:00', '2023-11-21 17:30:00', 4, 8), -- 7: Benjamin, Group
  (107, '2023-11-22 14:45:00', '2023-11-22 15:45:00', 5, 9), -- 8: Lucas, Ensemble
  (105, '2023-11-23 16:30:00', '2023-11-23 18:30:00', 3, 4), -- 9: Sophie, Individual
  (106, '2023-11-25 11:15:00', '2023-11-25 14:15:00', 4, 9), -- 10: Benjamin, Ensemble
  (107, '2023-12-12 13:00:00', '2023-12-12 15:00:00', 5, 2); -- 11: Lucas, Group

-- Add bookings
INSERT INTO booking (student_id, lesson_schedule_id, instrument_id)
VALUES
  (3, 1, 2),    -- Sophia (3) books individual lesson with violin

  (7, 2, 6),    -- Jackson (7) books individual lesson with flute

  (5, 3, 11),    -- Liam (5) books individual lesson with saxophone

  (6, 4, 11),    -- Ella (6) books ensemble with saxophone
  (4, 4, 4),    -- William (4) books ensemble with guitar
  (2, 4, 8),   -- Daniel (2) books ensemble with clarinet
  (7, 4, 6),    -- Jackson (7) books ensemble with flute

  (5, 5, 11),    -- Liam (5) books ensemble with saxophone
  (6, 5, 4),    -- Ella (6) books ensemble with guitar
  (8, 5, 3),    -- Aria (8) books ensemble with piano

  (5, 6, 11),    -- Liam (5) books individual lesson with saxophone

  (6, 7, 4),   -- Ella (6) books group lesson with guitar
  (4, 7, 4),   -- William (4) books group lesson with guitar
  (8, 7, 4),   -- Aria (8) books group with guitar

  (8, 8, 1),    -- Aria (8) books ensemble with drums
  (1, 8, 6),    -- Emily (1) books ensemble with flute
  (3, 8, 2),    -- Sophia (3) books ensemble with violin
  (4, 8, 4),    -- William (4) books ensemble with guitar

  (1, 9, 6),    -- Emily (1) books individual lesson with flute

  (2, 10, 8),   -- Daniel (2) books ensemble with clarinet
  (3, 10, 2),   -- Sophia (3) books ensemble with violin
  (7, 10, 2),   -- Jackson (7) books ensemble with violin
  (8, 10, 4),   -- Aria (8) books ensemble with guitar

  (6, 11, 4),   -- Ella (6) books group lesson with guitar
  (4, 11, 4),   -- William (4) books group lesson with guitar
  (8, 11, 4);   -- Aria (8) books group with guitar

-- Add genre for ensembles
INSERT INTO lesson_genre (lesson_combination_id, genre_type)
VALUES
  (3, 'rock'),
  (6, 'jazz'),
  (9, 'classical');