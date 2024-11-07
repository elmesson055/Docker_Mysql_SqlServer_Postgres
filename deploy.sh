#!/bin/bash

# Variáveis de ambiente para configurações adicionais
PROJECT_NAME="projeto_bancos"
COMPOSE_FILE="docker-compose.yml"

# Função para verificar se o Docker está em execução
check_docker() {
    if ! [ -x "$(command -v docker)" ]; then
        echo "Erro: Docker não está instalado." >&2
        exit 1
    fi
    if ! docker info > /dev/null 2>&1; then
        echo "Erro: Docker não está em execução. Inicie o Docker e tente novamente." >&2
        exit 1
    fi
}

# Função para remover contêineres antigos
clean_old_containers() {
    echo "Removendo contêineres antigos do projeto ${PROJECT_NAME}..."
    docker compose -p ${PROJECT_NAME} -f ${COMPOSE_FILE} down --volumes
}

# Função para verificar/criar rede customizada
create_network() {
    echo "Verificando rede customizada..."
    NETWORK_NAME="rede-sqlserver"
    if ! docker network ls | grep -q "${NETWORK_NAME}"; then
        echo "Criando a rede customizada ${NETWORK_NAME}..."
        docker network create ${NETWORK_NAME}
    else
        echo "Rede ${NETWORK_NAME} já existe."
    fi
}

# Função para iniciar os serviços com Docker Compose
start_services() {
    echo "Iniciando serviços com Docker Compose..."
    docker compose -p ${PROJECT_NAME} -f ${COMPOSE_FILE} up -d
}

# Função para exibir status dos contêineres
show_status() {
    echo "Status dos contêineres:"
    docker compose -p ${PROJECT_NAME} -f ${COMPOSE_FILE} ps
}

# Função principal
main() {
    check_docker
    clean_old_containers
    create_network
    start_services
    show_status
    echo "Deploy concluído com sucesso."
}

# Executa o script principal
main
