    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

/*user_sequence creating */
CREATE SEQUENCE IF NOT EXISTS public."Schedule_User_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1
    OWNED BY schedule_user.id;

ALTER SEQUENCE public."Schedule_User_id_seq"
    OWNER TO postgres;

/*schedule_user table creating*/
CREATE TABLE IF NOT EXISTS public.schedule_user
(
    id bigint NOT NULL DEFAULT 'nextval('"Schedule_User_id_seq"'::regclass)',
    login character varying COLLATE pg_catalog."default" NOT NULL,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    role character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Schedule_User_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.schedule_user
    OWNER to postgres;

/*schedule_user table filling*/
INSERT INTO public.schedule_user (login, password, role) VALUES ('GodOfPasta', 'hf,ckflhj', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('Andersen', 'cl0r!de_', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('CkripoK', 'Bl3nder@st', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('Batrider', 'p!ng00sn@', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('cringelord', 'Shy_Fly_', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('notZIO', 'Ubnkth!$**', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('Zhmil17', 'G0!d@Z07', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('login', 'password', 'teacher');
INSERT INTO public.schedule_user (login, password, role) VALUES ('SergeyKrivel', 'y5cnt49x', 'teacher');
INSERT INTO public.schedule_user (login, password, role) VALUES ('OlegKuzmin', 'gt6s64um', 'teacher');
INSERT INTO public.schedule_user (login, password, role) VALUES ('FedorovRoman', '4uawr0wl', 'teacher');
INSERT INTO public.schedule_user (login, password, role) VALUES ('admin', 'dQw4w9WgXcQ', 'admin');

/*student table creating*/
CREATE TABLE IF NOT EXISTS public.student
(
    student_id bigint NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    student_group bigint NOT NULL,
    CONSTRAINT "Student_pkey" PRIMARY KEY (student_id),
    CONSTRAINT "Schedule_User" FOREIGN KEY (student_id)
        REFERENCES public.schedule_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Student_Group" FOREIGN KEY (student_group)
        REFERENCES public.student_group (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.student
    OWNER to postgres;

/*student table filling*/
INSERT INTO public.student(student_id, name, student_group) VALUES (1, 'Гредасов Руслан Сергеевич', 12321);
INSERT INTO public.student(student_id, name, student_group) VALUES (2, 'Подрядчиков Владимир Валерьевич', 12321);
INSERT INTO public.student(student_id, name, student_group) VALUES (3, 'Павлов Данила Сергеевич', 12321);
INSERT INTO public.student(student_id, name, student_group) VALUES (4, 'Округин Никита Анатольевич', 12321);
INSERT INTO public.student(student_id, name, student_group) VALUES (5, 'Бесов Василий Ильич', 22121);
INSERT INTO public.student(student_id, name, student_group) VALUES (6, 'Прядко Дмитро Алексеевич', 22121);
INSERT INTO public.student(student_id, name, student_group) VALUES (7, 'Крипок Фил Владиславович', 22121);

/*student_group table creating*/
CREATE TABLE IF NOT EXISTS public.student_group
(
    id bigint NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Student_Group_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.student_group
    OWNER to postgres;

/*student_group table filling*/
INSERT INTO public.student_group(id, name) VALUES (12321, '2321-ДБ');
INSERT INTO public.student_group(id, name) VALUES (22121, '2121-ДМ');

/*teacher table creating*/
CREATE TABLE IF NOT EXISTS public.teacher
(
    teacher_id bigint NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    degree character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Teacher_pkey" PRIMARY KEY (teacher_id),
    CONSTRAINT "Teacher_id" FOREIGN KEY (teacher_id)
        REFERENCES public.schedule_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.teacher
    OWNER to postgres;

/*teacher table filling*/
INSERT INTO public.teacher(teacher_id, name, degree) VALUES (8, 'Пахомов Дмитрий Вячеславович', 'доцент');
INSERT INTO public.teacher(teacher_id, name, degree) VALUES (9, 'Кривель Сергей Михайлович', 'доцент');
INSERT INTO public.teacher(teacher_id, name, degree) VALUES (10, 'Кузьмин Олег Викторович', 'профессор');
INSERT INTO public.teacher(teacher_id, name, degree) VALUES (11, 'Федоров Роман Константинович', 'доцент');

/*subject table creating*/
CREATE TABLE IF NOT EXISTS public.subject
(
    code character varying COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Subject_pkey" PRIMARY KEY (code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.subject
    OWNER to postgres;

/*subject table filling*/
INSERT INTO public.subject(code, name) VALUES ('Б1.О.29', 'Проектирование информационных систем');
INSERT INTO public.subject(code, name) VALUES ('Б1.В.ДВ.01.01', 'Имитационное моделирование сложных систем');
INSERT INTO public.subject(code, name) VALUES ('Б1.В.01', 'Моделирование процессов управления в технических системах');
INSERT INTO public.subject(code, name) VALUES ('Б1.О.19', 'Дискретная математика');
INSERT INTO public.subject(code, name) VALUES ('Б1.О.24', 'Теория вероятностей и математическая статистика');
INSERT INTO public.subject(code, name) VALUES ('Б1.В.02', 'Методы исследований и обработка информации в экологии и природопользовании');

/*study table creating*/
CREATE TABLE IF NOT EXISTS public.study
(
    subject_code character varying COLLATE pg_catalog."default" NOT NULL,
    student_group_id bigint NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.study
    OWNER to postgres;

/*study table filling*/
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.О.29', 12321);
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.В.ДВ.01.01', 22121);
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.В.01', 22121);
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.О.19', 12321);
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.О.24', 12321);
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.В.02', 22121);

/*taught table creating*/
CREATE TABLE IF NOT EXISTS public.taught
(
    subject_code character varying COLLATE pg_catalog."default" NOT NULL,
    teacher_id bigint NOT NULL,
    CONSTRAINT "Taught_pkey" PRIMARY KEY (subject_code, teacher_id),
    CONSTRAINT "Subject_code" FOREIGN KEY (subject_code)
        REFERENCES public.subject (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Teacher_id" FOREIGN KEY (teacher_id)
        REFERENCES public.teacher (teacher_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.taught
    OWNER to postgres;

/*taught table filling*/
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.О.29', 8);
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.В.ДВ.01.01', 9);
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.В.01', 9);
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.О.19', 10);
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.О.24', 10);
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.В.02', 11);

/*pair table creating*/
CREATE TABLE IF NOT EXISTS public.pair
(
    "number" bigint NOT NULL,
    CONSTRAINT "Pair_pkey" PRIMARY KEY ("number")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pair
    OWNER to postgres;

/*pair table filling*/
INSERT INTO public.pair("number") VALUES (0);
INSERT INTO public.pair("number") VALUES (1);
INSERT INTO public.pair("number") VALUES (2);
INSERT INTO public.pair("number") VALUES (3);
INSERT INTO public.pair("number") VALUES (4);
INSERT INTO public.pair("number") VALUES (5);
INSERT INTO public.pair("number") VALUES (6);

/*room table creating*/
CREATE TABLE IF NOT EXISTS public.room
(
    id bigint NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Room_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.room
    OWNER to postgres;

/*room table filling*/
INSERT INTO public.room(id, name) VALUES (316, '316');
INSERT INTO public.room(id, name) VALUES (1132, '113-б');
INSERT INTO public.room(id, name) VALUES (1131, '113-а');
INSERT INTO public.room(id, name) VALUES (2131, '213-а');
INSERT INTO public.room(id, name) VALUES (322, '322');

/*cell table creating*/
CREATE TABLE IF NOT EXISTS public.cell
(
    "Day" bigint NOT NULL,
    "Student_Group_id" bigint NOT NULL,
    "Subject_Code" character varying COLLATE pg_catalog."default" NOT NULL,
    "Room" bigint NOT NULL,
    "Pair" bigint NOT NULL,
    "Teacher_pk" bigint NOT NULL,
    "Event" text COLLATE pg_catalog."default",
    CONSTRAINT "Pair" FOREIGN KEY ("Pair")
        REFERENCES public.pair ("number") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Room" FOREIGN KEY ("Room")
        REFERENCES public.room (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Student_Group" FOREIGN KEY ("Student_Group_id")
        REFERENCES public.student_group (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Subject_code" FOREIGN KEY ("Subject_Code")
        REFERENCES public.subject (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Teacher" FOREIGN KEY ("Teacher_pk")
        REFERENCES public.teacher (teacher_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cell
=======
/*DB Creating*/
CREATE DATABASE schedule
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

/*schedule_user table creating*/
CREATE TABLE IF NOT EXISTS public.schedule_user
(
    id bigint NOT NULL DEFAULT 'nextval('"Schedule_User_id_seq"'::regclass)',
    login character varying COLLATE pg_catalog."default" NOT NULL,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    role character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Schedule_User_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.schedule_user
    OWNER to postgres;

/*schedule_user table filling*/
INSERT INTO public.schedule_user (login, password, role) VALUES ('GodOfPasta', 'hf,ckflhj', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('Andersen', 'cl0r!de_', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('CkripoK', 'Bl3nder@st', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('Batrider', 'p!ng00sn@', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('cringelord', 'Shy_Fly_', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('notZIO', 'Ubnkth!$**', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('Zhmil17', 'G0!d@Z07', 'student');
INSERT INTO public.schedule_user (login, password, role) VALUES ('login', 'password', 'teacher');
INSERT INTO public.schedule_user (login, password, role) VALUES ('SergeyKrivel', 'y5cnt49x', 'teacher');
INSERT INTO public.schedule_user (login, password, role) VALUES ('OlegKuzmin', 'gt6s64um', 'teacher');
INSERT INTO public.schedule_user (login, password, role) VALUES ('FedorovRoman', '4uawr0wl', 'teacher');
INSERT INTO public.schedule_user (login, password, role) VALUES ('admin', 'dQw4w9WgXcQ', 'admin');

/*student table creating*/
CREATE TABLE IF NOT EXISTS public.student
(
    student_id bigint NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    student_group bigint NOT NULL,
    CONSTRAINT "Student_pkey" PRIMARY KEY (student_id),
    CONSTRAINT "Schedule_User" FOREIGN KEY (student_id)
        REFERENCES public.schedule_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Student_Group" FOREIGN KEY (student_group)
        REFERENCES public.student_group (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.student
    OWNER to postgres;

/*student table filling*/
INSERT INTO public.student(student_id, name, student_group) VALUES (1, 'Гредасов Руслан Сергеевич', 12321);
INSERT INTO public.student(student_id, name, student_group) VALUES (2, 'Подрядчиков Владимир Валерьевич', 12321);
INSERT INTO public.student(student_id, name, student_group) VALUES (3, 'Павлов Данила Сергеевич', 12321);
INSERT INTO public.student(student_id, name, student_group) VALUES (4, 'Округин Никита Анатольевич', 12321);
INSERT INTO public.student(student_id, name, student_group) VALUES (5, 'Бесов Василий Ильич', 22121);
INSERT INTO public.student(student_id, name, student_group) VALUES (6, 'Прядко Дмитро Алексеевич', 22121);
INSERT INTO public.student(student_id, name, student_group) VALUES (7, 'Крипок Фил Владиславович', 22121);

/*student_group table creating*/
CREATE TABLE IF NOT EXISTS public.student_group
(
    id bigint NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Student_Group_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.student_group
    OWNER to postgres;

/*student_group table filling*/
INSERT INTO public.student_group(id, name) VALUES (12321, '2321-ДБ');
INSERT INTO public.student_group(id, name) VALUES (22121, '2121-ДМ');

/*teacher table creating*/
CREATE TABLE IF NOT EXISTS public.teacher
(
    teacher_id bigint NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    degree character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Teacher_pkey" PRIMARY KEY (teacher_id),
    CONSTRAINT "Teacher_id" FOREIGN KEY (teacher_id)
        REFERENCES public.schedule_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.teacher
    OWNER to postgres;

/*teacher table filling*/
INSERT INTO public.teacher(teacher_id, name, degree) VALUES (8, 'Пахомов Дмитрий Вячеславович', 'доцент');
INSERT INTO public.teacher(teacher_id, name, degree) VALUES (9, 'Кривель Сергей Михайлович', 'доцент');
INSERT INTO public.teacher(teacher_id, name, degree) VALUES (10, 'Кузьмин Олег Викторович', 'профессор');
INSERT INTO public.teacher(teacher_id, name, degree) VALUES (11, 'Федоров Роман Константинович', 'доцент');

/*subject table creating*/
CREATE TABLE IF NOT EXISTS public.subject
(
    code character varying COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Subject_pkey" PRIMARY KEY (code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.subject
    OWNER to postgres;

/*subject table filling*/
INSERT INTO public.subject(code, name) VALUES ('Б1.О.29', 'Проектирование информационных систем');
INSERT INTO public.subject(code, name) VALUES ('Б1.В.ДВ.01.01', 'Имитационное моделирование сложных систем');
INSERT INTO public.subject(code, name) VALUES ('Б1.В.01', 'Моделирование процессов управления в технических системах');
INSERT INTO public.subject(code, name) VALUES ('Б1.О.19', 'Дискретная математика');
INSERT INTO public.subject(code, name) VALUES ('Б1.О.24', 'Теория вероятностей и математическая статистика');
INSERT INTO public.subject(code, name) VALUES ('Б1.В.02', 'Методы исследований и обработка информации в экологии и природопользовании');

/*study table creating*/
CREATE TABLE IF NOT EXISTS public.study
(
    subject_code character varying COLLATE pg_catalog."default" NOT NULL,
    student_group_id bigint NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.study
    OWNER to postgres;

/*study table filling*/
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.О.29', 12321);
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.В.ДВ.01.01', 22121);
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.В.01', 22121);
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.О.19', 12321);
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.О.24', 12321);
INSERT INTO public.study(subject_code, student_group_id) VALUES ('Б1.В.02', 22121);

/*taught table creating*/
CREATE TABLE IF NOT EXISTS public.taught
(
    subject_code character varying COLLATE pg_catalog."default" NOT NULL,
    teacher_id bigint NOT NULL,
    CONSTRAINT "Taught_pkey" PRIMARY KEY (subject_code, teacher_id),
    CONSTRAINT "Subject_code" FOREIGN KEY (subject_code)
        REFERENCES public.subject (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Teacher_id" FOREIGN KEY (teacher_id)
        REFERENCES public.teacher (teacher_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.taught
    OWNER to postgres;

/*taught table filling*/
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.О.29', 8);
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.В.ДВ.01.01', 9);
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.В.01', 9);
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.О.19', 10);
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.О.24', 10);
INSERT INTO public.taught(subject_code, teacher_id)VALUES ('Б1.В.02', 11);

/*pair table creating*/
CREATE TABLE IF NOT EXISTS public.pair
(
    "number" bigint NOT NULL,
    CONSTRAINT "Pair_pkey" PRIMARY KEY ("number")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pair
    OWNER to postgres;

/*pair table filling*/
INSERT INTO public.pair("number") VALUES (0);
INSERT INTO public.pair("number") VALUES (1);
INSERT INTO public.pair("number") VALUES (2);
INSERT INTO public.pair("number") VALUES (3);
INSERT INTO public.pair("number") VALUES (4);
INSERT INTO public.pair("number") VALUES (5);
INSERT INTO public.pair("number") VALUES (6);

/*room table creating*/
CREATE TABLE IF NOT EXISTS public.room
(
    id bigint NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Room_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.room
    OWNER to postgres;

/*room table filling*/
INSERT INTO public.room(id, name) VALUES (316, '316');
INSERT INTO public.room(id, name) VALUES (1132, '113-б');
INSERT INTO public.room(id, name) VALUES (1131, '113-а');
INSERT INTO public.room(id, name) VALUES (2131, '213-а');
INSERT INTO public.room(id, name) VALUES (322, '322');

/*cell table creating*/
CREATE TABLE IF NOT EXISTS public.cell
(
    "Day" bigint NOT NULL,
    "Student_Group_id" bigint NOT NULL,
    "Subject_Code" character varying COLLATE pg_catalog."default" NOT NULL,
    "Room" bigint NOT NULL,
    "Pair" bigint NOT NULL,
    "Teacher_pk" bigint NOT NULL,
    "Event" text COLLATE pg_catalog."default",
    CONSTRAINT "Pair" FOREIGN KEY ("Pair")
        REFERENCES public.pair ("number") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Room" FOREIGN KEY ("Room")
        REFERENCES public.room (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Student_Group" FOREIGN KEY ("Student_Group_id")
        REFERENCES public.student_group (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Subject_code" FOREIGN KEY ("Subject_Code")
        REFERENCES public.subject (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Teacher" FOREIGN KEY ("Teacher_pk")
        REFERENCES public.teacher (teacher_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cell
>>>>>>> 27690381ce7d0c8d46a4d90cd7e98c71286ebe5c
    OWNER to postgres;