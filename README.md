# My Journey Through the 7-Day DevOps Challenge (NextWork)

I recently completed the 7-Day DevOps Challenge from NextWork, where I built a complete CI/CD pipeline using AWS services. This hands-on experience helped me develop practical DevOps skills and understand how these powerful tools work together in a real production environment.

## Day 1: Setting Up a Web App in the Cloud

The challenge began with setting up our development environment on AWS rather than locally. This approach reflects real-world DevOps practices where development environments are consistent and cloud-based.

### What I accomplished:

- Launched an EC2 instance as my development environment
- Set up remote SSH connection for terminal access
- Installed Maven and Java to generate a basic web application
- Connected VSCode to the EC2 instance using Remote-SSH extension

I found it interesting how easily a basic Java web application could be generated with a single Maven command:

```bash
mvn archetype:generate \
   -DgroupId=com.nextwork.app \
   -DartifactId=nextwork-web-project \
   -DarchetypeArtifactId=maven-archetype-webapp \
   -DinteractiveMode=false
```

This command automatically creates the project structure needed for a Java web application, saving significant setup time.

## Day 2: GitHub Integration with AWS

Version control is essential for any software project, so we connected our application to GitHub.

### What I accomplished:

- Created a GitHub repository for version control
- Set up Git on the EC2 instance
- Implemented GitHub token authentication for secure code pushing/pulling

This integration established the foundation for our CI/CD pipeline, enabling automated workflows triggered by code changes.

## Day 3: Package Management with CodeArtifact

**What is CodeArtifact?** A secure, central repository for storing software packages. When building applications, we typically use dozens of external packages or libraries — things other developers have created that we don't want to build from scratch.

### What I accomplished:

- Set up AWS CodeArtifact as a private Maven repository
- Configured Maven Central as an upstream repository
- Implemented IAM roles for secure access between EC2 and CodeArtifact

Upstream repositories act as backup libraries that your primary repository can access when it doesn't have what you need. When my application looked for a package not in my CodeArtifact repository, CodeArtifact checked its upstream repositories to find it, then stored a copy for future use.

## Day 4: Continuous Integration with CodeBuild

**What is CodeBuild?** AWS CodeBuild is a fully managed build service that compiles source code, runs tests, and produces software packages. With CodeBuild, you don't need to manually set up and manage build servers — you pay only for the compute time used during builds.

### What I accomplished:

- Created a CodeBuild project linked to my GitHub repository
- Defined the build process using buildspec.yml
- Configured S3 bucket storage for build artifacts
- Set up automated testing as part of the build process

The `buildspec.yml` file serves as the blueprint for the CI process, instructing CodeBuild what to do at each stage — what tools to install, commands to run, and which files to package upon completion.

## Day 5: Deployment Automation with CodeDeploy

**What is CodeDeploy?** AWS CodeDeploy is a continuous deployment service that:

- **Automates deployments:** Eliminates error-prone manual steps
- **Enables consistent rollouts:** Your application deploys the same way every time
- **Minimizes downtime:** Can deploy in ways that keep your application available
- **Handles failures:** Can automatically roll back if something goes wrong

### What I accomplished:

- Launched a "production" EC2 environment using CloudFormation
- Created deployment scripts and appspec.yml for deployment configuration
- Configured CodeDeploy application and deployment group
- Successfully deployed the web application automatically

The `appspec.yml` file tells CodeDeploy how to handle the deployment process, while the deployment scripts manage installing dependencies, starting, and stopping the server.

## Day 6: Infrastructure as Code with CloudFormation

This optional day focused on converting our architecture into code with AWS CloudFormation.

### What I accomplished:

- Used AWS CloudFormation IaC generator to scan existing resources
- Generated CloudFormation templates of my architecture
- Tested template deployment by recreating the entire infrastructure

I was impressed by the CloudFormation IaC generator, which scans your AWS account, discovers existing resources, and generates code for the resources you select. This tool significantly simplifies the creation of infrastructure templates.

## Day 7: Complete CI/CD Pipeline with CodePipeline

**What is a CI/CD Pipeline?** In simple terms, it's a workflow that automatically builds, tests, and deploys code changes.

**What is CodePipeline?** AWS CodePipeline creates a workflow that automatically moves code changes through build and deployment stages.

### What I accomplished:

- Set up AWS CodePipeline with Source, Build, and Deploy stages
- Configured automatic triggering on GitHub commits to main branch
- Implemented a fully automated workflow from code commit to production deployment
- Tested rollback functionality for handling deployment failures

For our pipeline, when changes are pushed to GitHub, it triggers a build in CodeBuild and then initiates deployment in CodeDeploy — creating a seamless flow from code changes to production.

## Final Thoughts

This 7-day challenge provided invaluable hands-on experience with AWS DevOps tools. I now understand how these services work together to create an efficient development workflow — from infrastructure automation with CloudFormation to continuous integration with CodeBuild and automated deployments with CodeDeploy.

The most valuable takeaway was seeing how these individual components connect to form a cohesive CI/CD pipeline. What previously seemed like abstract concepts became practical tools that I can now confidently implement in real-world projects.

If you're looking to enhance your DevOps skills, I highly recommend finding a hands-on challenge like this one from NextWork. The practical experience gained is invaluable in today's cloud-focused development environment.

## Resources

### GitHub Links (Sample Code)

- [Java Web App](https://github.com/daniellehopedev/nextwork-web-project)
- [Server Scripts](https://github.com/daniellehopedev/nextwork-web-project/tree/main/scripts)
- [Template Generated by IaC Generator](https://github.com/daniellehopedev/nextwork-web-project/blob/main/nextwork-generated-template.yaml)
- ["Production" EC2 Template](https://github.com/daniellehopedev/nextwork-web-project/blob/main/nextworkwebapp.yaml)
- [buildspec.yml](https://github.com/daniellehopedev/nextwork-web-project/blob/main/buildspec.yml)
- [appspec.yml](https://github.com/daniellehopedev/nextwork-web-project/blob/main/appspec.yml)

### Challenge Link

[NextWork 7-Day DevOps Challenge](https://www.nextwork.org/streams)

---

**Tags:** `DevOps` `Cloud Computing` `AWS` `CI/CD` `Infrastructure as Code` `NextWork`

---

*Original article published on Medium by Danielle Hope*
