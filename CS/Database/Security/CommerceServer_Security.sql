IF OBJECT_ID('tempdb..#CSSecurity') IS NOT NULL
BEGIN
	DROP TABLE #CSSecurity
END

SET NOCOUNT ON

CREATE TABLE #CSSecurity (
	DatabaseName varchar(100),
	UserName varchar(100),
	RoleName varchar(100)
)

/* MSCS Catalog Scratch Database */
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG_SCRATCH)', '$(CS_USER_CATALOG)', 'db_ddladmin')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG_SCRATCH)', '$(CS_USER_CATALOG)', 'db_datareader')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG_SCRATCH)', '$(CS_USER_CATALOG)', 'db_datawriter')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG_SCRATCH)', '$(CS_USER_ORDERS)', 'db_ddladmin')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG_SCRATCH)', '$(CS_USER_ORDERS)', 'db_datareader')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG_SCRATCH)', '$(CS_USER_ORDERS)', 'db_datawriter')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG_SCRATCH)', '$(CS_USER_FOUNDATION)', 'db_ddladmin')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG_SCRATCH)', '$(CS_USER_FOUNDATION)', 'db_datareader')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG_SCRATCH)', '$(CS_USER_FOUNDATION)', 'db_datawriter')

/* MSCS Admin Database */
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ADMIN)', '$(CS_USER_CATALOG)', 'admin_reader_role')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ADMIN)', '$(CS_USER_MARKETING)', 'admin_reader_role')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ADMIN)', '$(CS_USER_ORDERS)', 'admin_reader_role')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ADMIN)', '$(CS_USER_PROFILES)', 'admin_reader_role')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ADMIN)', '$(CS_USER_FOUNDATION)', 'admin_reader_role')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ADMIN)', '$(CS_USER_FOUNDATION)', 'admin_cache_poller_role')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ADMIN)', '$(CS_USER_CATALOG)', 'admin_cache_poller_role')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ADMIN)', '$(CS_USER_MARKETING)', 'admin_cache_poller_role')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ADMIN)', '$(CS_USER_PROFILES)', 'admin_cache_poller_role')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ADMIN)', '$(CS_USER_ORDERS)', 'admin_cache_poller_role')

/* Marketing Database */
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_MARKETING)', '$(CS_USER_MARKETING)', 'mktg_MarketingService_role')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_MARKETING)', '$(CS_USER_MARKETING)', 'mktg_promoCodeGenerator_role')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_MARKETING)', '$(CS_USER_ORDERS)', 'mktg_runtime_role')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_MARKETING)', '$(CS_USER_FOUNDATION)', 'mktg_runtime_role')

/* Marketing Lists Database */
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_MARKETING_LISTS)', '$(CS_USER_MARKETING)', 'db_owner')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_MARKETING_LISTS)', '$(CS_USER_FOUNDATION)', 'db_datareader')

/* Product Catalog Database */
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_CATALOG)', 'ctlg_CatalogWriterRole')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_CATALOG)', 'db_ddladmin')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_CATALOG)', 'db_securityadmin')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_CATALOG)', 'Inventory_ReaderRole')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_CATALOG)', 'Inventory_WriterRole')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_CATALOG)', 'db_datareader')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_CATALOG)', 'db_datawriter')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_ORDERS)', 'ctlg_catalogReaderRole')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_ORDERS)', 'Inventory_ReaderRole')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_FOUNDATION)', 'ctlg_catalogReaderRole')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_FOUNDATION)', 'ctlg_CatalogWriterRole')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_FOUNDATION)', 'Inventory_RuntimeRole')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_FOUNDATION)', 'db_ddladmin')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_FOUNDATION)', 'db_securityadmin')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_FOUNDATION)', 'Inventory_ReaderRole')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_FOUNDATION)', 'Inventory_WriterRole')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_FOUNDATION)', 'db_datareader')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_FOUNDATION)', 'db_datawriter')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_MARKETING)', 'db_datareader')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_PROFILES)', 'ctlg_CatalogWriterRole')

/* Profiles Database */
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_PROFILES)', '$(CS_USER_MARKETING)', 'Profile_Reader')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_PROFILES)', '$(CS_USER_MARKETING)', 'Profile_Schema_Reader')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_CATALOG)', '$(CS_USER_MARKETING)', 'ctlg_catalogReaderRole')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_PROFILES)', '$(CS_USER_ORDERS)', 'Profile_Reader')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_PROFILES)', '$(CS_USER_ORDERS)', 'Profile_Schema_Reader')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_PROFILES)', '$(CS_USER_PROFILES)', 'Profile_Schema_Manager')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_PROFILES)', '$(CS_USER_PROFILES)', 'Profile_Runtime')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_PROFILES)', '$(CS_USER_FOUNDATION)', 'Profile_Schema_Reader')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_PROFILES)', '$(CS_USER_FOUNDATION)', 'Profile_Runtime')

/* Transaction Config Database */
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ORDERS_CONFIG)', '$(CS_USER_ORDERS)', 'Orders_Management')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ORDERS_CONFIG)', '$(CS_USER_FOUNDATION)', 'Orders_Runtime')

/* Transaction Database */
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ORDERS)', '$(CS_USER_ORDERS)', 'Orders_Management')
INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ORDERS)', '$(CS_USER_ORDERS)', 'Orders_Runtime')

INSERT INTO #CSSecurity VALUES ('$(CS_DB_NAME_ORDERS)', '$(CS_USER_FOUNDATION)', 'Orders_Runtime')

GO

DECLARE @databaseName VARCHAR(100)
DECLARE @userName VARCHAR(100)
DECLARE @roleName VARCHAR(100)
DECLARE @dynamicSQL VARCHAR(MAX)

DECLARE db_cursor CURSOR FOR  
SELECT DatabaseName, UserName, RoleName
FROM #CSSecurity

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @databaseName, @userName, @roleName   

WHILE @@FETCH_STATUS = 0   
BEGIN   
	USE [master]
	
	/* If the user does not exist as a login, add it to the system security */	
	IF NOT EXISTS(SELECT name FROM master.dbo.syslogins WHERE name = @userName)
	BEGIN
		PRINT 'Creating login ' + @userName
		EXEC( 'CREATE LOGIN [' + @userName + '] FROM WINDOWS' )
	END
	
	
	SET @dynamicSQL = 'USE [' + @databaseName + ']; ' +
		'DECLARE @isLogin bit;' +
		'IF  NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = ''' + @userName + ''') ' +
		'BEGIN ' +
			'PRINT ''Creating user ' + @userName + '''; ' +
			' CREATE USER [' + @userName + '] FOR LOGIN [' + @userName + '];' +
		'END ' +
		'EXECUTE AS LOGIN = ''' + @userName + ''';' +
			'SET @isLogin = IS_MEMBER(''' + @roleName + ''');' +
		'REVERT;' +
		
		'IF @isLogin = 0 ' +
		'BEGIN ' +
			'PRINT ''Adding user ' + @userName + ' to role ' + @roleName + ''';' +
			'EXEC sp_addrolemember ''' + @roleName + ''', ''' + @userName + ''';' +
		'END;'
	EXEC( @dynamicSQL)
	
	FETCH NEXT FROM db_cursor INTO @databaseName, @userName, @roleName   
END

CLOSE db_cursor   
DEALLOCATE db_cursor
