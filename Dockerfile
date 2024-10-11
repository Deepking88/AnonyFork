FROM nikolaik/python-nodejs:python3.10-nodejs19
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && pip3 install -U https://github.com/coletdjnz/yt-dlp-youtube-oauth2/archive/refs/heads/master.zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY . /app/
WORKDIR /app/
RUN pip3 install --no-cache-dir -U -r requirements.txt
CMD bash start
