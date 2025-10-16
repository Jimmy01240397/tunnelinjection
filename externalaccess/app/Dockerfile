FROM nginx:latest

RUN apt update && apt install -y --no-install-recommends iproute2 netcat-traditional && apt clean && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx","-g","daemon off;"]


