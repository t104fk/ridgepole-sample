FROM ruby:2.2.2-onbuild
WORKDIR /app
ENV DATABASE_URL postgresql://takasing:bgMtzjha@db:5432
