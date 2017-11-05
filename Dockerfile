FROM jekyll/jekyll:3.4.0
COPY . /srv/jekyll
WORKDIR /srv/jekyll
ENTRYPOINT [ "jekyll" ]
CMD [ "serve" ]
