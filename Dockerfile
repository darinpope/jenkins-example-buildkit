# syntax=docker/dockerfile:1.3.1
FROM alpine:3.15.0 AS stage1
RUN touch /tmp/first.txt
RUN sleep 6
 
FROM alpine:3.15.0 AS stage2
RUN touch /tmp/second.txt
RUN sleep 8

FROM alpine:3.15.0 AS stage3
RUN touch /tmp/third.txt
RUN sleep 10
 
FROM alpine:3.15.0 AS final
COPY --from=stage1 /tmp/first.txt /tmp/
COPY --from=stage2 /tmp/second.txt /tmp/
COPY --from=stage3 /tmp/third.txt /tmp/