FROM alpine:3.8
RUN apk add --no-cache ruby ruby-bundler
RUN gem install xcpretty --no-ri --no-rdoc
ENTRYPOINT ["xcpretty"]