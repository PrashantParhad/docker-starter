# FROM node:20

# WORKDIR /app

# COPY . .

# RUN npm install
# # RUN npx prisma generate
# RUN npm run build

# EXPOSE 3000

# # CMD ["node", "dist/index.js"]
# CMD ["npm", "start"]

#optimiZed way to write docker file
#this way npm install will not run everytime layer will be cached and run only when there is change in package.json

FROM node:20

WORKDIR /usr/src/app

COPY package* .
RUN npm install
# RUN npx prisma generate

COPY . .
RUN npm run build

EXPOSE 3000

CMD ["npm", "start" ]
