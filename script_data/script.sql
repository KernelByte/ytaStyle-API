-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.buys
(
    id_buy integer NOT NULL DEFAULT 'nextval('buys_id_buy_seq'::regclass)',
    id_group_buy integer,
    price_buy integer,
    buy_date date,
    name_user character varying COLLATE pg_catalog."default",
    id_payment_status integer,
    id_user_buy integer,
    CONSTRAINT buys_pkey PRIMARY KEY (id_buy)
);

CREATE TABLE IF NOT EXISTS public.groups
(
    id_group integer NOT NULL DEFAULT 'nextval('groups_id_group_seq'::regclass)',
    description character varying COLLATE pg_catalog."default",
    CONSTRAINT groups_pkey PRIMARY KEY (id_group)
);

CREATE TABLE IF NOT EXISTS public.products
(
    id_product integer NOT NULL DEFAULT 'nextval('products_id_product_seq'::regclass)',
    date_product date,
    name_product character varying COLLATE pg_catalog."default",
    quantity integer,
    price_unit integer,
    price_total integer,
    id_group_product integer,
    id_status_product integer,
    CONSTRAINT products_pkey PRIMARY KEY (id_product)
);

CREATE TABLE IF NOT EXISTS public.status
(
    id_status integer NOT NULL DEFAULT 'nextval('status_id_status_seq'::regclass)',
    group_status character varying COLLATE pg_catalog."default",
    description character varying COLLATE pg_catalog."default",
    CONSTRAINT status_pkey PRIMARY KEY (id_status)
);

CREATE TABLE IF NOT EXISTS public.price_products
(
    id_price_product integer NOT NULL DEFAULT 'nextval('price_products_id_price_product_seq'::regclass)',
    id_group_price_product integer,
    name_product character varying COLLATE pg_catalog."default",
    price_unit integer,
    price_minimum integer,
    price_sending integer,
    CONSTRAINT price_products_pkey PRIMARY KEY (id_price_product)
);

CREATE TABLE IF NOT EXISTS public.users
(
    id_user integer NOT NULL DEFAULT 'nextval('users_id_user_seq'::regclass)',
    number_id integer,
    name_user character varying COLLATE pg_catalog."default",
    email character varying COLLATE pg_catalog."default",
    password_user character varying COLLATE pg_catalog."default",
    id_role_user integer,
    CONSTRAINT users_pkey PRIMARY KEY (id_user)
);

CREATE TABLE IF NOT EXISTS public.roles
(
    id_role integer NOT NULL DEFAULT 'nextval('roles_id_role_seq'::regclass)',
    description character varying COLLATE pg_catalog."default",
    CONSTRAINT roles_pkey PRIMARY KEY (id_role)
);

ALTER TABLE IF EXISTS public.buys
    ADD CONSTRAINT buys_groups_fkey FOREIGN KEY (id_group_buy)
    REFERENCES public.groups (id_group) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.buys
    ADD CONSTRAINT buys_status_fkey FOREIGN KEY (id_payment_status)
    REFERENCES public.status (id_status) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.buys
    ADD CONSTRAINT buys_users_fkey FOREIGN KEY (id_user_buy)
    REFERENCES public.users (id_user) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.products
    ADD CONSTRAINT products_groups_fkey FOREIGN KEY (id_group_product)
    REFERENCES public.groups (id_group) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.products
    ADD CONSTRAINT products_status_fkey FOREIGN KEY (id_status_product)
    REFERENCES public.status (id_status) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.price_products
    ADD CONSTRAINT price_products_groups_fkey FOREIGN KEY (id_group_price_product)
    REFERENCES public.groups (id_group) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.users
    ADD CONSTRAINT user_role_fkey FOREIGN KEY (id_role_user)
    REFERENCES public.roles (id_role) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

END;