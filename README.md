# ns3-docker
A simple docker image for [ns3 (network simulator)](https://www.nsnam.org).

## Usage
First of all you have to pull the image from the repository:
```bash
docker pull ghcr.io/herbrant/ns3-docker:main
```

Then you can run the first example:
```bash
docker run -t ns3-docker first
```

Also you can run your code by binding a volume on the scratch folder
```bash
docker run -t -v <your-code-path>:/ns3/ns-3.38/scratch/<example-project> ghcr.io/herbrant/ns3-docker:main <project-name>
```

### Create your own image
Also you can write a Dockerfile for your project using this docker image. 
For instance:
```dockerfile
FROM gchd...

RUN mkdir -p /ns3/ns-3.38/scratch/<your-project>
COPY . /ns3/ns-3.38/scratch/<your-project>

ENTRYPOINT [ "/ns3/ns-3.38/ns3", "run", "<your-project-image>" ]
```

