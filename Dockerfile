FROM node:20-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM nginx:alpine

# Copy custom Nginx configuration for SPA routing and API reverse proxy
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy production build assets from build stage
COPY --from=build /app/dist /usr/share/nginx/html

# Ensure open readable/executable permissions for all static assets
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
