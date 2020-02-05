ifeq (run,$(firstword $(MAKECMDGOALS)))
    RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
    $(eval $(RUN_ARGS):;@:)
endif

run:
	make build
	docker run --rm -it --env-file=env/$(word 1,$(RUN_ARGS)) -e TARGET_FILE=$(word 2,$(RUN_ARGS)) -v ${PWD}/targets:/targets -v ${PWD}/out:/out mysql-dump-tool --net=t

build:
	docker build -t mysql-dump-tool .
