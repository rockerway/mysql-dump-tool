# mysql-dump-tool

using mysql-client in docker container to dump special table schema and data with conditions

## Directory Structure

```
.
├── env
│   └── .env.default    # env example
├── out                 # dump result
├── targets             # special DB, table, fields, conditions config
├── .gitignore          # git ignore config
├── Dockerfile          # operation env instructions
├── dump                # script
└── Makefile            # script entry point
```

## Exec

```shell
make run <env_file_name> <target_file_name>
```
