FROM alpine/git:v2.30.1 as builder
WORKDIR /frontend
RUN git clone https://github.com/ssmathistad/react-redux-realworld-example-app.git

FROM node:lts-alpine3.13
WORKDIR /frontend
COPY --from=builder /frontend/react-redux-realworld-example-app /frontend/react-redux-realworld-example-app
WORKDIR /frontend/react-redux-realworld-example-app
RUN npm install

EXPOSE 4100

ENTRYPOINT ["npm", "start"]
