# ====== Development ====== #
FROM node:16-alpine AS development

WORKDIR /@dev

CMD [ "npm", "run", "dev"]

# ---- Base Node ----
FROM node:16-alpine AS base

WORKDIR /app
COPY package*.json ./

#
# ---- Dependencies ----
FROM base AS dependencies
# install node packages
RUN npm set progress=false && npm config set depth 0
# RUN npm install --only=production 
# # copy production node_modules aside
# RUN cp -R node_modules prod_node_modules
# install ALL node_modules, including 'devDependencies'
RUN npm install

#
# ---- Build ----
FROM dependencies AS production
# copy project file
COPY . .

RUN npm run build
CMD ls -la && cp -R dist/* /www
