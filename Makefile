THIS_FILE    := $(abspath $(firstword $(MAKEFILE_LIST)))
THIS_DIR     := $(shell dirname $(THIS_FILE))

PROFILE ?= haproxy

# => -------------------------------------------------------------------------------------------------------------- {{{1

$(THIS_DIR)/volume/ssl/selfsigned.crt:
	@openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -out volume/ssl/selfsigned.crt -keyout volume/ssl/selfsigned.crt.key

# => -------------------------------------------------------------------------------------------------------------- {{{1

.PHONY: daemon down run

daemon: $(THIS_DIR)/volume/ssl/selfsigned.crt
	@docker-compose --profile $(PROFILE) up --remove-orphans -d

down:
	@docker-compose --profile $(PROFILE) down

run: $(THIS_DIR)/volume/ssl/selfsigned.crt
	@docker-compose --profile $(PROFILE) up --remove-orphans
