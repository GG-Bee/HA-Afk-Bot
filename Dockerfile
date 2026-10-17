
FROM ghcr.io/home-assistant/base:3.24

RUN apk add --no-cache nodejs npm

WORKDIR /app

COPY package*.json ./

RUN if [ -f package-lock.json ]; then \
      npm ci --omit=dev; \
    else \
      npm install --omit=dev; \
    fi

COPY . .

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
