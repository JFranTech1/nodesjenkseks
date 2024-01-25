#import language or OS
FROM node:20

#create working directory
WORKDIR /app

#COPY DEPENDENCIES
COPY package.json .

#install dependencies
RUN npm install

#copy everything except those in dockerignore
COPY . .

#expose port of app
EXPOSE 3000

#start app
CMD [ "node", "index.js" ]