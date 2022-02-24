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
    PositionID int,
    PositionName VARCHAR(255),
    PositionDesc VARCHAR(255)
)

CREATE TABLE Status (
    StatusID int,
    StatusName VARCHAR(255),
    StatusDesc VARCHAR(255)
)

CREATE TABLE ActivityType (
    ActivityTypeID int,
    ActivityTypeName VARCHAR(255),
    ActivityTypeDesc VARCHAR(255)
)

CREATE TABLE OrgType (
    OrgTypeID int,
    OrgTypeName VARCHAR(255),
    OrgTypeDesc VARCHAR(255)
)

CREATE TABLE PartnerDesignation (
    PartnerDesignationID int,
    PartnerDesignationName VARCHAR(255),
    PartnerDesignationDesc VARCHAR(255)
)

CREATE TABLE Team (
    TeamID int,
    TeamName VARCHAR(255),
    TeamDesc VARCHAR(255)
)