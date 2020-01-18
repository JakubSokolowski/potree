FROM node:11.1.0 as npm-builder
COPY ./package.json /usr/simbad-viewer/package.json
COPY ./package-lock.json /simbad-viewer/package-lock.json

WORKDIR /usr/simbad-viewer
RUN npm install --silent
RUN npm install --silent -g gulp rollup

FROM npm-builder as builder
COPY . /usr/simbad-viewer
ENV PATH /usr/simbad-viewer/node_modules/.bin:$PATH

RUN gulp build
RUN gulp pack

FROM builder as viewer
COPY --from=builder /usr/simbad-viewer/build /usr/share/nginx/html/viewer/build
COPY --from=builder /usr/simbad-viewer/libs /usr/share/nginx/html/viewer/libs
COPY --from=builder /usr/simbad-viewer/index.html /usr/share/nginx/html/viewer
