ifeq (run,$(firstword $(MAKECMDGOALS)))
    RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
    $(eval $(RUN_ARGS):;@:)
	ifeq ($(words $(word 3,$(RUN_ARGS))),1)
		NETWORK_CONFIG=--net=$(word 3,$(RUN_ARGS))
	endif
	ifeq ($(words $(word 4,$(RUN_ARGS))),1)
		LINK_CONFIG=--link $(word 4,$(RUN_ARGS)):db
	endif
endif

run:
	make build
	docker run --rm -it --env-file=configs/$(word 1,$(RUN_ARGS)) -e TARGET_FILE=$(word 2,$(RUN_ARGS)) -v ${PWD}/targets:/targets -v ${PWD}/out:/out $(NETWORK_CONFIG) $(LINK_CONFIG) mysql-dump-tool

build:
	docker build -t mysql-dump-tool .
