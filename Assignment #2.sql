--Assignment #2
create table mental_illness(
    age integer,
    country varchar,
    mass integer,
    family_history BOOLEAN,
    social_skills BOOLEAN,
    medication BOOLEAN,
    illness_type varchar
);

create table treatment(
    therapy Boolean,
    therapy_type varchar,
    medication Boolean,
    medication_type varchar,
    medication_amount integer,
    prescription_id integer, 
    hospitalization BOOLEAN,
    treatment_institution BOOLEAN
);

creat table doctor(
    instituion_id integer,
    education_type varchar,
    method_of_treatment varchar,
    certification_id integer,
    years_at_institution integer,
    age integer,
    doctor_type varchar
); 

select * from mental_illness
natural join treatment
NATURAL join doctor; 

