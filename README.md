# Impression counter api running in app-runner

This is a sample code repository showcasing to use of [AWS App Runner](https://aws.amazon.com/apprunner/) for running an impression counter API written in Go, that is using it latest feature for accessing private resources inside a VPC.
This sample code uses Amazon ElastiCache for Redis as its data store.

To connect to private resources, AWS App Runner use a VPC Connector, that connects App Runner services into a custom VPC as describe in [this](https://docs.aws.amazon.com/apprunner/latest/dg/network-vpc.html) documentation.

AWS App Runner [image-base service](https://docs.aws.amazon.com/apprunner/latest/dg/service-source-image.html) allow to run any docker container image in any development language, and [Code-base service](https://docs.aws.amazon.com/apprunner/latest/dg/service-source-code.html) on supported languages App Runner will build the service source code on the service runtime docker images, removing the need to manage build infrastructure.

## Setup

>ToDo

## Architecture

![Architecture](img/impression-counter-api-app-runner-sample.png)

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.
