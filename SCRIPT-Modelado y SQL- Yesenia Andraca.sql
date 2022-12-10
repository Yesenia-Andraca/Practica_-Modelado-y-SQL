--CREATING SCHEMA
create schema yesenia_andraca authorization zympbjgr;

----Create table COMPANY_CARS(ca)---- 
CREATE TABLE yesenia_andraca.company_cars(
	id_car integer NOT NULL, --PK
	id_model integer NOT NULL, -- FK of models
	id_color integer NOT NULL, --FK of colors
	purchase_date date NOT NULL,
	license_plate varchar(20) NOT NULL,
	km_total integer NOT NULL
);

---PK
alter table yesenia_andraca.company_cars
add constraint company_cars_pk primary key(id_car);


----Create table COLORS(co)---- 
create table yesenia_andraca.car_colors(
	id_color integer NOT NULL, --PK
	color varchar(20) NOT NULL
);

---PK
alter table yesenia_andraca.car_colors
add constraint car_colors_pk primary key(id_color);

----Create table MODELS(m)----
create table yesenia_andraca.models(
	id_model integer NOT NULL, --PK
	id_brand integer NOT NULL, --FK of brands
	model varchar(20) NOT NULL
);

---PK
alter table Yesenia_andraca.models
add constraint models_pk primary key(id_model);


----Create table BRANDS(b)----
create table yesenia_andraca.brands(
	id_brand integer NOT NULL, --PK
	id_company integer NOT NULL, -- FK of COMPANIES
	brand varchar(20) NOT NULL
);

---PK
alter table yesenia_andraca.brands
add constraint brands_pk PRIMARY KEY(id_brand);


----Create table COMPANIES(com)----
create table yesenia_andraca.companies(
	id_company integer NOT NULL, --PK
	company varchar(20) NOT NULL
);

---PK
alter table yesenia_andraca.companies
add constraint compani_pk PRIMARY KEY(id_company);


----Create table INSPECTIONS(ip)----
create table yesenia_andraca.inspections(
	id_inspection date NOT NULL, --PK
	id_car integer NOT NULL, --PK, FK of company_cars
	id_currency integer NOT NULL, --FK of currencies
	km integer NOT NULL,
	price_inspection integer NOT NULL
);

---PK
alter table yesenia_andraca.inspections
add constraint inspection_pk PRIMARY KEY(id_inspection);


----Create table CURRENCIES(cu)----
create table yesenia_andraca.currencies(
	id_currency integer NOT NULL, --PK
	currency varchar(20)
);

---PK
alter table yesenia_andraca.currencies
add constraint currencies_pk PRIMARY KEY(id_currency);


----Create table INSURANCES(i)----
create table yesenia_andraca.insurances(
	id_insurance integer NOT NULL, --PK
	id_car integer NOT NULL, --FK of car
	id_inscompany integer NOT NULL, --FL of insurances_companies
	insurance_number integer NOT NULL
);

---PK
alter table yesenia_andraca.insurances
add constraint insurances_pk PRIMARY KEY(id_insurance);


----Create table INSURANCE_COMPANY(ic)----
create table yesenia_andraca.insurance_company(
	id_inscompany integer NOT NULL, --PK
	insurance_company varchar(20) NOT NULL
);

--PK
alter table yesenia_andraca.insurance_company
add constraint insurance_company_pk PRIMARY KEY(id_inscompany);

--------------------------------------------------------------------
---FK'S
--
alter table yesenia_andraca.company_cars
add constraint cars_model_fk FOREIGN KEY(id_model)
references yesenia_andraca.models(id_model);
--
alter table yesenia_andraca.company_cars
add constraint cars_color_fk FOREIGN KEY(id_color)
references yesenia_andraca.car_colors(id_color);
--
alter table yesenia_andraca.models
add constraint model_brand_fk FOREIGN KEY(id_brand)
references yesenia_andraca.brands(id_brand);
--
alter table yesenia_andraca.brands
add constraint brand_company_fk FOREIGN KEY(id_company)
references yesenia_andraca.companies(id_company);
--
alter table yesenia_andraca.inspections
add constraint inspections_car_fk FOREIGN KEY(id_car)
references yesenia_andraca.company_cars(id_car);
--
alter table yesenia_andraca.inspections
add constraint inspections_currency_fk FOREIGN KEY(id_currency)
references yesenia_andraca.currencies(id_currency);
--
alter table yesenia_andraca.insurances
add constraint insurances_car_fk FOREIGN KEY(id_car)
references yesenia_andraca.company_cars(id_car);
--
alter table yesenia_andraca.insurances
add constraint insurances_inscompany_fk FOREIGN KEY(id_inscompany)
references yesenia_andraca.insurance_company(id_inscompany);

-------------------------------------------------------------
--DML

--- COLORS
insert into yesenia_andraca.car_colors
(id_color, color)
values('001', 'red');

insert into yesenia_andraca.car_colors
(id_color, color)
values('002', 'white');

insert into yesenia_andraca.car_colors
(id_color, color)
values('003', 'black');

insert into yesenia_andraca.car_colors
(id_color, color)
values('004', 'blue');

---Companies
insert into yesenia_andraca.companies
(id_company, company)
values('001', 'Ford');

insert into yesenia_andraca.companies
(id_company, company)
values('002', 'Volkswagen Group');

insert into yesenia_andraca.companies
(id_company, company)
values('003', 'Infiniti');

---Brands
insert into yesenia_andraca.brands 
(id_brand, id_company, brand)
values('001','003','Nissan');

insert into yesenia_andraca.brands 
(id_brand, id_company, brand)
values('002','002','Renault');

insert into yesenia_andraca.brands 
(id_brand, id_company, brand)
values('003','001','Audi');

---Models
insert into yesenia_andraca.models 
(id_model, id_brand, model)
values('001','001', 'QASHQAI');

insert into yesenia_andraca.models 
(id_model, id_brand, model)
values('002','001', 'JUKE');

insert into yesenia_andraca.models 
(id_model, id_brand, model)
values('003','001', 'X-TRAIL');

insert into yesenia_andraca.models 
(id_model, id_brand, model)
values('004','002', 'CLIO');

insert into yesenia_andraca.models 
(id_model, id_brand, model)
values('005','002', 'MEGANE');

insert into yesenia_andraca.models 
(id_model, id_brand, model)
values('006','003', 'Audi A3');

insert into yesenia_andraca.models 
(id_model, id_brand, model)
values('007','003', 'Audi A4');

insert into yesenia_andraca.models 
(id_model, id_brand, model)
values('008','003', 'Audi Q3');

---Company_cars
insert into yesenia_andraca.company_cars
(id_car, id_model, id_color, purchase_date, license_plate, km_total)
values('001', '001','001','2020-01-15','YEAF1592', '2500');

insert into yesenia_andraca.company_cars
(id_car, id_model, id_color, purchase_date, license_plate, km_total)
values('002', '001','002','2019-09-07','AAJE0709', '3500');

insert into yesenia_andraca.company_cars
(id_car, id_model, id_color, purchase_date, license_plate, km_total)
values('003', '002','001','2019-11-21','KLAF2103', '3508');

insert into yesenia_andraca.company_cars
(id_car, id_model, id_color, purchase_date, license_plate, km_total)
values('004', '003','004','2018-07-08','MEFS0807', '3540');

insert into yesenia_andraca.company_cars
(id_car, id_model, id_color, purchase_date, license_plate, km_total)
values('005', '001','002','2019-09-07','AAJE0709', '3500');

insert into yesenia_andraca.company_cars
(id_car, id_model, id_color, purchase_date, license_plate, km_total)
values('006', '002','004','2019-09-07','EJAG0709', '3540');

insert into yesenia_andraca.company_cars
(id_car, id_model, id_color, purchase_date, license_plate, km_total)
values('007', '003','003','2018-09-07','EJAG0147', '4570');

insert into yesenia_andraca.company_cars
(id_car, id_model, id_color, purchase_date, license_plate, km_total)
values('008', '002','001','2010-01-07','EJLG0147', '45710');

insert into yesenia_andraca.company_cars
(id_car, id_model, id_color, purchase_date, license_plate, km_total)
values('009', '002','002','2012-10-07','EJ410147', '44770');

insert into yesenia_andraca.company_cars
(id_car, id_model, id_color, purchase_date, license_plate, km_total)
values('010', '004','003','2023-02-07','YAKEE312', '4570');

---Insurance_companies
insert into yesenia_andraca.insurance_company 
(id_inscompany, insurance_company)
values('001', 'MAPFRE');

insert into yesenia_andraca.insurance_company 
(id_inscompany, insurance_company)
values('002', 'AXA');

insert into yesenia_andraca.insurance_company 
(id_inscompany, insurance_company)
values('003', 'Pelayo');

---Insurances
insert into yesenia_andraca.insurances 
(id_insurance, id_car, id_inscompany, insurance_number)
values('2201', '001', '001', '2022001');

insert into yesenia_andraca.insurances 
(id_insurance, id_car, id_inscompany, insurance_number)
values('2202', '002', '002', '20220002');

insert into yesenia_andraca.insurances 
(id_insurance, id_car, id_inscompany, insurance_number)
values('2203', '003', '002', '2022003');

insert into yesenia_andraca.insurances 
(id_insurance, id_car, id_inscompany, insurance_number)
values('2204', '004', '003', '2022004');

insert into yesenia_andraca.insurances 
(id_insurance, id_car, id_inscompany, insurance_number)
values('2205', '005', '002', '2022005');

insert into yesenia_andraca.insurances 
(id_insurance, id_car, id_inscompany, insurance_number)
values('2206', '006', '001', '2022006');

insert into yesenia_andraca.insurances 
(id_insurance, id_car, id_inscompany, insurance_number)
values('2207', '007', '002', '2022007');

insert into yesenia_andraca.insurances 
(id_insurance, id_car, id_inscompany, insurance_number)
values('2208', '008', '001', '2022008');

insert into yesenia_andraca.insurances 
(id_insurance, id_car, id_inscompany, insurance_number)
values('2209', '009', '001', '2022009');

insert into yesenia_andraca.insurances 
(id_insurance, id_car, id_inscompany, insurance_number)
values('2210', '010', '003', '2022010');


---Currencies
insert into yesenia_andraca.currencies 
(id_currency, currency)
values('001', 'euro');

insert into yesenia_andraca.currencies 
(id_currency, currency)
values('002', 'dolar');

insert into yesenia_andraca.currencies 
(id_currency, currency)
values('003', 'pound');

insert into yesenia_andraca.currencies 
(id_currency, currency)
values('004', 'yen');


---Inspections
insert into yesenia_andraca.inspections 
(id_inspection, id_car, id_currency, km, price_inspection)
values('2021-10-10', '001', '001', '1000', '100' );

insert into yesenia_andraca.inspections 
(id_inspection, id_car, id_currency, km, price_inspection)
values('2021-10-11', '002', '001', '1001', '101' );

insert into yesenia_andraca.inspections 
(id_inspection, id_car, id_currency, km, price_inspection)
values('2021-11-10', '003', '002', '1000', '100' );

insert into yesenia_andraca.inspections 
(id_inspection, id_car, id_currency, km, price_inspection)
values('2020-10-12', '004', '004', '1000', '400' );

insert into yesenia_andraca.inspections 
(id_inspection, id_car, id_currency, km, price_inspection)
values('2019-11-10', '005', '002', '1000', '100' );

insert into yesenia_andraca.inspections 
(id_inspection, id_car, id_currency, km, price_inspection)
values('2018-09-10', '006', '004', '1000', '100' );

insert into yesenia_andraca.inspections 
(id_inspection, id_car, id_currency, km, price_inspection)
values('2019-01-01', '007', '004', '1000', '400' );

insert into yesenia_andraca.inspections 
(id_inspection, id_car, id_currency, km, price_inspection)
values('2022-02-12', '008', '002', '1000', '80' );

insert into yesenia_andraca.inspections 
(id_inspection, id_car, id_currency, km, price_inspection)
values('2022-03-02', '009', '003', '1000', '80' );

insert into yesenia_andraca.inspections 
(id_inspection, id_car, id_currency, km, price_inspection)
values('2020-04-12', '010', '002', '1000', '80' );
