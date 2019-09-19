FROM almir/webhook
RUN apk upgrade --update && apk add bash git

RUN apk upgrade --update \
 && apk add build-base ruby ruby-dev ruby-bigdecimal \
 && gem install --no-document jekyll \
 && gem install --no-document bundler

COPY ./hooks.yml /etc/webhook/hooks.yml
COPY ./scripts /etc/webhook/scripts
CMD ["-verbose", "-hooks=/etc/webhook/hooks.yml", "-hotreload"]
