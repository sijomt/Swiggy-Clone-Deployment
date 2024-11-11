FROM node:21-bookworm-slim

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build  # Build React app

RUN npm install -g serve  # Install serve globally

# Create a non-root user and set permissions
RUN useradd -m -s /bin/bash appuser && chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

EXPOSE 3000

CMD ["serve", "-s", "build"]
