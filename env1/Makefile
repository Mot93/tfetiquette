init:
	terraform init

plan:
	@terraform fmt 
	terraform plan -out=plan.tfout -var-file=./../commons.tfvars

apply:
	terraform apply plan.tfout
