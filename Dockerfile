FROM alpine:latest
RUN apk --no-cache add --update docker openrc ca-certificates curl wget zip tar bzip2 gzip vim bash
WORKDIR /app
COPY . .
RUN addgroup -S appgroup && adduser -S autolycus -G appgroup
RUN chown -R autolycus:appgroup /app
USER autolycus
RUN cp env.example .env
EXPOSE 80
CMD [ "docker-compose", "up" ]
