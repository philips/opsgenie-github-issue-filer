FROM golang:1.11 as builder

WORKDIR /go/src/github.com/philips/oncall-issue-filer
COPY . .

RUN /usr/local/go/bin/go build -o /usr/local/bin/oncall-issue-filer .

# Application image.
FROM gcr.io/distroless/base:latest

COPY --from=builder /usr/local/bin/oncall-issue-filer /usr/local/bin/oncall-issue-filer

ENTRYPOINT ["/usr/local/bin/oncall-issue-filer"]
