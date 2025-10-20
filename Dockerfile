FROM golang:1.24

WORKDIR /app/final-main

# Сначала копируем файлы модулей для кеширования зависимостей
COPY final-main/go.mod ./
RUN go mod tidy

# Затем копируем исходники
COPY final-main/ ./

# Сборка бинарника из корня модуля
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main .


CMD ["/main"]