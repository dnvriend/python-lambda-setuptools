from setuptools import setup

setup(
    name='helloworld',
    version='0.1',
    author='Dennis Vriend',
    author_email='dnvriend@gmail.com',
    description="Hello lambda",
    licence='Apache 2.0',
    packages=['dnvriend'],
    install_requires=['requests'],
    setup_requires=['lambda_setuptools'],
    lambda_function='dnvriend.mymodule:handler'
)