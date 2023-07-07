Set search_path to toymanf_new;

CREATE TABLE Contacts
(
  contact_id bigint NOT NULL
);

ALTER TABLE Contacts ADD CONSTRAINT PK_Contact_details
  PRIMARY KEY (contact_id);

CREATE TABLE Contacts_details
(
  contact_id bigint,
  Contact char(100)
);

CREATE TABLE Departments
(
  Department char(20) NOT NULL
);

ALTER TABLE Departments ADD CONSTRAINT department
  PRIMARY KEY (Department);

CREATE TABLE Employee
(
  employee_id bigint NOT NULL,
  name char(200),
  password char(12),
  age bigint,
  emplyee_type_id bigint,
  joined_since date,
  prefered_work_hour time,
  shift_hours bigint,
  contact_id bigint NOT NULL
);

ALTER TABLE Employee ADD CONSTRAINT employee_id
  PRIMARY KEY (employee_id);

CREATE TABLE Manufacturing_machines
(
  machine_id bigint NOT NULL,
  production_capacity bigint,
  last_service_date bigint,
  machine_type_id bigint,
  toy_id bigint
);

ALTER TABLE Manufacturing_machines ADD CONSTRAINT machine_id
  PRIMARY KEY (machine_id);

CREATE TABLE Shop_details
(
  shop_id bigint NOT NULL,
  owner_name char(20),
  shop_name char(20),
  owner_contact bigint NOT NULL
);

ALTER TABLE Shop_details ADD CONSTRAINT shop_PK
  PRIMARY KEY (shop_id);

CREATE TABLE all_manufacturing_machines
(
  machine_type_id bigint NOT NULL,
  machine_name char(20),
  description char(1000),
  efficency bigint,
  rent bigint,
  price bigint,
  owner_contact_id bigint,
  maintenance_contact_id bigint
);

ALTER TABLE all_manufacturing_machines ADD CONSTRAINT machine_type_id
  PRIMARY KEY (machine_type_id);

CREATE TABLE delivery
(
  order_id bigint,
  driver_id bigint,
  est_arrival_InDays bigint
);

CREATE TABLE driver_details
(
  driver_id bigint NOT NULL,
  driver_name char(20),
  contact bigint,
  truck_no_plate bigint,
  truck_capacity bigint
);

ALTER TABLE driver_details ADD CONSTRAINT driver_pk
  PRIMARY KEY (driver_id);


CREATE TABLE employee_type
(
  Employee_type_id bigint NOT NULL,
  employee_type char(20),
  department char(20),
  salary_per_hour bigint
);

ALTER TABLE employee_type ADD CONSTRAINT pk_employee_type
  PRIMARY KEY (Employee_type_id);

CREATE TABLE material_providers
(
  material_provider_id bigint NOT NULL,
  name char(20),
  contact_id bigint,
  provider_address char(1000)
);

ALTER TABLE material_providers ADD CONSTRAINT provider_PK
  PRIMARY KEY (material_provider_id);

CREATE TABLE raw_material_orders
(
  order_id bigint NOT NULL,
  material_provider_id bigint,
  raw_material_id bigint,
  order_status boolean,
  est_arrival_inDays bigint
);

ALTER TABLE raw_material_orders ADD CONSTRAINT order_PK
  PRIMARY KEY (order_id);

CREATE TABLE raw_materials
(
  raw_material_id bigint NOT NULL,
  material_name char(20),
  price_per_unit bigint,
  current_stock bigint,
  days_remaining bigint
);

ALTER TABLE raw_materials ADD CONSTRAINT raw_material_PK
  PRIMARY KEY (raw_material_id);

CREATE TABLE sales
(
  sales_id bigint NOT NULL,
  priority bigint,
  customer_review char(1000),
  order_id bigint
);

ALTER TABLE sales ADD CONSTRAINT sales_PK
  PRIMARY KEY (sales_id);

CREATE TABLE shop_orders
(
  shop_order_id bigint NOT NULL,
  shop_id bigint,
  order_status boolean,
  quantity bigint,
  toy_id bigint
);

ALTER TABLE shop_orders ADD CONSTRAINT shop_order_PK
  PRIMARY KEY (shop_order_id);

CREATE TABLE toy_base
(
  toy_id bigint NOT NULL,
  toy_name char(20),
  toy_type bigint,
  age_group bigint,
  current_stock bigint,
  manufacturing_cost bigint,
  mrp bigint,
  profit bigint
);

ALTER TABLE toy_base ADD CONSTRAINT toy_PK
  PRIMARY KEY (toy_id);

CREATE TABLE toy_materials
(
  toy_id bigint,
  mat_id bigint,
  amount bigint
);

CREATE TABLE toy_types
(
  toy_type_id bigint NOT NULL,
  type char(20)
);

ALTER TABLE toy_types ADD CONSTRAINT toy_type_PK
  PRIMARY KEY (toy_type_id);

ALTER TABLE Contacts_details ADD CONSTRAINT fk_phone_numbers_contact_id
  FOREIGN KEY (contact_id) REFERENCES Contacts (contact_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Employee_type_id
  FOREIGN KEY (emplyee_type_id) REFERENCES employee_type (Employee_type_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_contact_id
  FOREIGN KEY (contact_id) REFERENCES Contacts (contact_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Manufacturing_machines ADD CONSTRAINT machine_type_FK
  FOREIGN KEY (machine_type_id) REFERENCES all_manufacturing_machines (machine_type_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Shop_details ADD CONSTRAINT Contact_FK
  FOREIGN KEY (owner_contact) REFERENCES Contacts (contact_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE all_manufacturing_machines ADD CONSTRAINT maintenace_FK
  FOREIGN KEY (maintenance_contact_id) REFERENCES Contacts (contact_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE all_manufacturing_machines ADD CONSTRAINT owner_fk
  FOREIGN KEY (owner_contact_id) REFERENCES Contacts (contact_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE delivery ADD CONSTRAINT driver_fk
  FOREIGN KEY (driver_id) REFERENCES driver_details (driver_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE delivery ADD CONSTRAINT shop_delivery_FK
  FOREIGN KEY (order_id) REFERENCES shop_orders (shop_order_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE driver_details ADD CONSTRAINT contact_fk
  FOREIGN KEY (contact) REFERENCES Contacts (contact_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE employee_type ADD CONSTRAINT fk_employee_type_Department
  FOREIGN KEY (department) REFERENCES Departments (Department) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE material_providers ADD CONSTRAINT material_provider_contact_FK
  FOREIGN KEY (contact_id) REFERENCES Contacts (contact_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE raw_material_orders ADD CONSTRAINT material_provider_FK
  FOREIGN KEY (material_provider_id) REFERENCES material_providers (material_provider_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE raw_material_orders ADD CONSTRAINT raw_material_FK
  FOREIGN KEY (raw_material_id) REFERENCES raw_materials (raw_material_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE sales ADD CONSTRAINT shop_order_FK
  FOREIGN KEY (order_id) REFERENCES shop_orders (shop_order_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE shop_orders ADD CONSTRAINT shop_order_fk
  FOREIGN KEY (shop_id) REFERENCES Shop_details (shop_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE toy_base ADD CONSTRAINT toy_type_FK
  FOREIGN KEY (toy_type) REFERENCES toy_types (toy_type_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE toy_materials ADD CONSTRAINT mat_FK
  FOREIGN KEY (mat_id) REFERENCES raw_materials (raw_material_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE toy_materials ADD CONSTRAINT toy_FK
  FOREIGN KEY (toy_id) REFERENCES toy_base (toy_id) ON DELETE CASCADE ON UPDATE CASCADE;

