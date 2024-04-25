# terraform-three-tier-aws

## Intro
A 3-tier application typically consists of three layers: presentation (web), application (logic), and data (database). Each layer performs specific functions and communicates with the other layers to deliver the application's functionality.

In this project I've introduced Terraform to the 3-tier setup to help automate the provisioning and management of our AWS 3-tier application infrastructure, making it more efficient, scalable, and repeatable. I've also broken down the infrastructure into reusable modules that represent different components of the 3-tier application (e.g., networking module, web tier module, application tier module, database tier module).

