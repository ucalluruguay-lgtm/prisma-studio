FROM node:18-slim
WORKDIR /app
RUN npm install -g prisma
RUN echo 'datasource db { \n\
  provider = "postgresql" \n\
  url      = env("DATABASE_URL") \n\
} \n\
generator client { \n\
  provider = "prisma-client-js" \n\
}' > schema.prisma
EXPOSE 5555
CMD ["sh", "-c", "prisma db pull && prisma generate && prisma studio --browser none --port 5555 --hostname 0.0.0.0"]
