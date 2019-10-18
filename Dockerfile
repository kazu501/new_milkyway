FROM ruby:2.6

RUN curl -SL https://deb.nodesource.com/setup_11.x | bash
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs \
                       default-mysql-client      


RUN mkdir /milkyway 
ENV MILKY_ROOT /milkyway 
WORKDIR $MILKY_ROOT

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

ADD ./Gemfile $MILKY_ROOT/Gemfile
ADD ./Gemfile.lock $MILKY_ROOT/Gemfile.lock


RUN bundle install
ADD . $MILKY_ROOT

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]