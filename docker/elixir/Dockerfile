FROM elixir:latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y inotify-tools build-essential postgresql-client && \
    mix local.rebar --force && \
    mix local.hex --force

# Uncomment if you need to use a front-end
RUN apt-get install -y sudo wget curl zip unzip
# If you plan to run a web interface, you'll want to use the following:
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && apt-get install -y nodejs && apt-get install gcc g++ make
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && apt-get install yarn

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 4003