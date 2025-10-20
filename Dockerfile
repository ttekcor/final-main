FROM golang:1.24.1

WORKDIR /app

# Сначала копируем файлы модулей для кеширования зависимостей
COPY go.mod ./
COPY go.sum ./
RUN go mod download

# Затем копируем исходники из корня репозитория
COPY . ./

# Сборка бинарника из корня модуля
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main .

CMD ["/main"]