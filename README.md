# Rasa Semantic Schema Customization
This repository allows to customize the Rasa Semantic Schema DBT Package for a particular chat bot model. It also allows to get updates and bug fixes to the package. It is a suggested method to automatically execute the package with the DBT Runner of Data Ingestion Pipeline.

## What is Rasa Semantic Schema
**Rasa Semantic Schema Package** transforms the tracker store events into relational schema suitable for reporting via, for example, `users`, `sessions` or `interactions` tables. Transformations are implemented as DBT package and available [here](https://github.com/scale-vector/rasa_semantic_schema).

Please refer to the package [README](https://github.com/scale-vector/rasa_semantic_schema/blob/master/README.md) for information on how to manually run the package, inspect tables in the schema and make customizations.

All commands, customizations and other information found in the aforementioned `README` apply here.

## Quickstart Guide for DBT Runner
[DBT Package Runner](https://github.com/scale-vector/rasa_data_ingestion_deployment/blob/master/autopoiesis/DEPLOYMENT.md#semantic-schema-dbt-package) is one of the component of the Rasa Ingestion Pipeline.

In order to customize the package you should do the following:

1. Clone this repository or use it as [Github Template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template). It becomes your own DBT package now that you can extend in the future.
2. Customize the clone. [Several customizations](https://github.com/scale-vector/rasa_semantic_schema#package-customizations) are accessible via variables in `dbt_project.yml` file.
3. Push your clone (to github or other origin that can be shared)
4. Go back to the deployment procedure and provide url to your cloned repo [here](https://github.com/scale-vector/rasa_data_ingestion_deployment/blob/master/autopoiesis/DEPLOYMENT.md#dbt-package-configuration).
5. The DBT Runner will share the warehouse access with other pipeline components so it will pick up correct profile from `profiles.yml` and provide environment variables the profile requires.

## Getting Bugfixes and Updates
In this repository we maintain a reference to the newest stable version of the Rasa Semantic Schema DBT Package. When cloned that version will be kept until you change it. To change the version in order, for example, to receive a bug fix you need to follow standard DBT dependency procedure as explained [here](https://docs.getdbt.com/docs/building-a-dbt-project/package-management#git-packages).

For example: to change package to version 1.0.1 set the `revision` field in `packages.yml` to `1.0.1` as below
```yaml
packages:
  - git: "git@github.com:scale-vector/rasa_semantic_schema.git"
    revision: 1.0.1
```

Please refer to [Package Versioning](https://github.com/scale-vector/rasa_semantic_schema#package-versioning) for information on semantic versioning of the base package.

## Package Customization
You can modify the package without changing the models or writing additional SQL. Please read [here](https://github.com/scale-vector/rasa_semantic_schema#package-customizations) on available customizations.


## Extending the Package

### New Sources, Models, Tests and Macros
You can add new models, sources and other DBT artifacts. For example if you have source tables with Customer Satisfaction Surveys or ticketing system in your warehouse you can add new sources and models that will transform those tables, combine with tracker store data etc. You can find DBT documentation [here](https://docs.getdbt.com/docs/introduction).

### Replacing *Rasa Semantic Schema Package* Models and Macros
You can replace any artifact in the Rasa Semantic Schema Package with the standard DBT method. For example:
1. If you need to populate interactions or session tables in special way, add additional models etc. you can disable package models and provide your own. Please refer to `examples` folder for such an example that modifies `load_ids` model.
2. You can overwrite any macro from the base package. You can find more information [here](https://docs.getdbt.com/reference/dbt-jinja-functions/dispatch#overriding-package-macros)

## Running Package Manually
If you have local dbt environment you can run this package from the command line. CLI becomes useful when
1. You want to test your customizations on schema isolated from production models.
2. You want to add new models or sources as described in next paragraph

Please see the CLI reference [here](https://github.com/scale-vector/rasa_semantic_schema#running-dbt-package-manually)
