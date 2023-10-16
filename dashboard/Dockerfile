FROM node:16-alpine as ui-builder
WORKDIR /opt
ADD ui/ .
RUN npm run build

FROM python:3.8-alpine
WORKDIR /app
COPY api/ .
RUN pip install --upgrade pip --no-cache-dir && \
    pip install --no-cache-dir -r requirements.txt
COPY --from=ui-builder /opt/dist/index.html templates/
COPY --from=ui-builder /opt/dist/js static/js/ 
COPY --from=ui-builder /opt/dist/css static/css/
COPY --from=ui-builder /opt/dist/favicon.ico static/
EXPOSE 5050
CMD ["flask", "run", "-h", "0.0.0.0", "-p", "5050"]
