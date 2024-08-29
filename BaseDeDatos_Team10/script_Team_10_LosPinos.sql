CREATE DATABASE db_LosPinos;

USE db_LosPinos;

CREATE TABLE category (
    category_id int  NOT NULL,
    category_name varchar(30)  NOT NULL,
    description varchar(70)  NOT NULL,
    CONSTRAINT categoria_pk PRIMARY KEY  (category_id)
);

-- Table: coustomer
CREATE TABLE coustomer (
    coustomer_id int  NOT NULL,
    name varchar(70)  NOT NULL,
    lastName varchar(30)  NOT NULL,
    document_type varchar(20)  NOT NULL,
    document_number varchar(20)  NOT NULL,
    phone char(9)  NOT NULL,
    email varchar(70)  NOT NULL,
    date_registration datetime  NOT NULL,
    address varchar(40)  NOT NULL,
    state char(1)  NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY  (coustomer_id)
);

-- Table: dishes
CREATE TABLE dishes (
    dish_id int  NOT NULL,
    name varchar(60)  NOT NULL,
    description varchar(100)  NOT NULL,
    price decimal(10,2)  NOT NULL,
    availability varchar(25)  NOT NULL,
    category_id int  NOT NULL,
    category_id_category int  NOT NULL,
    CONSTRAINT platos_pk PRIMARY KEY  (dish_id)
);

-- Table: order
CREATE TABLE "order" (
    id_dish int  NOT NULL,
    order_date datetime  NOT NULL,
    total decimal(10,2)  NOT NULL,
    order_type varchar(20)  NOT NULL,
    order_status char(1)  NOT NULL,
    id_client int  NOT NULL,
    id_waiter int  NOT NULL,
    id_table int  NOT NULL,
    tables_id_table int  NOT NULL,
    waiters_id_waiter int  NOT NULL,
    cliente_id_cliente int  NOT NULL,
    CONSTRAINT pedidos_pk PRIMARY KEY  (id_dish)
);

-- Table: order_detail
CREATE TABLE order_detail (
    id_order_detail int  NOT NULL,
    amount int  NOT NULL,
    unit_price decimal(10,2)  NOT NULL,
    total decimal(10,2)  NOT NULL,
    id_dish int  NOT NULL,
    id_order int  NOT NULL,
    order_id_order int  NOT NULL,
    dishes_id_dish int  NOT NULL,
    CONSTRAINT detalle_pedido_pk PRIMARY KEY  (id_order_detail)
);

-- Table: pay
CREATE TABLE pay (
    pay_id int  NOT NULL,
    amount decimal(10,2)  NOT NULL,
    payment_date datetime  NOT NULL,
    id_order int  NOT NULL,
    orders_id_order int  NOT NULL,
    method_pay_method_pay int  NOT NULL,
    CONSTRAINT pago_pk PRIMARY KEY  (pay_id)
);

-- Table: payment_method
CREATE TABLE payment_method (
    id_payment_method int  NOT NULL,
    name varchar(70)  NOT NULL,
    description varchar(70)  NOT NULL,
    CONSTRAINT metodo_pago_pk PRIMARY KEY  (id_payment_method)
);

-- Table: tables
CREATE TABLE tables (
    id_table int  NOT NULL,
    table_number int  NOT NULL,
    ability int  NOT NULL,
    status varchar(25)  NOT NULL,
    CONSTRAINT mesas_pk PRIMARY KEY  (id_table)
);

-- Table: waiters
CREATE TABLE waiters (
    id_waiter int  NOT NULL,
    name varchar(70)  NOT NULL,
    last_name varchar(70)  NOT NULL,
    phone char(9)  NOT NULL,
    email varchar(70)  NOT NULL,
    hiring_date datetime  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT meseros_pk PRIMARY KEY  (id_waiter)
);

-- foreign keys
-- Reference: detalle_pedido_pedidos (table: order_detail)
ALTER TABLE order_detail ADD CONSTRAINT detalle_pedido_pedidos
    FOREIGN KEY (order_id_order)
    REFERENCES "order" (id_dish);

-- Reference: detalle_pedido_platos (table: order_detail)
ALTER TABLE order_detail ADD CONSTRAINT detalle_pedido_platos
    FOREIGN KEY (dishes_id_dish)
    REFERENCES dishes (dish_id);

-- Reference: pago_metodo_pago (table: pay)
ALTER TABLE pay ADD CONSTRAINT pago_metodo_pago
    FOREIGN KEY (method_pay_method_pay)
    REFERENCES payment_method (id_payment_method);

-- Reference: pago_pedidos (table: pay)
ALTER TABLE pay ADD CONSTRAINT pago_pedidos
    FOREIGN KEY (orders_id_order)
    REFERENCES "order" (id_dish);

-- Reference: pedidos_cliente (table: order)
ALTER TABLE "order" ADD CONSTRAINT pedidos_cliente
    FOREIGN KEY (cliente_id_cliente)
    REFERENCES coustomer (coustomer_id);

-- Reference: pedidos_mesas (table: order)
ALTER TABLE "order" ADD CONSTRAINT pedidos_mesas
    FOREIGN KEY (tables_id_table)
    REFERENCES tables (id_table);

-- Reference: pedidos_meseros (table: order)
ALTER TABLE "order" ADD CONSTRAINT pedidos_meseros
    FOREIGN KEY (waiters_id_waiter)
    REFERENCES waiters (id_waiter);

-- Reference: platos_categoria (table: dishes)
ALTER TABLE dishes ADD CONSTRAINT platos_categoria
    FOREIGN KEY (category_id_category)
    REFERENCES category (category_id);

-- sequences
-- Sequence: categoria_seq
CREATE SEQUENCE categoria_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: cliente_seq
CREATE SEQUENCE cliente_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: detalle_pedido_seq
CREATE SEQUENCE detalle_pedido_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: mesas_seq
CREATE SEQUENCE mesas_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: meseros_seq
CREATE SEQUENCE meseros_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: metodo_pago_seq
CREATE SEQUENCE metodo_pago_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: pago_seq
CREATE SEQUENCE pago_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: pedidos_seq
CREATE SEQUENCE pedidos_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: platos_seq
CREATE SEQUENCE platos_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.