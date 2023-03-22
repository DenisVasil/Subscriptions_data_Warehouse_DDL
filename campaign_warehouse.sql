CREATE TABLE fact_communication_subscription (
	customer_key bigint NOT NULL,
	communication_key bigint NOT NULL,
	channel_key bigint NOT NULL,
	subscription_status_key bigint NOT NULL,
	date_key bigint NOT NULL,
	source_system_code smallint NOT NULL,
	create_timestamp timestamp NOT NULL DEFAULT NOW(),
	update_timestamp timestamp NOT NULL,
	CONSTRAINT pk_fact_communication_subscription
		PRIMARY KEY ( communication_key, customer_key, date_key)
	);

CREATE TABLE dim_communication(
	communication_key bigserial NOT NULL,
	title varchar(50),
	description varchar(200),
	format varchar(20),
	lang varchar(50),
	category varchar(20),
	issuing_unit varchar(30),
	issuing_country char(3),
	start_date timestamp,
	end_date timestamp,
	status varchar(10),
	source_system_code smallint NOT NULL,
	create_timestamp timestamp NOT NULL,
	update_timestamp timestamp NOT NULL,
	CONSTRAINT pk_dim_communication
	PRIMARY KEY (communication_key)
);

CREATE TABLE dim_subscription_status (
	subscription_status_key bigserial NOT NULL,
	subscription_status_code char(2),
	description varchar(50),
	source_system_code smallint,
	create_timestamp timestamp,
	update_timestamp timestamp,
	CONSTRAINT pk_dim_subscription_status
	PRIMARY KEY (subscription_status_key)
);

CREATE TABLE dim_channel (
	channel_key bigserial NOT NULL,
	name_ varchar(20),
	description varchar(50),
	start_date timestamp,
	end_date timestamp,
	status varchar(10),
	source_system_code smallint NOT NULL,
	create_timestamp timestamp NOT NULL,
	update_timestamp timestamp NOT NULL,
	CONSTRAINT pk_dim_channel
	PRIMARY KEY (channel_key)
);

CREATE TABLE dim_customer (
	customer_key bigserial NOT NULL,
	customer_id integer NOT NULL,
	account_number integer NOT NULL,
	customer_type varchar(20) NOT NULL,
	title char(8) NOT NULL,
	first_name varchar(50)NOT NULL,
	middle_name varchar(50),
	last_name varchar(50),
	gender char(1) NOT NULL,
	birth_date date NOT NULL,
	email_address varchar(50) NOT NULL,
	address1 varchar(120) NOT NULL,
	address2 varchar(120),
	phone varchar(20) NOT NULL,
	CONSTRAINT pk_dim_customer
	PRIMARY KEY (customer_key)
	
);

CREATE TABLE dim_date (
	date_key bigserial NOT NULL,
	subscription_start_date timestamp with time zone NOT NULL,
	subscription_end_date timestamp with time zone,
	subscription_start_calendar_year smallint NOT NULL,
	subscription_end_calendar_year smallint,
	subscription_start_fiscal_year smallint NOT NULL,
	subscription_end_fiscal_year smallint,
	CONSTRAINT pk_dim_date
	PRIMARY KEY (date_key)
);