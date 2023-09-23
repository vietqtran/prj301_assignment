
CREATE PROCEDURE [dbo].[AddUser] (
    @username NVARCHAR(255),
    @password NVARCHAR(255),
    @firstName NVARCHAR(255),
    @lastName NVARCHAR(255),
    @email NVARCHAR(255),
    @phone NVARCHAR(255),
    @role INT,
    @avatar NVARCHAR(255)
)
AS
BEGIN
    INSERT INTO users(username, [password], firstName, lastName, email, phone, role, avatar)
    VALUES(@username, @password, @firstName, @lastName, @email, @phone, @role, @avatar)
END