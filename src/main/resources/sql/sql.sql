CREATE TABLE MEMBER2 (
                         MEMBER_NO NUMBER(10) PRIMARY KEY,
                         MEMBER_ID VARCHAR2(50) UNIQUE NOT NULL,
                         MEMBER_PWD VARCHAR2(100) NOT NULL,
                         MEMBER_ADDRESS VARCHAR2(100) NOT NULL,
                         MEMBER_EMAIL VARCHAR2(50) NOT NULL,
                         MEMBER_PHONE VARCHAR2(50) NOT NULL,
                         MEMBER_NAME VARCHAR2(50) NOT NULL,
                         MEMBER_GRADE VARCHAR2(10) NOT NULL,
                         MEMBER_DATE TIMESTAMP
);

CREATE SEQUENCE MEMBER_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    NOCACHE
    NOCYCLE;



CREATE SEQUENCE book_seq START WITH 1 INCREMENT BY 1;
drop table book;
CREATE TABLE book (
                      book_no NUMBER(38) PRIMARY KEY,
                      book_name VARCHAR2(50),
                      book_quantity NUMBER(38),
                      book_price NUMBER(38),
                      book_author VARCHAR2(50),
                      book_publisher VARCHAR2(50)
);


CREATE SEQUENCE product_SEQ
    START WITH 1
    INCREMENT BY 1;


CREATE TABLE product (
                         product_num NUMBER PRIMARY KEY,
                         product_title VARCHAR2(1000),
                         product_subtitle VARCHAR2(1000),
                         product_writer VARCHAR2(1000),
                         product_price VARCHAR2(1000),
                         product_img VARCHAR2(4000),
                         product_date DATE,
                         product_page VARCHAR2(1000),
                         product_code CLOB,
                         product_stock NUMBER default 10,
                         product_sale NUMBER default 1,
                         product_visit NUMBER default 1
);

CREATE SEQUENCE job_info_SEQ
    START WITH 1
    INCREMENT BY 1;


CREATE TABLE job_info(
                         job_info_num NUMBER PRIMARY KEY,
                         job_info_Field VARCHAR2(1000),
                         job_info_company_name VARCHAR2(1000),
                         job_info_posting_name VARCHAR2(1000),
                         job_info_field_tag_list VARCHAR2(1000),
                         job_info_Qualification VARCHAR2(1000),
                         job_info_work_type VARCHAR2(1000),
                         job_info_work_area VARCHAR2(1000),
                         job_info_Deadline VARCHAR2(1000),
                         job_info_page_code CLOB,
                         job_info_link VARCHAR2(4000)
);

CREATE TABLE companyScrap (
                              MEMBER_NO NUMBER(10),
                              companyName VARCHAR2(1000),
                              scrap_time DATE,
                              CONSTRAINT fk_MEMBER_NO_CS FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER2(MEMBER_NO)
);

CREATE TABLE InfScrap (
                              MEMBER_NO NUMBER(10),
                              infoname VARCHAR2(4000),
                              scrap_time DATE,
                              CONSTRAINT fk_MEMBER_NO_IS FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER2(MEMBER_NO)
);
