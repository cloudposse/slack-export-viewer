FROM python:3.7.2-alpine3.8

WORKDIR /opt/slack-export-viewer

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /

EXPOSE 5000

RUN chmod 755 entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
