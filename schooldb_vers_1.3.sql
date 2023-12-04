-- email
CREATE TABLE email (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email_address VARCHAR(100),
 CONSTRAINT PK_email PRIMARY KEY (id)
);

-- instrument
CREATE TYPE instrument_type_enum AS ENUM (
  'piano', 'guitar', 'violin', 'trumpet', 'flute', 'drums', 'saxophone', 'clarinet', 'bass', 'cello'
);

CREATE TABLE instrument (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  instrument_type instrument_type_enum NOT NULL,
  CONSTRAINT PK_instrument PRIMARY KEY (id)
);

-- instrument_catalogue
CREATE TYPE instrument_catalogue_type_enum AS ENUM (
  'piano', 'guitar', 'violin', 'trumpet', 'flute', 'drums', 'saxophone', 'clarinet', 'bass', 'cello'
);

CREATE TABLE instrument_catalogue (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_brand VARCHAR(100),
 instrument_catalogue_type instrument_catalogue_type_enum,
 rental_price INT NOT NULL,
 CONSTRAINT PK_instrument_catalogue PRIMARY KEY (id)
);

-- lesson_combination
CREATE TYPE skill_level_enum AS ENUM ('beginner', 'intermediate', 'advanced');
CREATE TYPE lesson_type_enum AS ENUM ('individual', 'group', 'ensemble');

CREATE TABLE lesson_combination (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  skill_level skill_level_enum NOT NULL,
  lesson_type lesson_type_enum NOT NULL,
  CONSTRAINT PK_lesson_combination PRIMARY KEY (id)
);

-- person
CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100),
 person_nr VARCHAR(100) UNIQUE NOT NULL,
 street VARCHAR(100) NOT NULL,
 zip_code INT NOT NULL,
 city VARCHAR(100),
 CONSTRAINT PK_person PRIMARY KEY (id)
);

-- person_email
CREATE TABLE person_email (
 person_id INT NOT NULL,
 email_id INT NOT NULL,
 CONSTRAINT PK_person_email PRIMARY KEY (person_id, email_id),
 CONSTRAINT FK_person_email_0 FOREIGN KEY (person_id) REFERENCES person (id),
 CONSTRAINT FK_person_email_1 FOREIGN KEY (email_id) REFERENCES email (id)
);

-- phone
CREATE TABLE phone (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_nr VARCHAR(100) NOT NULL,
 CONSTRAINT PK_phone PRIMARY KEY (id)
);

-- pricing_scheme
CREATE TABLE pricing_scheme (
 lesson_price INT NOT NULL,
 lesson_combination_id INT NOT NULL,
 CONSTRAINT PK_pricing_scheme PRIMARY KEY (lesson_combination_id),
 CONSTRAINT FK_pricing_scheme_0 FOREIGN KEY (lesson_combination_id) REFERENCES lesson_combination (id)
);

-- student_capacity
CREATE TABLE student_capacity (
 lesson_combination_id INT NOT NULL,
 min_student INT NOT NULL,
 max_student INT NOT NULL,
 CONSTRAINT PK_student_capacity PRIMARY KEY (lesson_combination_id),
 CONSTRAINT FK_student_capacity_0 FOREIGN KEY (lesson_combination_id) REFERENCES lesson_combination (id)
);

-- contact_person
CREATE TABLE contact_person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 relation VARCHAR(100),
 person_id INT NOT NULL,
 CONSTRAINT PK_contact_person PRIMARY KEY (id),
 CONSTRAINT FK_contact_person_0 FOREIGN KEY (person_id) REFERENCES person (id)
);

-- instructor
CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 teach_ensemble BOOLEAN NOT NULL,
 person_id INT NOT NULL,
 CONSTRAINT PK_instructor PRIMARY KEY (id),
 CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id)
);

-- instructor_instrument
CREATE TABLE instructor_instrument (
 instructor_id INT NOT NULL,
 instrument_id INT NOT NULL,
 CONSTRAINT PK_instructor_instrument PRIMARY KEY (instructor_id, instrument_id),
 CONSTRAINT FK_instructor_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id),
 CONSTRAINT FK_instructor_instrument_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id)
);

-- lesson_schedule
CREATE TABLE lesson_schedule (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 class_room_id INT NOT NULL,
 start_time TIMESTAMP(6) NOT NULL,
 end_time TIMESTAMP(6),
 instructor_id INT,
 lesson_combination_id INT NOT NULL,
 CONSTRAINT PK_lesson_schedule PRIMARY KEY (id),
 CONSTRAINT FK_lesson_schedule_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id),
 CONSTRAINT FK_lesson_schedule_2 FOREIGN KEY (lesson_combination_id) REFERENCES lesson_combination (id)
);

-- lesson_genre
CREATE TYPE genre_type_enum AS ENUM ('rock', 'jazz', 'classical', 'pop');

CREATE TABLE lesson_genre (
  lesson_combination_id INT NOT NULL,
  genre_type genre_type_enum NOT NULL,
  CONSTRAINT PK_lesson_genre PRIMARY KEY (lesson_combination_id),
  CONSTRAINT FK_lesson_genre_lesson_combination FOREIGN KEY (lesson_combination_id) REFERENCES lesson_combination (id)
);

-- person_phone
CREATE TABLE person_phone (
 person_id INT NOT NULL,
 phone_id INT NOT NULL,
 CONSTRAINT PK_person_phone PRIMARY KEY (person_id, phone_id),
 CONSTRAINT FK_person_phone_0 FOREIGN KEY (person_id) REFERENCES person (id),
 CONSTRAINT FK_person_phone_1 FOREIGN KEY (phone_id) REFERENCES phone (id)
);

-- student
CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 sibling_id INT,
 person_id INT NOT NULL,
 contact_person_id INT,
 CONSTRAINT PK_student PRIMARY KEY (id),
 CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id),
 CONSTRAINT FK_student_1 FOREIGN KEY (contact_person_id) REFERENCES contact_person (id)
);

-- student_instrument
CREATE TABLE student_instrument (
 student_id INT NOT NULL,
 instrument_id INT NOT NULL,
 CONSTRAINT PK_student_instrument PRIMARY KEY (student_id, instrument_id),
 CONSTRAINT FK_student_instrument_0 FOREIGN KEY (student_id) REFERENCES student (id),
 CONSTRAINT FK_student_instrument_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id)
);

-- student_instrumental_rental
CREATE TABLE student_instrument_rental (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 expired_rental_period TIMESTAMP(6) NOT NULL,
 instrument_catalogue_id INT NOT NULL,
 student_id INT NOT NULL,
 CONSTRAINT PK_student_instrument_rental PRIMARY KEY (id),
 CONSTRAINT FK_student_instrument_rental_0 FOREIGN KEY (instrument_catalogue_id) REFERENCES instrument_catalogue (id),
 CONSTRAINT FK_student_instrument_rental_1 FOREIGN KEY (student_id) REFERENCES student (id)
);

-- booking
CREATE TABLE booking (
 student_id INT NOT NULL,
 lesson_schedule_id INT NOT NULL,
 instrument_id INT NOT NULL,
 CONSTRAINT PK_booking PRIMARY KEY (student_id, lesson_schedule_id, instrument_id),
 CONSTRAINT FK_booking_0 FOREIGN KEY (student_id) REFERENCES student (id),
 CONSTRAINT FK_booking_1 FOREIGN KEY (lesson_schedule_id) REFERENCES lesson_schedule (id),
 CONSTRAINT FK_booking_2 FOREIGN KEY (instrument_id) REFERENCES instrument (id)
);