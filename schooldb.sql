-- email
CREATE TABLE email (
 id SERIAL NOT NULL,
 email_adress VARCHAR(100)
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (id);


-- instrument
CREATE TABLE instrument (
 id SERIAL NOT NULL,
 instrument_type VARCHAR(100) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);


-- instrument_catalogue
CREATE TABLE instrument_catalogue (
 id SERIAL NOT NULL,
 instrument_brand VARCHAR(100),
 intrument_type VARCHAR(100),
 rental_price  VARCHAR(100) NOT NULL
);

ALTER TABLE instrument_catalogue ADD CONSTRAINT PK_instrument_catalogue PRIMARY KEY (id);


-- person
CREATE TABLE person (
 id SERIAL NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100),
 person_nr VARCHAR(50) NOT NULL,
 street VARCHAR(100) NOT NULL,
 zip_code VARCHAR(100) NOT NULL,
 city VARCHAR(100)
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


-- person_email
CREATE TABLE person_email (
 person_id SERIAL NOT NULL,
 email_id SERIAL NOT NULL
);

ALTER TABLE person_email ADD CONSTRAINT PK_person_email PRIMARY KEY (person_id,email_id);


-- phone
CREATE TABLE phone (
 id SERIAL NOT NULL,
 phone_nr  VARCHAR(100) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (id);


-- pricing_scheme
CREATE TABLE pricing_scheme (
 id SERIAL NOT NULL,
 skill_level VARCHAR(100) NOT NULL,
 lesson_type VARCHAR(100) NOT NULL,
 lesson_price VARCHAR(100) NOT NULL
);

ALTER TABLE pricing_scheme ADD CONSTRAINT PK_pricing_scheme PRIMARY KEY (id);


-- contact_person
CREATE TABLE contact_person (
 id SERIAL NOT NULL,
 relation VARCHAR(100),
 person_id SERIAL NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (id);


-- instructor
CREATE TABLE instructor (
 id SERIAL NOT NULL,
 teach_ensemble BOOLEAN NOT NULL,
 person_id SERIAL NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


-- instructor_instrument
CREATE TABLE instructor_instrument (
 instructor_id SERIAL NOT NULL,
 instrument_id SERIAL NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instructor_id,instrument_id);


-- lesson_schedule
CREATE TABLE lesson_schedule (
 id SERIAL NOT NULL,
 class_room_id VARCHAR(100) NOT NULL,
 date_and_time TIMESTAMP(6) NOT NULL,
 min_student VARCHAR(100) NOT NULL,
 max_student VARCHAR(10) NOT NULL,
 intrument_type_id SERIAL,
 pricing_scheme_id SERIAL NOT NULL,
 instructor_id SERIAL
);

ALTER TABLE lesson_schedule ADD CONSTRAINT PK_lesson_schedule PRIMARY KEY (id);


-- person_phone
CREATE TABLE person_phone (
 person_id SERIAL NOT NULL,
 phone_id SERIAL NOT NULL
);

ALTER TABLE person_phone ADD CONSTRAINT PK_person_phone PRIMARY KEY (person_id,phone_id);

-- student
CREATE TABLE student (
 id SERIAL NOT NULL,
 sibling_id VARCHAR(100),
 person_id SERIAL NOT NULL,
 contact_person_id SERIAL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


-- student_instrument
CREATE TABLE student_instrument (
 studentID SERIAL NOT NULL,
 instrument_id SERIAL NOT NULL
);

ALTER TABLE student_instrument ADD CONSTRAINT PK_student_instrument PRIMARY KEY (studentID,instrument_id);


-- student_instrument_rental
CREATE TABLE student_instrument_rental (
 id SERIAL NOT NULL,
 expired_rental_period TIMESTAMP(6) NOT NULL,
 instrument_catalogue_id SERIAL NOT NULL,
 student_id SERIAL NOT NULL
);

ALTER TABLE student_instrument_rental ADD CONSTRAINT PK_student_instrument_rental PRIMARY KEY (id);


-- booking
CREATE TABLE booking (
 student_id SERIAL NOT NULL,
 lesson_schedule_id SERIAL NOT NULL
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (student_id, lesson_schedule_id);


-- person_email foreign key constraints
ALTER TABLE person_email 
ADD CONSTRAINT FK_person_email_person FOREIGN KEY (person_id) REFERENCES person (id),
ADD CONSTRAINT FK_person_email_email FOREIGN KEY (email_id) REFERENCES email (id);

-- contact_person foreign key constraint
ALTER TABLE contact_person 
ADD CONSTRAINT FK_contact_person_person FOREIGN KEY (person_id) REFERENCES person (id);

-- instructor foreign key constraint
ALTER TABLE instructor 
ADD CONSTRAINT FK_instructor_person FOREIGN KEY (person_id) REFERENCES person (id);

-- instructor_instrument foreign key constraints
ALTER TABLE instructor_instrument 
ADD CONSTRAINT FK_instructor_instrument_instructor FOREIGN KEY (instructor_id) REFERENCES instructor (id),
ADD CONSTRAINT FK_instructor_instrument_instrument FOREIGN KEY (instrument_id) REFERENCES instrument (id);

-- lesson_schedule foreign key constraints
ALTER TABLE lesson_schedule 
ADD CONSTRAINT FK_lesson_schedule_instrument FOREIGN KEY (intrument_type_id) REFERENCES instrument (id),
ADD CONSTRAINT FK_lesson_schedule_pricing_scheme FOREIGN KEY (pricing_scheme_id) REFERENCES pricing_scheme (id),
ADD CONSTRAINT FK_lesson_schedule_instructor FOREIGN KEY (instructor_id) REFERENCES instructor (id);

-- person_phone foreign key constraints
ALTER TABLE person_phone 
ADD CONSTRAINT FK_person_phone_person FOREIGN KEY (person_id) REFERENCES person (id),
ADD CONSTRAINT FK_person_phone_phone FOREIGN KEY (phone_id) REFERENCES phone (id);

-- student foreign key constraints
ALTER TABLE student 
ADD CONSTRAINT FK_student_person FOREIGN KEY (person_id) REFERENCES person (id),
ADD CONSTRAINT FK_student_contact_person FOREIGN KEY (contact_person_id) REFERENCES contact_person (id);

-- student_instrument foreign key constraints
ALTER TABLE student_instrument 
ADD CONSTRAINT FK_student_instrument_student FOREIGN KEY (studentID) REFERENCES student (id),
ADD CONSTRAINT FK_student_instrument_instrument FOREIGN KEY (instrument_id) REFERENCES instrument (id);

-- student_instrument_rental foreign key constraints
ALTER TABLE student_instrument_rental 
ADD CONSTRAINT FK_student_instrument_rental_instrument_catalogue FOREIGN KEY (instrument_catalogue_id) REFERENCES instrument_catalogue (id),
ADD CONSTRAINT FK_student_instrument_rental_student FOREIGN KEY (student_id) REFERENCES student (id);

-- booking foreign key constraints
ALTER TABLE booking 
ADD CONSTRAINT FK_booking_student FOREIGN KEY (student_id) REFERENCES student (id),
ADD CONSTRAINT FK_booking_lesson_schedule FOREIGN KEY (lesson_schedule_id) REFERENCES lesson_schedule (id);