# Run the docker build command
docker build `
--build-arg PERSONAL_ACCESS_TOKEN='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' `
--build-arg GITHUB_USERNAME='TerrenceDevOps' `
--build-arg REPOSITORY_NAME='application-codes' `
--build-arg WEB_FILE_ZIP='rentzone.zip' `
--build-arg WEB_FILE_UNZIP='rentzone' `
--build-arg DOMAIN_NAME='crazywrap.online' `
--build-arg RDS_ENDPOINT='dev-rds-db.cdsuq4ig4929.eu-central-1.rds.amazonaws.com' `
--build-arg RDS_DB_NAME='applicationdb' `
--build-arg RDS_MASTER_USERNAME='Terrence' `
--build-arg RDS_DB_PASSWORD='Terrence1#!' `
-t rentzone .