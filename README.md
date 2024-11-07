# Welcome to your Data Engineer project

## Estrutura do Projeto em Docker

projeto_docker/
├── docker-compose.yml                
├── volumes/                          
│   ├── mysql/
│   │   ├── data/                     
│   │   └── backups/                  
│   ├── sqlserver/
│   │   ├── sqlserver_data/           
│   │   ├── sqlserver_log/            
│   │   ├── sqlserver_secrets/        
│   │   └── backups/                  
│   └── postgres/
│       ├── data/                     
│       └── backups/                  
├── deploy/                           
│   ├── init_mysql/                   
│   │   └── init.sql                  
│   ├── init_sqlserver/               
│   │   └── init.sql                  
│   └── init_postgres/                
│       └── init.sql                  
└── backup_bancos.bat                 


Follow these steps:

```sh
# Step 1: Clone the repository using the project's Git URL.
git clone <YOUR_GIT_URL>

# Step 2: Navigate to the project directory.
cd <YOUR_PROJECT_NAME>

# Step 3: Install the necessary dependencies.
npm i

# Step 4: Start the development server with auto-reloading and an instant preview.
docker compose -p projeto_bancos -f docker-compose.yml up -d



**Explicação dos Diretórios e Arquivos**
docker-compose.yml:

O arquivo principal para definir e orquestrar os contêineres, incluindo MySQL, SQL Server e PostgreSQL, além das redes e volumes necessários.
volumes/:

Diretório principal para armazenamento de dados persistentes e backups para cada banco de dados.

volumes/mysql:

data/: Armazena os dados do MySQL.
backups/: Guarda os backups do MySQL, que serão gerados pelo script de backup.
volumes/sqlserver:

sqlserver_data/: Armazena os dados do SQL Server.
sqlserver_log/: Guarda os logs do SQL Server.
sqlserver_secrets/: Para armazenar secrets, como certificados ou chaves.
backups/: Guarda os backups do SQL Server.
volumes/postgres:

data/: Armazena os dados do PostgreSQL.
backups/: Guarda os backups do PostgreSQL.
deploy/:

Contém scripts de inicialização para cada serviço.
init_mysql: Scripts SQL executados automaticamente na primeira inicialização do MySQL.
init_sqlserver: Scripts SQL executados automaticamente na primeira inicialização do SQL Server.
init_postgres: Scripts SQL executados automaticamente na primeira inicialização do PostgreSQL.
backup_bancos.bat:

Script em Batch que realiza o backup de todos os bancos de dados e salva os arquivos nas pastas de backup de cada serviço.
Criando o Sistema no Docker
Para começar a usar essa estrutura, você deve:

Criar o Diretório e Arquivos:

No seu sistema, crie a pasta projeto_docker e as subpastas conforme a estrutura acima.
Editar o Arquivo docker-compose.yml:

Coloque o conteúdo do docker-compose.yml no diretório raiz (projeto_docker), definindo todos os serviços conforme os requisitos (incluindo as novas variáveis e volumes específicos).

Configurar Backups com o Script backup_bancos.bat:

Coloque o arquivo backup_bancos.bat no diretório raiz do projeto.
Para automação, use o Agendador de Tarefas do Windows para executar o backup periodicamente.
Essa estrutura deve fornecer uma base bem organizada e modular para gerenciar facilmente os três bancos de dados em contêineres Docker.
