FROM python:3.7.2-alpine3.8

WORKDIR /usr/src/slack-export-viewer

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /

EXPOSE 5000

RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["sh", "/entrypoint.sh"]
