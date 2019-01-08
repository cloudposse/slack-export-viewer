FROM python:3.7.2-alpine3.8

WORKDIR /usr/src/slack-export-viewer

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .
COPY . /

EXPOSE 5000

# COPY entrypoint.sh ./entrypoint.sh

# ENV EXPORT_PATH ./
# ENV EXPORT_FILE export.zip

# CMD ["sh", "-c", "python3", "./app.py --archive $EXPORT_PATH/$EXPORT_FILE" ]
# CMD ["./app.py --archive $EXPORT_PATH/$EXPORT_FILE" ]

# ENTRYPOINT [ "./entrypoint.sh" ]
COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["sh", "/entrypoint.sh"]
