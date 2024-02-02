FROM espressif/idf:release-v4.3 as idf-v4.3
WORKDIR /app
ADD . /app
# Apply patches
RUN cd /opt/esp/idf && \
	patch --ignore-whitespace -p1 -i "/app/tools/patches/panic-hook (esp-idf 4.2 and 4.3).diff" && \
	patch --ignore-whitespace -p1 -i "/app/tools/patches/sdcard-fix (esp-idf 4.2 and 4.3).diff"

FROM espressif/idf:release-v5.0 as idf-v5.0
WORKDIR /app
ADD . /app

