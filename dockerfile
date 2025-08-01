FROM oven/bun:latest AS base

WORKDIR /app

COPY package.json bun.lock ./

RUN bun install --frozen-lockfile

COPY . .

RUN bunx prisma generate

EXPOSE 4000

CMD ["sh", "-c", "bunx prisma migrate deploy && bun start"]
