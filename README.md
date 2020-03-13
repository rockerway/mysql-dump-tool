# mysql-dump-tool

using mysql-client in docker container to dump special table schema and data with conditions

## Directory Structure

```
.
├── configs
│   └── .env.default    # env example
├── out                 # dump result
├── targets             # special DB, table, fields, conditions config
├── .gitignore          # git ignore config
├── Dockerfile          # operation env instructions
├── dump                # script
└── Makefile            # script entry point
```

## Run

> Before run the script, you need create `env file` in configs folder and `target file` in targets folder to define MySQL connect information and what DB and tables data you want.

| field | description |
| --- | --- |
| env_file_name | env file name in config folder |
| target_file_name | target file name in targets folder |
| docker_network_name __(optional)__ | docker network name, if you need operate container in exist network, you can set it. |
| docker_container_name __(optional)__ | docker container name that you want to link. |

```shell
make run <env_file_name> <target_file_name> [docker_network_name] [docker_container_name]
```
