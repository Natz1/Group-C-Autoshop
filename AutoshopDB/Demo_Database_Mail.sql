--DATABASE MAILING FUNCTIONALITY***********
Use Car_Mart_Web_App
--Enable Database Mail
sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO

sp_configure 'Database Mail XPs', 1;
GO
RECONFIGURE
GO

-- Create a Database Mail profile  
EXECUTE msdb.dbo.sysmail_add_profile_sp  
    @profile_name = 'DandR_Notifications',  
    @description = 'Profile used for sending outgoing D and R Autoshop notifications using Gmail.' ; 

--Granting permission for the Public User to use the Database Mail Profile
EXECUTE msdb.dbo.sysmail_add_principalprofile_sp  
    @profile_name = 'DandR_Notifications',  
    @principal_name = 'public',  
    @is_default = 1 ;
GO

-- Create a Database Mail Account  
EXECUTE msdb.dbo.sysmail_add_account_sp  
    @account_name = 'Outlook_Account',  
    @description = 'Mail account for sending outgoing notifications.',  
    @email_address = 'dandrautoshop876@outlook.com',  
    @display_name = 'D&R Auto Shop',  
    @mailserver_name = 'smtp.office365.com',
    @port = 587,
    @enable_ssl = 1,
    @username = 'dandrautoshop876@outlook.com',
    @password = 'D&Rauto876' ;  
GO

-- Add the Database Mail Account to the Database Mail Profile  
EXECUTE msdb.dbo.sysmail_add_profileaccount_sp  
    @profile_name = 'DandR_Notifications',  
    @account_name = 'Outlook_Account',  
    @sequence_number =1 ;  
GO

--Test Database Mail Configuration
EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'DandR_Notifications',
@recipients = 'kristoffsamuda1@gmail.com',
@body = 'Hi Kristoff,

The database mail configuration was completed successfully.
Regards,
DandR Autoshop',
@subject = 'Your Verification Code';
GO

--TO ROLLBACK CHANGES MADE FOR THE DATABASE MAIL PROFILE AND ACCOUNT SETUP
--EXECUTE msdb.dbo.sysmail_delete_profileaccount_sp @profile_name = 'DandR_Notifications'
--EXECUTE msdb.dbo.sysmail_delete_principalprofile_sp @profile_name = 'DandR_Notifications'
--EXECUTE msdb.dbo.sysmail_delete_account_sp @account_name = 'Gmail_Account'
--EXECUTE msdb.dbo.sysmail_delete_profile_sp @profile_name = 'DandR_Notifications'

--TO CHECK THE EMAIL LOG FOR ERRORS
--SELECT * FROM msdb.dbo.sysmail_event_log;
