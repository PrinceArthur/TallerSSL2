FROM node:16-alpine as builder
# Set the working directory to /app inside the container
WORKDIR /app
# Copy app files
COPY . .

ENV GENERATE_SOURCEMAP false
ENV NODE_OPTIONS=--max_old_space_size=800
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN npm ci 
# Build the app
RUN npm run build

# Bundle static assets with nginx
FROM nginx:1.21.0-alpine as production
ENV NODE_ENV production
# Copy built assets from `builder` image
COPY --from=builder /app/build /usr/share/nginx/html
# Add your nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ssl.crt /etc/pki/tls/certs/107.22.124.27.crt
COPY ssl.key /etc/pki/tls/private/107.22.124.27.key
# Expose port
EXPOSE 80
# Start nginx
CMD ["nginx", "-g", "daemon off;"]