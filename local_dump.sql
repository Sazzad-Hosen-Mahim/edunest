--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: Day; Type: TYPE; Schema: public; Owner: sazzadhosen
--

CREATE TYPE public."Day" AS ENUM (
    'SUNDAY',
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY'
);


ALTER TYPE public."Day" OWNER TO sazzadhosen;

--
-- Name: UserSex; Type: TYPE; Schema: public; Owner: sazzadhosen
--

CREATE TYPE public."UserSex" AS ENUM (
    'MALE',
    'FEMALE'
);


ALTER TYPE public."UserSex" OWNER TO sazzadhosen;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Admin; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Admin" (
    id text NOT NULL,
    username text NOT NULL
);


ALTER TABLE public."Admin" OWNER TO sazzadhosen;

--
-- Name: Announcement; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Announcement" (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    "classId" integer
);


ALTER TABLE public."Announcement" OWNER TO sazzadhosen;

--
-- Name: Announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: sazzadhosen
--

CREATE SEQUENCE public."Announcement_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Announcement_id_seq" OWNER TO sazzadhosen;

--
-- Name: Announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sazzadhosen
--

ALTER SEQUENCE public."Announcement_id_seq" OWNED BY public."Announcement".id;


--
-- Name: Assignment; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Assignment" (
    id integer NOT NULL,
    title text NOT NULL,
    "startDate" timestamp(3) without time zone NOT NULL,
    "dueDate" timestamp(3) without time zone NOT NULL,
    "lessonId" integer NOT NULL
);


ALTER TABLE public."Assignment" OWNER TO sazzadhosen;

--
-- Name: Assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: sazzadhosen
--

CREATE SEQUENCE public."Assignment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Assignment_id_seq" OWNER TO sazzadhosen;

--
-- Name: Assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sazzadhosen
--

ALTER SEQUENCE public."Assignment_id_seq" OWNED BY public."Assignment".id;


--
-- Name: Attendance; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Attendance" (
    id integer NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    present boolean NOT NULL,
    "studentId" text NOT NULL,
    "lessonId" integer NOT NULL
);


ALTER TABLE public."Attendance" OWNER TO sazzadhosen;

--
-- Name: Attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: sazzadhosen
--

CREATE SEQUENCE public."Attendance_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Attendance_id_seq" OWNER TO sazzadhosen;

--
-- Name: Attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sazzadhosen
--

ALTER SEQUENCE public."Attendance_id_seq" OWNED BY public."Attendance".id;


--
-- Name: Class; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Class" (
    id integer NOT NULL,
    name text NOT NULL,
    capacity integer NOT NULL,
    "supervisorId" text,
    "gradeId" integer NOT NULL
);


ALTER TABLE public."Class" OWNER TO sazzadhosen;

--
-- Name: Class_id_seq; Type: SEQUENCE; Schema: public; Owner: sazzadhosen
--

CREATE SEQUENCE public."Class_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Class_id_seq" OWNER TO sazzadhosen;

--
-- Name: Class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sazzadhosen
--

ALTER SEQUENCE public."Class_id_seq" OWNED BY public."Class".id;


--
-- Name: Event; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Event" (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "classId" integer
);


ALTER TABLE public."Event" OWNER TO sazzadhosen;

--
-- Name: Event_id_seq; Type: SEQUENCE; Schema: public; Owner: sazzadhosen
--

CREATE SEQUENCE public."Event_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Event_id_seq" OWNER TO sazzadhosen;

--
-- Name: Event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sazzadhosen
--

ALTER SEQUENCE public."Event_id_seq" OWNED BY public."Event".id;


--
-- Name: Exam; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Exam" (
    id integer NOT NULL,
    title text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "lessonId" integer NOT NULL
);


ALTER TABLE public."Exam" OWNER TO sazzadhosen;

--
-- Name: Exam_id_seq; Type: SEQUENCE; Schema: public; Owner: sazzadhosen
--

CREATE SEQUENCE public."Exam_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Exam_id_seq" OWNER TO sazzadhosen;

--
-- Name: Exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sazzadhosen
--

ALTER SEQUENCE public."Exam_id_seq" OWNED BY public."Exam".id;


--
-- Name: Grade; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Grade" (
    id integer NOT NULL,
    level integer NOT NULL
);


ALTER TABLE public."Grade" OWNER TO sazzadhosen;

--
-- Name: Grade_id_seq; Type: SEQUENCE; Schema: public; Owner: sazzadhosen
--

CREATE SEQUENCE public."Grade_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Grade_id_seq" OWNER TO sazzadhosen;

--
-- Name: Grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sazzadhosen
--

ALTER SEQUENCE public."Grade_id_seq" OWNED BY public."Grade".id;


--
-- Name: Lesson; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Lesson" (
    id integer NOT NULL,
    name text NOT NULL,
    day public."Day" NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "subjectId" integer NOT NULL,
    "classId" integer NOT NULL,
    "teacherId" text NOT NULL
);


ALTER TABLE public."Lesson" OWNER TO sazzadhosen;

--
-- Name: Lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: sazzadhosen
--

CREATE SEQUENCE public."Lesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Lesson_id_seq" OWNER TO sazzadhosen;

--
-- Name: Lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sazzadhosen
--

ALTER SEQUENCE public."Lesson_id_seq" OWNED BY public."Lesson".id;


--
-- Name: Parent; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Parent" (
    id text NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    email text,
    phone text NOT NULL,
    address text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Parent" OWNER TO sazzadhosen;

--
-- Name: Result; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Result" (
    id integer NOT NULL,
    score integer NOT NULL,
    "examId" integer,
    "assignmentId" integer,
    "studentId" text NOT NULL
);


ALTER TABLE public."Result" OWNER TO sazzadhosen;

--
-- Name: Result_id_seq; Type: SEQUENCE; Schema: public; Owner: sazzadhosen
--

CREATE SEQUENCE public."Result_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Result_id_seq" OWNER TO sazzadhosen;

--
-- Name: Result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sazzadhosen
--

ALTER SEQUENCE public."Result_id_seq" OWNED BY public."Result".id;


--
-- Name: Student; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Student" (
    id text NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    email text,
    phone text,
    address text NOT NULL,
    img text,
    "bloodType" text NOT NULL,
    sex public."UserSex" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "parentId" text NOT NULL,
    "classId" integer NOT NULL,
    "gradeId" integer NOT NULL,
    birthday timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Student" OWNER TO sazzadhosen;

--
-- Name: Subject; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Subject" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Subject" OWNER TO sazzadhosen;

--
-- Name: Subject_id_seq; Type: SEQUENCE; Schema: public; Owner: sazzadhosen
--

CREATE SEQUENCE public."Subject_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Subject_id_seq" OWNER TO sazzadhosen;

--
-- Name: Subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sazzadhosen
--

ALTER SEQUENCE public."Subject_id_seq" OWNED BY public."Subject".id;


--
-- Name: Teacher; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."Teacher" (
    id text NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    email text,
    phone text,
    address text NOT NULL,
    img text,
    "bloodType" text NOT NULL,
    sex public."UserSex" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    birthday timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Teacher" OWNER TO sazzadhosen;

--
-- Name: _SubjectToTeacher; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public."_SubjectToTeacher" (
    "A" integer NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_SubjectToTeacher" OWNER TO sazzadhosen;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: sazzadhosen
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO sazzadhosen;

--
-- Name: Announcement id; Type: DEFAULT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Announcement" ALTER COLUMN id SET DEFAULT nextval('public."Announcement_id_seq"'::regclass);


--
-- Name: Assignment id; Type: DEFAULT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Assignment" ALTER COLUMN id SET DEFAULT nextval('public."Assignment_id_seq"'::regclass);


--
-- Name: Attendance id; Type: DEFAULT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Attendance" ALTER COLUMN id SET DEFAULT nextval('public."Attendance_id_seq"'::regclass);


--
-- Name: Class id; Type: DEFAULT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Class" ALTER COLUMN id SET DEFAULT nextval('public."Class_id_seq"'::regclass);


--
-- Name: Event id; Type: DEFAULT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Event" ALTER COLUMN id SET DEFAULT nextval('public."Event_id_seq"'::regclass);


--
-- Name: Exam id; Type: DEFAULT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Exam" ALTER COLUMN id SET DEFAULT nextval('public."Exam_id_seq"'::regclass);


--
-- Name: Grade id; Type: DEFAULT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Grade" ALTER COLUMN id SET DEFAULT nextval('public."Grade_id_seq"'::regclass);


--
-- Name: Lesson id; Type: DEFAULT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Lesson" ALTER COLUMN id SET DEFAULT nextval('public."Lesson_id_seq"'::regclass);


--
-- Name: Result id; Type: DEFAULT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Result" ALTER COLUMN id SET DEFAULT nextval('public."Result_id_seq"'::regclass);


--
-- Name: Subject id; Type: DEFAULT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Subject" ALTER COLUMN id SET DEFAULT nextval('public."Subject_id_seq"'::regclass);


--
-- Data for Name: Admin; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Admin" (id, username) FROM stdin;
admin1	admin1
admin2	admin2
\.


--
-- Data for Name: Announcement; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Announcement" (id, title, description, date, "classId") FROM stdin;
1	Announcement 1	Description for Announcement 1	2024-12-06 06:05:20.617	2
2	Announcement 2	Description for Announcement 2	2024-12-06 06:05:20.629	3
3	Announcement 3	Description for Announcement 3	2024-12-06 06:05:20.639	4
4	Announcement 4	Description for Announcement 4	2024-12-06 06:05:20.65	5
5	Announcement 5	Description for Announcement 5	2024-12-06 06:05:20.664	1
\.


--
-- Data for Name: Assignment; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Assignment" (id, title, "startDate", "dueDate", "lessonId") FROM stdin;
1	Assignment 1	2024-12-06 07:05:20.313	2024-12-07 06:05:20.313	2
2	Assignment 2	2024-12-06 07:05:20.325	2024-12-07 06:05:20.325	3
3	Assignment 3	2024-12-06 07:05:20.333	2024-12-07 06:05:20.333	4
4	Assignment 4	2024-12-06 07:05:20.34	2024-12-07 06:05:20.34	5
5	Assignment 5	2024-12-06 07:05:20.348	2024-12-07 06:05:20.348	6
6	Assignment 6	2024-12-06 07:05:20.355	2024-12-07 06:05:20.355	7
7	Assignment 7	2024-12-06 07:05:20.363	2024-12-07 06:05:20.363	8
8	Assignment 8	2024-12-06 07:05:20.371	2024-12-07 06:05:20.371	9
9	Assignment 9	2024-12-06 07:05:20.378	2024-12-07 06:05:20.378	10
10	Assignment 10	2024-12-06 07:05:20.385	2024-12-07 06:05:20.385	11
\.


--
-- Data for Name: Attendance; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Attendance" (id, date, present, "studentId", "lessonId") FROM stdin;
1	2024-12-06 06:05:20.473	t	student1	2
2	2024-12-06 06:05:20.486	t	student2	3
3	2024-12-06 06:05:20.494	t	student3	4
4	2024-12-06 06:05:20.502	t	student4	5
5	2024-12-06 06:05:20.51	t	student5	6
6	2024-12-06 06:05:20.517	t	student6	7
7	2024-12-06 06:05:20.525	t	student7	8
9	2024-12-06 06:05:20.549	t	student9	10
10	2024-12-06 06:05:20.561	t	student10	11
8	2024-12-06 06:05:20.534	t	user_2pRl2CSD4lSaZALrRq4xVJB9hos	9
\.


--
-- Data for Name: Class; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Class" (id, name, capacity, "supervisorId", "gradeId") FROM stdin;
5	5A	20	teacher10	5
6	6A	18	teacher11	6
1	1A	16	teacher12	1
2	2A	15	teacher13	2
3	3A	18	teacher14	3
4	4A	17	teacher15	4
8	6MF	45	teacher10	6
\.


--
-- Data for Name: Event; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Event" (id, title, description, "startTime", "endTime", "classId") FROM stdin;
1	Event 1	Description for Event 1	2024-12-06 07:05:20.572	2024-12-06 08:05:20.572	2
2	Event 2	Description for Event 2	2024-12-06 07:05:20.582	2024-12-06 08:05:20.582	3
3	Event 3	Description for Event 3	2024-12-06 07:05:20.59	2024-12-06 08:05:20.59	4
4	Event 4	Description for Event 4	2024-12-06 07:05:20.597	2024-12-06 08:05:20.597	5
5	Event 5	Description for Event 5	2024-12-06 07:05:20.606	2024-12-06 08:05:20.606	1
\.


--
-- Data for Name: Exam; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Exam" (id, title, "startTime", "endTime", "lessonId") FROM stdin;
1	Exam 1	2024-12-06 07:05:20.232	2024-12-06 08:05:20.232	2
2	Exam 2	2024-12-06 07:05:20.244	2024-12-06 08:05:20.244	3
3	Exam 3	2024-12-06 07:05:20.252	2024-12-06 08:05:20.252	4
4	Exam 4	2024-12-06 07:05:20.261	2024-12-06 08:05:20.261	5
5	Exam 5	2024-12-06 07:05:20.268	2024-12-06 08:05:20.268	6
6	Exam 6	2024-12-06 07:05:20.276	2024-12-06 08:05:20.276	7
7	Exam 7	2024-12-06 07:05:20.284	2024-12-06 08:05:20.284	8
8	Exam 8	2024-12-06 07:05:20.291	2024-12-06 08:05:20.291	9
9	Exam 9	2024-12-06 07:05:20.299	2024-12-06 08:05:20.299	10
10	Exam 10	2024-12-06 07:05:20.306	2024-12-06 08:05:20.306	11
11	Math Test	2024-12-07 22:10:00	2024-12-09 13:12:00	20
\.


--
-- Data for Name: Grade; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Grade" (id, level) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
\.


--
-- Data for Name: Lesson; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Lesson" (id, name, day, "startTime", "endTime", "subjectId", "classId", "teacherId") FROM stdin;
1	Lesson1	THURSDAY	2024-12-06 07:05:19.333	2024-12-06 09:05:19.333	2	2	teacher2
2	Lesson2	SUNDAY	2024-12-06 07:05:19.344	2024-12-06 09:05:19.344	3	3	teacher3
3	Lesson3	TUESDAY	2024-12-06 07:05:19.353	2024-12-06 09:05:19.353	4	4	teacher4
4	Lesson4	WEDNESDAY	2024-12-06 07:05:19.361	2024-12-06 09:05:19.361	5	5	teacher5
6	Lesson6	MONDAY	2024-12-06 07:05:19.377	2024-12-06 09:05:19.377	7	1	teacher7
7	Lesson7	WEDNESDAY	2024-12-06 07:05:19.385	2024-12-06 09:05:19.385	8	2	teacher8
8	Lesson8	TUESDAY	2024-12-06 07:05:19.393	2024-12-06 09:05:19.393	9	3	teacher9
9	Lesson9	WEDNESDAY	2024-12-06 07:05:19.4	2024-12-06 09:05:19.4	10	4	teacher10
10	Lesson10	SUNDAY	2024-12-06 07:05:19.408	2024-12-06 09:05:19.408	1	5	teacher11
11	Lesson11	WEDNESDAY	2024-12-06 07:05:19.416	2024-12-06 09:05:19.416	2	6	teacher12
12	Lesson12	SUNDAY	2024-12-06 07:05:19.424	2024-12-06 09:05:19.424	3	1	teacher13
13	Lesson13	SUNDAY	2024-12-06 07:05:19.432	2024-12-06 09:05:19.432	4	2	teacher14
14	Lesson14	SUNDAY	2024-12-06 07:05:19.445	2024-12-06 09:05:19.445	5	3	teacher15
15	Lesson15	WEDNESDAY	2024-12-06 07:05:19.453	2024-12-06 09:05:19.453	6	4	teacher1
16	Lesson16	WEDNESDAY	2024-12-06 07:05:19.463	2024-12-06 09:05:19.463	7	5	teacher2
17	Lesson17	THURSDAY	2024-12-06 07:05:19.476	2024-12-06 09:05:19.476	8	6	teacher3
18	Lesson18	WEDNESDAY	2024-12-06 07:05:19.486	2024-12-06 09:05:19.486	9	1	teacher4
19	Lesson19	MONDAY	2024-12-06 07:05:19.494	2024-12-06 09:05:19.494	10	2	teacher5
21	Lesson21	MONDAY	2024-12-06 07:05:19.517	2024-12-06 09:05:19.517	2	4	teacher7
22	Lesson22	SUNDAY	2024-12-06 07:05:19.525	2024-12-06 09:05:19.525	3	5	teacher8
23	Lesson23	WEDNESDAY	2024-12-06 07:05:19.535	2024-12-06 09:05:19.535	4	6	teacher9
24	Lesson24	MONDAY	2024-12-06 07:05:19.543	2024-12-06 09:05:19.543	5	1	teacher10
25	Lesson25	SUNDAY	2024-12-06 07:05:19.551	2024-12-06 09:05:19.551	6	2	teacher11
26	Lesson26	MONDAY	2024-12-06 07:05:19.558	2024-12-06 09:05:19.558	7	3	teacher12
27	Lesson27	WEDNESDAY	2024-12-06 07:05:19.565	2024-12-06 09:05:19.565	8	4	teacher13
28	Lesson28	WEDNESDAY	2024-12-06 07:05:19.572	2024-12-06 09:05:19.572	9	5	teacher14
29	Lesson29	SUNDAY	2024-12-06 07:05:19.579	2024-12-06 09:05:19.579	10	6	teacher15
30	Lesson30	THURSDAY	2024-12-06 07:05:19.587	2024-12-06 09:05:19.587	1	1	teacher1
5	Lesson5	THURSDAY	2024-12-06 07:05:19.369	2024-12-06 09:05:19.369	6	6	user_2pRkzMBoPXo8PPkR0Az3miF7Sgk
20	Lesson20	THURSDAY	2024-12-06 07:05:19.504	2024-12-06 09:05:19.504	1	3	user_2pRkzMBoPXo8PPkR0Az3miF7Sgk
\.


--
-- Data for Name: Parent; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Parent" (id, username, name, surname, email, phone, address, "createdAt") FROM stdin;
parentId1	parentId1	PName 1	PSurname 1	parent1@example.com	123-456-7891	Address1	2024-12-06 06:05:19.595
parentId2	parentId2	PName 2	PSurname 2	parent2@example.com	123-456-7892	Address2	2024-12-06 06:05:19.604
parentId3	parentId3	PName 3	PSurname 3	parent3@example.com	123-456-7893	Address3	2024-12-06 06:05:19.613
parentId5	parentId5	PName 5	PSurname 5	parent5@example.com	123-456-7895	Address5	2024-12-06 06:05:19.628
parentId6	parentId6	PName 6	PSurname 6	parent6@example.com	123-456-7896	Address6	2024-12-06 06:05:19.638
parentId7	parentId7	PName 7	PSurname 7	parent7@example.com	123-456-7897	Address7	2024-12-06 06:05:19.646
parentId8	parentId8	PName 8	PSurname 8	parent8@example.com	123-456-7898	Address8	2024-12-06 06:05:19.653
parentId9	parentId9	PName 9	PSurname 9	parent9@example.com	123-456-7899	Address9	2024-12-06 06:05:19.663
parentId10	parentId10	PName 10	PSurname 10	parent10@example.com	123-456-78910	Address10	2024-12-06 06:05:19.671
parentId11	parentId11	PName 11	PSurname 11	parent11@example.com	123-456-78911	Address11	2024-12-06 06:05:19.678
parentId12	parentId12	PName 12	PSurname 12	parent12@example.com	123-456-78912	Address12	2024-12-06 06:05:19.687
parentId13	parentId13	PName 13	PSurname 13	parent13@example.com	123-456-78913	Address13	2024-12-06 06:05:19.694
parentId14	parentId14	PName 14	PSurname 14	parent14@example.com	123-456-78914	Address14	2024-12-06 06:05:19.701
parentId15	parentId15	PName 15	PSurname 15	parent15@example.com	123-456-78915	Address15	2024-12-06 06:05:19.718
parentId16	parentId16	PName 16	PSurname 16	parent16@example.com	123-456-78916	Address16	2024-12-06 06:05:19.725
parentId17	parentId17	PName 17	PSurname 17	parent17@example.com	123-456-78917	Address17	2024-12-06 06:05:19.732
parentId18	parentId18	PName 18	PSurname 18	parent18@example.com	123-456-78918	Address18	2024-12-06 06:05:19.74
parentId19	parentId19	PName 19	PSurname 19	parent19@example.com	123-456-78919	Address19	2024-12-06 06:05:19.748
parentId20	parentId20	PName 20	PSurname 20	parent20@example.com	123-456-78920	Address20	2024-12-06 06:05:19.756
parentId21	parentId21	PName 21	PSurname 21	parent21@example.com	123-456-78921	Address21	2024-12-06 06:05:19.764
parentId22	parentId22	PName 22	PSurname 22	parent22@example.com	123-456-78922	Address22	2024-12-06 06:05:19.772
parentId23	parentId23	PName 23	PSurname 23	parent23@example.com	123-456-78923	Address23	2024-12-06 06:05:19.781
parentId24	parentId24	PName 24	PSurname 24	parent24@example.com	123-456-78924	Address24	2024-12-06 06:05:19.79
parentId25	parentId25	PName 25	PSurname 25	parent25@example.com	123-456-78925	Address25	2024-12-06 06:05:19.798
user_2pRl4TS3ZI4M8soWoQ86IOVNCuE	parentId4	PName 4	PSurname 4	parent4@example.com	123-456-7894	Address4	2024-12-06 06:05:19.62
\.


--
-- Data for Name: Result; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Result" (id, score, "examId", "assignmentId", "studentId") FROM stdin;
1	90	1	\N	student1
2	90	2	\N	student2
3	90	3	\N	student3
4	90	4	\N	student4
5	90	5	\N	student5
6	90	\N	1	student6
7	90	\N	2	student7
9	90	\N	4	student9
10	90	\N	5	student10
8	90	\N	3	user_2pRl2CSD4lSaZALrRq4xVJB9hos
\.


--
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Student" (id, username, name, surname, email, phone, address, img, "bloodType", sex, "createdAt", "parentId", "classId", "gradeId", birthday) FROM stdin;
student1	student1	SName1	SSurname 1	student1@example.com	987-654-3211	Address1	\N	O-	FEMALE	2024-12-06 06:05:19.806	parentId1	2	2	2014-12-06 06:05:19.805
student2	student2	SName2	SSurname 2	student2@example.com	987-654-3212	Address2	\N	O-	MALE	2024-12-06 06:05:19.821	parentId1	3	3	2014-12-06 06:05:19.82
student3	student3	SName3	SSurname 3	student3@example.com	987-654-3213	Address3	\N	O-	FEMALE	2024-12-06 06:05:19.832	parentId2	4	4	2014-12-06 06:05:19.831
student4	student4	SName4	SSurname 4	student4@example.com	987-654-3214	Address4	\N	O-	MALE	2024-12-06 06:05:19.843	parentId2	5	5	2014-12-06 06:05:19.842
student5	student5	SName5	SSurname 5	student5@example.com	987-654-3215	Address5	\N	O-	FEMALE	2024-12-06 06:05:19.853	parentId3	6	6	2014-12-06 06:05:19.852
student6	student6	SName6	SSurname 6	student6@example.com	987-654-3216	Address6	\N	O-	MALE	2024-12-06 06:05:19.861	parentId3	1	1	2014-12-06 06:05:19.86
student9	student9	SName9	SSurname 9	student9@example.com	987-654-3219	Address9	\N	O-	FEMALE	2024-12-06 06:05:19.888	parentId5	4	4	2014-12-06 06:05:19.887
student10	student10	SName10	SSurname 10	student10@example.com	987-654-32110	Address10	\N	O-	MALE	2024-12-06 06:05:19.897	parentId5	5	5	2014-12-06 06:05:19.896
student11	student11	SName11	SSurname 11	student11@example.com	987-654-32111	Address11	\N	O-	FEMALE	2024-12-06 06:05:19.905	parentId6	6	6	2014-12-06 06:05:19.904
student12	student12	SName12	SSurname 12	student12@example.com	987-654-32112	Address12	\N	O-	MALE	2024-12-06 06:05:19.915	parentId6	1	1	2014-12-06 06:05:19.914
student13	student13	SName13	SSurname 13	student13@example.com	987-654-32113	Address13	\N	O-	FEMALE	2024-12-06 06:05:19.924	parentId7	2	2	2014-12-06 06:05:19.923
student14	student14	SName14	SSurname 14	student14@example.com	987-654-32114	Address14	\N	O-	MALE	2024-12-06 06:05:19.932	parentId7	3	3	2014-12-06 06:05:19.931
student15	student15	SName15	SSurname 15	student15@example.com	987-654-32115	Address15	\N	O-	FEMALE	2024-12-06 06:05:19.941	parentId8	4	4	2014-12-06 06:05:19.94
student16	student16	SName16	SSurname 16	student16@example.com	987-654-32116	Address16	\N	O-	MALE	2024-12-06 06:05:19.948	parentId8	5	5	2014-12-06 06:05:19.947
student17	student17	SName17	SSurname 17	student17@example.com	987-654-32117	Address17	\N	O-	FEMALE	2024-12-06 06:05:19.956	parentId9	6	6	2014-12-06 06:05:19.954
student18	student18	SName18	SSurname 18	student18@example.com	987-654-32118	Address18	\N	O-	MALE	2024-12-06 06:05:19.963	parentId9	1	1	2014-12-06 06:05:19.962
student19	student19	SName19	SSurname 19	student19@example.com	987-654-32119	Address19	\N	O-	FEMALE	2024-12-06 06:05:19.97	parentId10	2	2	2014-12-06 06:05:19.969
student20	student20	SName20	SSurname 20	student20@example.com	987-654-32120	Address20	\N	O-	MALE	2024-12-06 06:05:19.978	parentId10	3	3	2014-12-06 06:05:19.977
student21	student21	SName21	SSurname 21	student21@example.com	987-654-32121	Address21	\N	O-	FEMALE	2024-12-06 06:05:19.985	parentId11	4	4	2014-12-06 06:05:19.984
student22	student22	SName22	SSurname 22	student22@example.com	987-654-32122	Address22	\N	O-	MALE	2024-12-06 06:05:19.994	parentId11	5	5	2014-12-06 06:05:19.992
student23	student23	SName23	SSurname 23	student23@example.com	987-654-32123	Address23	\N	O-	FEMALE	2024-12-06 06:05:20.005	parentId12	6	6	2014-12-06 06:05:20.004
student24	student24	SName24	SSurname 24	student24@example.com	987-654-32124	Address24	\N	O-	MALE	2024-12-06 06:05:20.014	parentId12	1	1	2014-12-06 06:05:20.013
student25	student25	SName25	SSurname 25	student25@example.com	987-654-32125	Address25	\N	O-	FEMALE	2024-12-06 06:05:20.022	parentId13	2	2	2014-12-06 06:05:20.021
student26	student26	SName26	SSurname 26	student26@example.com	987-654-32126	Address26	\N	O-	MALE	2024-12-06 06:05:20.03	parentId13	3	3	2014-12-06 06:05:20.029
student27	student27	SName27	SSurname 27	student27@example.com	987-654-32127	Address27	\N	O-	FEMALE	2024-12-06 06:05:20.038	parentId14	4	4	2014-12-06 06:05:20.037
student28	student28	SName28	SSurname 28	student28@example.com	987-654-32128	Address28	\N	O-	MALE	2024-12-06 06:05:20.045	parentId14	5	5	2014-12-06 06:05:20.044
student29	student29	SName29	SSurname 29	student29@example.com	987-654-32129	Address29	\N	O-	FEMALE	2024-12-06 06:05:20.053	parentId15	6	6	2014-12-06 06:05:20.052
student30	student30	SName30	SSurname 30	student30@example.com	987-654-32130	Address30	\N	O-	MALE	2024-12-06 06:05:20.06	parentId15	1	1	2014-12-06 06:05:20.059
student31	student31	SName31	SSurname 31	student31@example.com	987-654-32131	Address31	\N	O-	FEMALE	2024-12-06 06:05:20.068	parentId16	2	2	2014-12-06 06:05:20.067
student32	student32	SName32	SSurname 32	student32@example.com	987-654-32132	Address32	\N	O-	MALE	2024-12-06 06:05:20.082	parentId16	3	3	2014-12-06 06:05:20.081
student33	student33	SName33	SSurname 33	student33@example.com	987-654-32133	Address33	\N	O-	FEMALE	2024-12-06 06:05:20.09	parentId17	4	4	2014-12-06 06:05:20.089
student34	student34	SName34	SSurname 34	student34@example.com	987-654-32134	Address34	\N	O-	MALE	2024-12-06 06:05:20.097	parentId17	5	5	2014-12-06 06:05:20.096
student35	student35	SName35	SSurname 35	student35@example.com	987-654-32135	Address35	\N	O-	FEMALE	2024-12-06 06:05:20.105	parentId18	6	6	2014-12-06 06:05:20.104
student36	student36	SName36	SSurname 36	student36@example.com	987-654-32136	Address36	\N	O-	MALE	2024-12-06 06:05:20.113	parentId18	1	1	2014-12-06 06:05:20.112
student37	student37	SName37	SSurname 37	student37@example.com	987-654-32137	Address37	\N	O-	FEMALE	2024-12-06 06:05:20.121	parentId19	2	2	2014-12-06 06:05:20.12
student38	student38	SName38	SSurname 38	student38@example.com	987-654-32138	Address38	\N	O-	MALE	2024-12-06 06:05:20.129	parentId19	3	3	2014-12-06 06:05:20.128
student39	student39	SName39	SSurname 39	student39@example.com	987-654-32139	Address39	\N	O-	FEMALE	2024-12-06 06:05:20.137	parentId20	4	4	2014-12-06 06:05:20.136
student40	student40	SName40	SSurname 40	student40@example.com	987-654-32140	Address40	\N	O-	MALE	2024-12-06 06:05:20.145	parentId20	5	5	2014-12-06 06:05:20.144
student41	student41	SName41	SSurname 41	student41@example.com	987-654-32141	Address41	\N	O-	FEMALE	2024-12-06 06:05:20.153	parentId21	6	6	2014-12-06 06:05:20.152
student42	student42	SName42	SSurname 42	student42@example.com	987-654-32142	Address42	\N	O-	MALE	2024-12-06 06:05:20.162	parentId21	1	1	2014-12-06 06:05:20.161
student43	student43	SName43	SSurname 43	student43@example.com	987-654-32143	Address43	\N	O-	FEMALE	2024-12-06 06:05:20.17	parentId22	2	2	2014-12-06 06:05:20.169
student44	student44	SName44	SSurname 44	student44@example.com	987-654-32144	Address44	\N	O-	MALE	2024-12-06 06:05:20.178	parentId22	3	3	2014-12-06 06:05:20.177
student45	student45	SName45	SSurname 45	student45@example.com	987-654-32145	Address45	\N	O-	FEMALE	2024-12-06 06:05:20.185	parentId23	4	4	2014-12-06 06:05:20.184
student46	student46	SName46	SSurname 46	student46@example.com	987-654-32146	Address46	\N	O-	MALE	2024-12-06 06:05:20.194	parentId23	5	5	2014-12-06 06:05:20.193
student47	student47	SName47	SSurname 47	student47@example.com	987-654-32147	Address47	\N	O-	FEMALE	2024-12-06 06:05:20.202	parentId24	6	6	2014-12-06 06:05:20.201
student7	student7	SName7	SSurname 7	student7@example.com	987-654-3217	Address7	\N	O-	FEMALE	2024-12-06 06:05:19.871	user_2pRl4TS3ZI4M8soWoQ86IOVNCuE	2	2	2014-12-06 06:05:19.87
student48	student48	SName48	SSurname 48	student48@example.com	987-654-32148	Address48	\N	O-	MALE	2024-12-06 06:05:20.209	parentId24	1	1	2014-12-06 06:05:20.208
student49	student49	SName49	SSurname 49	student49@example.com	987-654-32149	Address49	\N	O-	FEMALE	2024-12-06 06:05:20.218	parentId25	2	2	2014-12-06 06:05:20.216
student50	student50	SName50	SSurname 50	student50@example.com	987-654-32150	Address50	\N	O-	MALE	2024-12-06 06:05:20.226	parentId25	3	3	2014-12-06 06:05:20.225
user_2pRl2CSD4lSaZALrRq4xVJB9hos	student8	SName8	SSurname 8	student8@example.com	987-654-3218	Address8	\N	O-	MALE	2024-12-06 06:05:19.88	user_2pRl4TS3ZI4M8soWoQ86IOVNCuE	3	3	2014-12-06 06:05:19.879
\.


--
-- Data for Name: Subject; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Subject" (id, name) FROM stdin;
1	Mathematics
2	Science
3	English
4	History
5	Geography
6	Physics
7	Chemistry
8	Biology
9	Computer Science
10	Art
18	Sazzad Hosen
16	new one up
21	Test two
\.


--
-- Data for Name: Teacher; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."Teacher" (id, username, name, surname, email, phone, address, img, "bloodType", sex, "createdAt", birthday) FROM stdin;
teacher1	teacher1	TName1	TSurname1	teacher1@example.com	123-456-7891	Address1	\N	A+	FEMALE	2024-12-06 06:05:19.042	1994-12-06 06:05:19.037
teacher2	teacher2	TName2	TSurname2	teacher2@example.com	123-456-7892	Address2	\N	A+	MALE	2024-12-06 06:05:19.085	1994-12-06 06:05:19.084
teacher3	teacher3	TName3	TSurname3	teacher3@example.com	123-456-7893	Address3	\N	A+	FEMALE	2024-12-06 06:05:19.105	1994-12-06 06:05:19.104
teacher4	teacher4	TName4	TSurname4	teacher4@example.com	123-456-7894	Address4	\N	A+	MALE	2024-12-06 06:05:19.123	1994-12-06 06:05:19.121
teacher5	teacher5	TName5	TSurname5	teacher5@example.com	123-456-7895	Address5	\N	A+	FEMALE	2024-12-06 06:05:19.142	1994-12-06 06:05:19.141
teacher7	teacher7	TName7	TSurname7	teacher7@example.com	123-456-7897	Address7	\N	A+	FEMALE	2024-12-06 06:05:19.175	1994-12-06 06:05:19.174
teacher8	teacher8	TName8	TSurname8	teacher8@example.com	123-456-7898	Address8	\N	A+	MALE	2024-12-06 06:05:19.192	1994-12-06 06:05:19.19
teacher9	teacher9	TName9	TSurname9	teacher9@example.com	123-456-7899	Address9	\N	A+	FEMALE	2024-12-06 06:05:19.207	1994-12-06 06:05:19.206
teacher10	teacher10	TName10	TSurname10	teacher10@example.com	123-456-78910	Address10	\N	A+	MALE	2024-12-06 06:05:19.225	1994-12-06 06:05:19.223
teacher11	teacher11	TName11	TSurname11	teacher11@example.com	123-456-78911	Address11	\N	A+	FEMALE	2024-12-06 06:05:19.242	1994-12-06 06:05:19.241
teacher12	teacher12	TName12	TSurname12	teacher12@example.com	123-456-78912	Address12	\N	A+	MALE	2024-12-06 06:05:19.257	1994-12-06 06:05:19.256
teacher13	teacher13	TName13	TSurname13	teacher13@example.com	123-456-78913	Address13	\N	A+	FEMALE	2024-12-06 06:05:19.275	1994-12-06 06:05:19.273
teacher14	teacher14	TName14	TSurname14	teacher14@example.com	123-456-78914	Address14	\N	A+	MALE	2024-12-06 06:05:19.299	1994-12-06 06:05:19.298
teacher15	teacher15	TName15	TSurname15	teacher15@example.com	123-456-78915	Address15	\N	A+	FEMALE	2024-12-06 06:05:19.317	1994-12-06 06:05:19.316
user_2pRkzMBoPXo8PPkR0Az3miF7Sgk	teacher6	TName6	TSurname6	teacher6@example.com	123-456-7896	Address6	\N	A+	MALE	2024-12-06 06:05:19.158	1994-12-06 06:05:19.157
user_2pwyjxMb9YmcmiSqj6aoHlCztHL	aayat	Sarfaraz Islam	Aayat	aayat@gmail.com	1234567890	Madanhat, Hathazari, Chattogram	https://res.cloudinary.com/farhad2/image/upload/v1733691566/hjsqb7096ivtbxoepiy2.jpg	O+	MALE	2024-12-08 20:59:28.748	2017-11-10 00:00:00
\.


--
-- Data for Name: _SubjectToTeacher; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public."_SubjectToTeacher" ("A", "B") FROM stdin;
2	teacher1
3	teacher2
4	teacher3
5	teacher4
6	teacher5
8	teacher7
9	teacher8
10	teacher9
1	teacher10
2	teacher11
3	teacher12
4	teacher13
5	teacher14
6	teacher15
7	user_2pRkzMBoPXo8PPkR0Az3miF7Sgk
18	teacher3
21	teacher2
21	teacher4
3	user_2pwyjxMb9YmcmiSqj6aoHlCztHL
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: sazzadhosen
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
409e91b5-3193-46c8-8d45-fdee41c4f70c	0ea1a151fe10e9f8e350522606fe2d418c52812a0aeebb9bb3413400e9f736f6	2024-12-06 06:01:02.973483+00	20241124114235_init	\N	\N	2024-12-06 06:01:02.855571+00	1
76246db9-c379-4059-a253-24ebf7e6de09	7aac7ea44859d0cf10f443a8964428889b691112d2041d03887e7bac9029b887	2024-12-06 06:01:03.004805+00	20241124170818_school	\N	\N	2024-12-06 06:01:02.980726+00	1
\.


--
-- Name: Announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sazzadhosen
--

SELECT pg_catalog.setval('public."Announcement_id_seq"', 5, true);


--
-- Name: Assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sazzadhosen
--

SELECT pg_catalog.setval('public."Assignment_id_seq"', 10, true);


--
-- Name: Attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sazzadhosen
--

SELECT pg_catalog.setval('public."Attendance_id_seq"', 10, true);


--
-- Name: Class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sazzadhosen
--

SELECT pg_catalog.setval('public."Class_id_seq"', 8, true);


--
-- Name: Event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sazzadhosen
--

SELECT pg_catalog.setval('public."Event_id_seq"', 5, true);


--
-- Name: Exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sazzadhosen
--

SELECT pg_catalog.setval('public."Exam_id_seq"', 17, true);


--
-- Name: Grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sazzadhosen
--

SELECT pg_catalog.setval('public."Grade_id_seq"', 6, true);


--
-- Name: Lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sazzadhosen
--

SELECT pg_catalog.setval('public."Lesson_id_seq"', 30, true);


--
-- Name: Result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sazzadhosen
--

SELECT pg_catalog.setval('public."Result_id_seq"', 10, true);


--
-- Name: Subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sazzadhosen
--

SELECT pg_catalog.setval('public."Subject_id_seq"', 21, true);


--
-- Name: Admin Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY (id);


--
-- Name: Announcement Announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Announcement"
    ADD CONSTRAINT "Announcement_pkey" PRIMARY KEY (id);


--
-- Name: Assignment Assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Assignment"
    ADD CONSTRAINT "Assignment_pkey" PRIMARY KEY (id);


--
-- Name: Attendance Attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_pkey" PRIMARY KEY (id);


--
-- Name: Class Class_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Class"
    ADD CONSTRAINT "Class_pkey" PRIMARY KEY (id);


--
-- Name: Event Event_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (id);


--
-- Name: Exam Exam_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_pkey" PRIMARY KEY (id);


--
-- Name: Grade Grade_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY (id);


--
-- Name: Lesson Lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_pkey" PRIMARY KEY (id);


--
-- Name: Parent Parent_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Parent"
    ADD CONSTRAINT "Parent_pkey" PRIMARY KEY (id);


--
-- Name: Result Result_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_pkey" PRIMARY KEY (id);


--
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (id);


--
-- Name: Subject Subject_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_pkey" PRIMARY KEY (id);


--
-- Name: Teacher Teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Teacher"
    ADD CONSTRAINT "Teacher_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Admin_username_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Admin_username_key" ON public."Admin" USING btree (username);


--
-- Name: Grade_level_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Grade_level_key" ON public."Grade" USING btree (level);


--
-- Name: Parent_email_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Parent_email_key" ON public."Parent" USING btree (email);


--
-- Name: Parent_phone_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Parent_phone_key" ON public."Parent" USING btree (phone);


--
-- Name: Parent_username_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Parent_username_key" ON public."Parent" USING btree (username);


--
-- Name: Student_email_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Student_email_key" ON public."Student" USING btree (email);


--
-- Name: Student_phone_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Student_phone_key" ON public."Student" USING btree (phone);


--
-- Name: Student_username_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Student_username_key" ON public."Student" USING btree (username);


--
-- Name: Subject_name_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Subject_name_key" ON public."Subject" USING btree (name);


--
-- Name: Teacher_email_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Teacher_email_key" ON public."Teacher" USING btree (email);


--
-- Name: Teacher_phone_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Teacher_phone_key" ON public."Teacher" USING btree (phone);


--
-- Name: Teacher_username_key; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "Teacher_username_key" ON public."Teacher" USING btree (username);


--
-- Name: _SubjectToTeacher_AB_unique; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE UNIQUE INDEX "_SubjectToTeacher_AB_unique" ON public."_SubjectToTeacher" USING btree ("A", "B");


--
-- Name: _SubjectToTeacher_B_index; Type: INDEX; Schema: public; Owner: sazzadhosen
--

CREATE INDEX "_SubjectToTeacher_B_index" ON public."_SubjectToTeacher" USING btree ("B");


--
-- Name: Announcement Announcement_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Announcement"
    ADD CONSTRAINT "Announcement_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Assignment Assignment_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Assignment"
    ADD CONSTRAINT "Assignment_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Attendance Attendance_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Attendance Attendance_studentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES public."Student"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Class Class_gradeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Class"
    ADD CONSTRAINT "Class_gradeId_fkey" FOREIGN KEY ("gradeId") REFERENCES public."Grade"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Class Class_supervisorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Class"
    ADD CONSTRAINT "Class_supervisorId_fkey" FOREIGN KEY ("supervisorId") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Event Event_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT "Event_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Exam Exam_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Lesson Lesson_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Lesson Lesson_subjectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Lesson Lesson_teacherId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Result Result_assignmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_assignmentId_fkey" FOREIGN KEY ("assignmentId") REFERENCES public."Assignment"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Result Result_examId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_examId_fkey" FOREIGN KEY ("examId") REFERENCES public."Exam"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Result Result_studentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES public."Student"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_gradeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_gradeId_fkey" FOREIGN KEY ("gradeId") REFERENCES public."Grade"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_parentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES public."Parent"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _SubjectToTeacher _SubjectToTeacher_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."_SubjectToTeacher"
    ADD CONSTRAINT "_SubjectToTeacher_A_fkey" FOREIGN KEY ("A") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _SubjectToTeacher _SubjectToTeacher_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sazzadhosen
--

ALTER TABLE ONLY public."_SubjectToTeacher"
    ADD CONSTRAINT "_SubjectToTeacher_B_fkey" FOREIGN KEY ("B") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

