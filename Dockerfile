# BASE IMAGE with an alias #
FROM node:v14.17.3 as build
WORKDIR /app


RUN npm install -g @angular/cli
# copying the package.json file alone from our angular project and copy it onto the container directory
COPY ./package.json .
# nstalls all the necessary dependencies for our angular project onto the container
RUN npm install
# copy all the contents in our angular project onto the container. 
# This includes the src, e2c, tsconfig and other files which are in the angular project directory
COPY . .
# packs the angular application into index.html and minified JavaScript files.
RUN ng build

FROM nginx as runtime
# We now have our angular application built and the binaries available under /app/dist/ngzoro in the container
# so   copy angular files into the path "/usr/share/nginx/html-> which is docker servers default index file is found here"
COPY --from=build /app/dist/ngzoro /usr/share/nginx/html 