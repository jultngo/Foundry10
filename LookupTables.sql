-- These are tables that do not pull information from other tables
-- Essentially the ones that don't have any foreign keys
-- The tables that are needed here are:
-- Position
-- Status
-- ActivityType
-- OrgType
-- PartnerDesignation
-- Team

CREATE TABLE Position (
    PositionID int NOT NULL PRIMARY KEY,
    PositionName VARCHAR(255) NOT NULL,
    PositionDesc VARCHAR(255),
)
DROP TABLE Position;

CREATE TABLE Status (
    StatusID int NOT NULL PRIMARY KEY,
    StatusName VARCHAR(255) NOT NULL,
    StatusDesc VARCHAR(255)
)
DROP TABLE Status;

CREATE TABLE ActivityType (
    ActivityTypeID int NOT NULL PRIMARY KEY,
    ActivityTypeName VARCHAR(255) NOT NULL,
    ActivityTypeDesc VARCHAR(255)
)
DROP TABLE ActivityType;

CREATE TABLE OrgType (
    OrgTypeID int NOT NULL PRIMARY KEY,
    OrgTypeName VARCHAR(255) NOT NULL,
    OrgTypeDesc VARCHAR(255)
)
DROP TABLE OrgType;

CREATE TABLE PartnerDesignation (
    PartnerDesignationID int NOT NULL PRIMARY KEY,
    PartnerDesignationName VARCHAR(255) NOT NULL,
    PartnerDesignationDesc VARCHAR(255)
)
DROP TABLE PartnerDesignation;

CREATE TABLE Team (
    TeamID int NOT NULL PRIMARY KEY,
    TeamName VARCHAR(255) NOT NULL,
    TeamDesc VARCHAR(255)
)
DROP TABLE Team;