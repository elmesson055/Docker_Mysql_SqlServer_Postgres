@echo off
set DIR=%~dp0
set TIMESTAMP=%DATE:~-4,4%-%DATE:~-7,2%-%DATE:~-10,2%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%

:: Diretórios de backup
set MYSQL_BACKUP_DIR=%DIR%volumes\mysql\backups
set SQLSERVER_BACKUP_DIR=%DIR%volumes\sqlserver\backups
set POSTGRES_BACKUP_DIR=%DIR%volumes\postgres\backups

:: Cria diretórios de backup, se não existirem
mkdir "%MYSQL_BACKUP_DIR%"
mkdir "%SQLSERVER_BACKUP_DIR%"
mkdir "%POSTGRES_BACKUP_DIR%"

:: Backup do MySQL
echo Realizando backup do MySQL...
docker exec servidor_mysql /bin/sh -c "mysqldump -u root -pRs5kD85DQk6 --all-databases > /backups/mysql_backup_%TIMESTAMP%.sql"
move "%MYSQL_BACKUP_DIR%\mysql_backup_*.sql" "%MYSQL_BACKUP_DIR%"

:: Backup do SQL Server
echo Realizando backup do SQL Server...
docker exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P SuaSenhaForteAqui -Q "BACKUP DATABASE [master] TO DISK = N'/backups/sqlserver_backup_%TIMESTAMP%.bak'"
move "%SQLSERVER_BACKUP_DIR%\sqlserver_backup_*.bak" "%SQLSERVER_BACKUP_DIR%"

:: Backup do PostgreSQL
echo Realizando backup do PostgreSQL...
docker exec servidor_postgres /bin/sh -c "PGPASSWORD=2Rs5kD85DQk6 pg_dump -U user2 -d meubancodedados > /backups/postgres_backup_%TIMESTAMP%.sql"
move "%POSTGRES_BACKUP_DIR%\postgres_backup_*.sql" "%POSTGRES_BACKUP_DIR%"

echo Backups concluídos com sucesso.
pause
