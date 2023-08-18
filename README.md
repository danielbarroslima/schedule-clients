# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version is 3.0.5

* [System dependencies](https://github.com/danielbarroslima/schedule-clients/blob/main/Gemfile)

* [Configuration](https://github.com/danielbarroslima/schedule-clients/blob/main/Makefile)

* Database creation

    use: `make compose_up`

* Database initialization

    **instructions for pgadmin**

    In terminal digit:
    `docker network ls`

    The return has this network:
    `schedule-clients_default   bridge    local`

    Where folowing this command
    `docker network inspect schedule-clients_default` or `ID_CONTAINER`

    In container postgres has the IP for  configuration in `IPv4Address`


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
