# Rasa Semantic Schema Customization
This repository allows to customize the Rasa Semantic Schema DBT Package for a particular chat bot model. It also allows to get updates and bug fixes to the package. It is a suggested method to automatically execute the package with the DBT Runner of Data Ingestion Pipeline.

## What is Rasa Semantic Schema
**Rasa Semantic Schema** transforms the tracker store events into relational schema suitable for reporting via, for example, `users`, `sessions` or `interactions` tables. Transformations are implemented as DBT package and available [here](https://github.com/scale-vector/rasa_semantic_schema).

Please refer to the package [README](https://github.com/scale-vector/rasa_semantic_schema/blob/master/README.md) for information on how to manually run the package, tables in the schema and possible customizations.

All commands, customizations and other information found in the `README` above applies here without any modifications.

## Quickstart Guide for DBT Runner
[DBT Package Runner](https://github.com/scale-vector/rasa_data_ingestion_deployment/blob/master/autopoiesis/DEPLOYMENT.md#semantic-schema-dbt-package) is one of the component of the Rasa Ingestion Pipeline.

In order to customize the package you should do the following:

1. Fork or clone this repository so you can work on your own copy. Forking is the preferred method.
2. Cutomize the copy of the package if necessary. Several customizations are accessible via configuration in `dbt_project.yml` file.
3. Push your clone and configure access as described [here](https://github.com/scale-vector/rasa_data_ingestion_deployment/blob/master/autopoiesis/DEPLOYMENT.md#dbt-package-configuration)
4. The DBT Runner will share the warehouse access with other pipeline components.

We advice you to customize your package if
- you send external user ids in the `metadata` field of the user message
- you send external session id in the above metadata
- you want to track handovers and you have a special action(s) or intent(s) in your model that you want to measure in your reports
- you have any other intent or action that you want to measure ie. if you have intents that indicate that user is frustrated, you can easily configure the package to start measuring them
- your bot has multiple skills and you need to measure them separately in your reports.

## Getting Bugfixes and Updates
This repository will always reference the newest stable version of the Rasa Semantic Schema DBT Package. When cloned the version will be preserved. To change the version in order, for example, to receive a bug fix you need to follow standard DBT dependency procedure as explained here.

For example: to change package to version `1.0.1` set the `revision` field in `packages.yml` to `1.0.1` as below
```yaml
packages:
  - git: "git@github.com:scale-vector/rasa_semantic_schema.git"
    revision: 1.0.1
```

Please refer to (versioning chapter)[] for information on semantic versioning of the package.

## Package Customization
The behavior of the package

## Running Package Manually

dbt deps --profiles-dir . --profile any

## Modifying Models and Macros

https://docs.getdbt.com/reference/dbt-jinja-functions/dispatch#overriding-package-macros

## 


# basically the same README as in base package. 

1. override config vars
2. override models
3. add tests
4. add models and schemas
5. update base package by changing revision


# upgrading
-> change the revision in `packages.yaml`
