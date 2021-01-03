FROM perl:5.20
COPY ./web /usr/src/myapp
RUN cpanm MongoDB
WORKDIR /usr/src/myapp
CMD [ "perl", "./index.pl" ]
