#import language or OS in my case i type node -v and got 20.10 so i coudve done FROM node:20 or choose and lightweightOS  
#therefore buster cause it is a lightwieght debian OS
FROM node:20.10.0-buster-slim

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