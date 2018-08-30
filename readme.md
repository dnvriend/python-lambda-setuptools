# python-lambda-setuptools
A small study project on packaging a lambda with python dependencies with [lambda-setuptools]() which is 
a command extension to setuptools that builds an AWS Lambda compatible zip file.

## Usage
Type:

- make init - create the virtualenv
- make remove - remove the virtualenv
- make clean - remove all artifacts
- make dist - create an aws lambda compatible zip distribution
- make deploy - deploy the lambda to aws
- make invoke - invoke the lambda

## Resources
- [lambda-setuptools](https://github.com/QuiNovas/lambda-setuptools)