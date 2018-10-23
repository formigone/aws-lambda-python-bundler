# Build Python Lambdas: Laugh Now, Cry Later

Not sure why this is so complicated... come on, AWS!

# Why this craziness?

If you simply set up a venv somewhere in your dev environment, install Pandas, Numpy, or pretty much any other optimized package, when you try to run it on AWS Lambda, you'll get an error saying that the lambda was not able to load that package.

Why? Because the package needs to be compiled in the same OS as the lambda (Amazon Linux). If you're reading this, chances are you've ran into this exact issue, and that's why you're looking for a Docker solution for this to help you compile those packages more seamlessly...

# How this repo is intended to work

 1) Build the docker image using Dockerfile:
 
```bash
docker build -t aws-python3.6 .
```

 2) Set up your virtual environment in the _host_ machine:
 
```bash
python3 -m venv venv
source ./venv/bin/activate

pip install <your deps>

pip freeze --local > dev/requirements.txt
```
 3) Write your lambda(s) within `~/dev`.
 4) Bundle your lambda(s) after you've tested the local versions. This will launch a container and run the bundling script within the container, then exit and destroy the container:

```bash
docker run --rm -v $(pwd)/dev:/app aws-python3.6 /app/bundle.sh
```
At the end of the bundling script, the bundle will be stored in ~/dist/bundle.zip.

### TODO: upload bundle.zip to S3 within some bucket (and key) passed in to the bundling script.
