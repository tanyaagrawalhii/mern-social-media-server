# server/Dockerfile
FROM node:18‑alpine

# 1. Create & set working directory
WORKDIR /app

# 2. Copy only package files & install production deps
COPY package.json package-lock.json ./
# Install only production dependencies (slightly smaller image)
RUN npm ci --production

# 3. Copy in the rest of your source
COPY . .

# 4. Expose your port and set the default command
EXPOSE 6001
CMD ["npm", "start"]
