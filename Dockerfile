FROM ruby:2.6

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs \
                       default-mysql-client      


RUN mkdir /milkyway 
ENV MILKY_ROOT /milkyway 
WORKDIR $MILKY_ROOT


ADD ./Gemfile $MILKY_ROOT/Gemfile
ADD ./Gemfile.lock $MILKY_ROOT/Gemfile.lock


RUN bundle install
ADD . $MILKY_ROOT