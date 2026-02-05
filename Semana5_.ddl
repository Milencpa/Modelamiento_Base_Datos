-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2026-02-05 00:47:10 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE boleta (
    id_boleta                          NUMBER(10) NOT NULL,
    fecha_venta                        DATE NOT NULL,
    monto_total                        NUMBER(10) NOT NULL,
    cliente_id_cliente                 NUMBER(10) NOT NULL,
    cliente_id_comuna                  NUMBER(10) NOT NULL,
    cliente_id_region                  NUMBER(10) NOT NULL,
    producto_id_producto               NUMBER(10) NOT NULL,
    producto_id_proovedor              NUMBER(10) NOT NULL,
    producto_id_comuna                 NUMBER(10) NOT NULL,
    producto_id_region                 NUMBER(10) NOT NULL,
    producto_modelo_id_modelo          NUMBER(10) NOT NULL,
    producto_modelo_marca_id_marca     NUMBER(10) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    producto_categoria_id_categoria    NUMBER(10) NOT NULL,
    producto_sucursal_id_sucursal      NUMBER(10) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    producto_sucursal_comuna_id_comuna NUMBER(10) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    producto_sucursal_comuna_id_region NUMBER(10) NOT NULL
);

ALTER TABLE boleta
    ADD CONSTRAINT boleta_pk PRIMARY KEY ( id_boleta,
                                           cliente_id_cliente,
                                           cliente_id_comuna,
                                           cliente_id_region,
                                           producto_id_producto,
                                           producto_id_proovedor,
                                           producto_id_comuna,
                                           producto_id_region,
                                           producto_modelo_id_modelo,
                                           producto_modelo_marca_id_marca,
                                           producto_categoria_id_categoria,
                                           producto_sucursal_id_sucursal,
                                           producto_sucursal_comuna_id_comuna,
                                           producto_sucursal_comuna_id_region );

CREATE TABLE categoria (
    id_categoria     NUMBER(10) NOT NULL,
    nombre_categoria VARCHAR2(50) NOT NULL,
    stock_bodega     NUMBER(5)
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE cliente (
    id_cliente              NUMBER(10) NOT NULL,
    nombre                  VARCHAR2(50) NOT NULL,
    apellido_paterno        VARCHAR2(50) NOT NULL,
    apellido_materno        VARCHAR2(100),
    comuna_id_comuna        NUMBER(10) NOT NULL,
    comuna_region_id_region NUMBER(10) NOT NULL
);

ALTER TABLE cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente,
                                            comuna_id_comuna,
                                            comuna_region_id_region );

CREATE TABLE comuna (
    id_comuna        NUMBER(10) NOT NULL,
    nombre_comuna    VARCHAR2(50) NOT NULL,
    region_id_region NUMBER(10) NOT NULL
);

ALTER TABLE comuna ADD CONSTRAINT comuna_pk PRIMARY KEY ( id_comuna,
                                                          region_id_region );

CREATE TABLE detalle_boleta (
    cantidad NUMBER(5) NOT NULL
);

CREATE TABLE inventario_sucursal (
    stock_sucursal         NUMBER(5) NOT NULL,
    id_inventario          NUMBER(1000),
    inventario_sucursal_id NUMBER NOT NULL
);

ALTER TABLE inventario_sucursal ADD CONSTRAINT inventario_sucursal_pk PRIMARY KEY ( inventario_sucursal_id );

CREATE TABLE marca (
    id_marca     NUMBER(10) NOT NULL,
    nombre_marca VARCHAR2(50) NOT NULL
);

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( id_marca );

CREATE TABLE modelo (
    id_modelo      NUMBER(10) NOT NULL,
    nombre_modelo  VARCHAR2(50) NOT NULL,
    marca_id_marca NUMBER(10) NOT NULL
);

ALTER TABLE modelo ADD CONSTRAINT modelo_pk PRIMARY KEY ( id_modelo,
                                                          marca_id_marca );

CREATE TABLE producto (
    id_producto                       NUMBER(10) NOT NULL,
    codigo_producto                   NUMBER(10) NOT NULL,
    fecha_vencimiento                 DATE,
    descripcion                       VARCHAR2(150),
    precio_unitario                   NUMBER(10) NOT NULL,
    stock_actual                      NUMBER(10) NOT NULL,
    proveedor_id_proovedor            NUMBER(10) NOT NULL,
    modelo_id_modelo                  NUMBER(10) NOT NULL,
    modelo_marca_id_marca             NUMBER(10) NOT NULL,
    categoria_id_categoria            NUMBER(10) NOT NULL,
    proveedor_comuna_id_comuna        NUMBER(10) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    proveedor_comuna_region_id_region NUMBER(10) NOT NULL,
    sucursal_id_sucursal              NUMBER(10) NOT NULL,
    sucursal_comuna_id_comuna         NUMBER(10) NOT NULL,
    sucursal_comuna_id_region         NUMBER(10) NOT NULL
);

ALTER TABLE producto
    ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto,
                                             proveedor_id_proovedor,
                                             proveedor_comuna_id_comuna,
                                             proveedor_comuna_region_id_region,
                                             modelo_id_modelo,
                                             modelo_marca_id_marca,
                                             categoria_id_categoria,
                                             sucursal_id_sucursal,
                                             sucursal_comuna_id_comuna,
                                             sucursal_comuna_id_region );

-- Error - Unique Constraint PRODUCTO.PRODUCTO__UN doesn't have columns

CREATE TABLE proovedor_empresa (
    id_proovedor NUMBER(10) NOT NULL,
    rut_empresa  NUMBER(12) NOT NULL,
    sitio_web    VARCHAR2(150),
    id_region    NUMBER(10) NOT NULL,
    id_comuna    NUMBER(10) NOT NULL
);

ALTER TABLE proovedor_empresa
    ADD CONSTRAINT proovedor_empresa_pk PRIMARY KEY ( id_proovedor,
                                                      id_comuna,
                                                      id_region );

CREATE TABLE proovedor_persona (
    id_proovedor     NUMBER(10) NOT NULL,
    nombre           VARCHAR2(50) NOT NULL,
    apellido_paterno VARCHAR2(50) NOT NULL,
    apellido_materno VARCHAR2(50) NOT NULL,
    id_comuna        NUMBER(10) NOT NULL,
    id_region        NUMBER(10) NOT NULL,
    rut_persona      NUMBER(12) NOT NULL
);

ALTER TABLE proovedor_persona
    ADD CONSTRAINT proovedor_persona_pk PRIMARY KEY ( id_proovedor,
                                                      id_comuna,
                                                      id_region );

CREATE TABLE PROVEEDOR 
    (
    id_proovedor   NUMBER(10) NOT NULL,
    tipo_proovedor CHAR (E,P CHAR)  NOT NULL,
    mail VARCHAR2(100) NOT NULL,
    telefono NUMBER(11) NOT NULL,
    comuna_id_comuna NUMBER(10) NOT NULL,
    comuna_region_id_region NUMBER(10) NOT NULL
) 
;

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id_proovedor,
                                              comuna_id_comuna,
                                              comuna_region_id_region );

CREATE TABLE region (
    id_region     NUMBER(10) NOT NULL,
    nombre_region VARCHAR2(50) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( id_region );

CREATE TABLE sucursal (
    id_sucursal      NUMBER(10) NOT NULL,
    nombre_sucursal  VARCHAR2(100) NOT NULL,
    direccion        VARCHAR2(150) NOT NULL,
    comuna_id_comuna NUMBER(10) NOT NULL,
    comuna_id_region NUMBER(10) NOT NULL
);

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_pk PRIMARY KEY ( id_sucursal,
                                             comuna_id_comuna,
                                             comuna_id_region );

ALTER TABLE boleta
    ADD CONSTRAINT boleta_cliente_fk FOREIGN KEY ( cliente_id_cliente,
                                                   cliente_id_comuna,
                                                   cliente_id_region )
        REFERENCES cliente ( id_cliente,
                             comuna_id_comuna,
                             comuna_region_id_region );

ALTER TABLE boleta
    ADD CONSTRAINT boleta_producto_fk FOREIGN KEY ( producto_id_producto,
                                                    producto_id_proovedor,
                                                    producto_id_comuna,
                                                    producto_id_region,
                                                    producto_modelo_id_modelo,
                                                    producto_modelo_marca_id_marca,
                                                    producto_categoria_id_categoria,
                                                    producto_sucursal_id_sucursal,
                                                    producto_sucursal_comuna_id_comuna,
                                                    producto_sucursal_comuna_id_region )
        REFERENCES producto ( id_producto,
                              proveedor_id_proovedor,
                              proveedor_comuna_id_comuna,
                              proveedor_comuna_region_id_region,
                              modelo_id_modelo,
                              modelo_marca_id_marca,
                              categoria_id_categoria,
                              sucursal_id_sucursal,
                              sucursal_comuna_id_comuna,
                              sucursal_comuna_id_region );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_comuna_fk FOREIGN KEY ( comuna_id_comuna,
                                                   comuna_region_id_region )
        REFERENCES comuna ( id_comuna,
                            region_id_region );

ALTER TABLE comuna
    ADD CONSTRAINT comuna_region_fk FOREIGN KEY ( region_id_region )
        REFERENCES region ( id_region );

ALTER TABLE modelo
    ADD CONSTRAINT modelo_marca_fk FOREIGN KEY ( marca_id_marca )
        REFERENCES marca ( id_marca );

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_id_categoria )
        REFERENCES categoria ( id_categoria );

ALTER TABLE producto
    ADD CONSTRAINT producto_modelo_fk FOREIGN KEY ( modelo_id_modelo,
                                                    modelo_marca_id_marca )
        REFERENCES modelo ( id_modelo,
                            marca_id_marca );

ALTER TABLE producto
    ADD CONSTRAINT producto_proveedor_fk FOREIGN KEY ( proveedor_id_proovedor,
                                                       proveedor_comuna_id_comuna,
                                                       proveedor_comuna_region_id_region )
        REFERENCES proveedor ( id_proovedor,
                               comuna_id_comuna,
                               comuna_region_id_region );

ALTER TABLE producto
    ADD CONSTRAINT producto_sucursal_fk FOREIGN KEY ( sucursal_id_sucursal,
                                                      sucursal_comuna_id_comuna,
                                                      sucursal_comuna_id_region )
        REFERENCES sucursal ( id_sucursal,
                              comuna_id_comuna,
                              comuna_id_region );

ALTER TABLE proovedor_empresa
    ADD CONSTRAINT proovedor_empresa_proveedor_fk FOREIGN KEY ( id_proovedor,
                                                                id_comuna,
                                                                id_region )
        REFERENCES proveedor ( id_proovedor,
                               comuna_id_comuna,
                               comuna_region_id_region );

ALTER TABLE proovedor_persona
    ADD CONSTRAINT proovedor_persona_proveedor_fk FOREIGN KEY ( id_proovedor,
                                                                id_comuna,
                                                                id_region )
        REFERENCES proveedor ( id_proovedor,
                               comuna_id_comuna,
                               comuna_region_id_region );

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_comuna_fk FOREIGN KEY ( comuna_id_comuna,
                                                     comuna_region_id_region )
        REFERENCES comuna ( id_comuna,
                            region_id_region );

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_comuna_fk FOREIGN KEY ( comuna_id_comuna,
                                                    comuna_id_region )
        REFERENCES comuna ( id_comuna,
                            region_id_region );

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated

--  ERROR: No Discriminator Column found in Arc Arc_3 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc Arc_3 - constraint trigger for Arc cannot be generated

CREATE SEQUENCE inventario_sucursal_inventario START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER inventario_sucursal_inventario BEFORE
    INSERT ON inventario_sucursal
    FOR EACH ROW
    WHEN ( new.inventario_sucursal_id IS NULL )
BEGIN
    :new.inventario_sucursal_id := inventario_sucursal_inventario.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   9
-- WARNINGS                                 0
