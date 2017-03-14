FROM jekyll/jekyll
COPY . /srv/jekyll
WORKDIR /srv/jekyll
ENTRYPOINT [ "jekyll" ]
CMD [ "serve" ]
