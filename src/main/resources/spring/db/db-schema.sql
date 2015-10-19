CREATE TABLE CONTACT_INFORMATION  (
	ID VARCHAR(100) NOT NULL PRIMARY KEY,
	FIRST_NAME VARCHAR(100),
	LAST_NAME VARCHAR(100),
	PHONE VARCHAR(100),
	EMAIL VARCHAR(100),
	ADDRESS VARCHAR(100),
	ZIP VARCHAR(100),
	CITY VARCHAR(100),
	COUNTRY VARCHAR(100)
) ;

CREATE TABLE BIOBANK  (
	ID VARCHAR(100) NOT NULL PRIMARY KEY,
	ACRONYM VARCHAR(100),
	NAME VARCHAR(100),
	URL VARCHAR(100),
	JURISTIC_PERSON VARCHAR(100),
	COUNTRY VARCHAR(100),
	DESCRIPTION CLOB(1000),
	CONTACT_INFORMATION VARCHAR(100),
	CONSTRAINT BIOBANK_CONTACT_INFORMATION_FK FOREIGN KEY (CONTACT_INFORMATION) REFERENCES CONTACT_INFORMATION(ID)
) ;

CREATE TABLE SAMPLE_COLLECTION  (
	ID VARCHAR(100) NOT NULL PRIMARY KEY,
	ACRONYM VARCHAR(100),
	NAME VARCHAR(100),
	DESCRIPTION CLOB(1000),
	DATA_CATEGORY VARCHAR(800),
	COLLECTION_TYPE VARCHAR(100),
	CONTACT_INFORMATION VARCHAR(100),
	CONSTRAINT SAMPLE_COLLECTION_CONTACT_INFORMATION_FK FOREIGN KEY (CONTACT_INFORMATION) REFERENCES CONTACT_INFORMATION(ID)
) ;

CREATE TABLE STUDY  (
	ID VARCHAR(100) NOT NULL PRIMARY KEY,
	NAME VARCHAR(100),
	DESCRIPTION CLOB(1000),
	STUDY_DESIGN VARCHAR(100),
	DATA_CATEGORY VARCHAR(100),
	TOTAL_NUMBER_OF_PARTICIPANTS VARCHAR(100),
	TOTAL_NUMBER_OF_DONORS VARCHAR(100),
	INCLUSION_CRITERIA VARCHAR(100),
	CONTACT_INFORMATION VARCHAR(100),
	PRINCIPAL_INVESTIGATOR VARCHAR(100),
	CONSTRAINT STUDY_CONTACT_INFORMATION_FK FOREIGN KEY (CONTACT_INFORMATION) REFERENCES CONTACT_INFORMATION(ID),
	CONSTRAINT STUDY_PRINCIPAL_INVESTIGATOR_FK FOREIGN KEY (PRINCIPAL_INVESTIGATOR) REFERENCES CONTACT_INFORMATION(ID)
) ;

CREATE TABLE SAMPLE  (
	ID VARCHAR(100) NOT NULL PRIMARY KEY,
	PARENT_SAMPLE_ID VARCHAR(100),
	MATERIAL_TYPE VARCHAR(800),
	CONTAINER VARCHAR(100),
	STORAGE_TEMPERATURE VARCHAR(100),
	SAMPLED_TIME VARCHAR(100),
	
	ANATOMICAL_SITE_ONTOLOGY VARCHAR(100),
	ANATOMICAL_SITE_VERSION VARCHAR(100),
	ANATOMICAL_SITE_CODE VARCHAR(100),
	ANATOMICAL_SITE_DESCRIPTION CLOB(1000),
	
	ONTOLOGY_ONTOLOGY VARCHAR(100),
	ONTOLOGY_VERSION VARCHAR(100),
	ONTOLOGY_CODE VARCHAR(100),
	ONTOLOGY_DESCRIPTION CLOB(1000),
	ONTOLOGY_FREE_TEXT CLOB(1000),
	
	SEX VARCHAR(100),
	AGE_LOW VARCHAR(100),
	AGE_HIGH VARCHAR(100),
	AGE_UNIT VARCHAR(100),
	
	BIOBANK VARCHAR(100),
	SAMPLE_COLLECTION VARCHAR(100),
	STUDY VARCHAR(100),
	CONSTRAINT SAMPLE_BIOBANK_FK FOREIGN KEY (BIOBANK) REFERENCES BIOBANK(ID),
	CONSTRAINT SAMPLE_SAMPLE_COLLECTION_FK FOREIGN KEY (SAMPLE_COLLECTION) REFERENCES SAMPLE_COLLECTION(ID),
	CONSTRAINT SAMPLE_STUDY_FK FOREIGN KEY (STUDY) REFERENCES STUDY(ID)
) ;