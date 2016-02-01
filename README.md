 Stackifle for Tutum:

    amqp:
      image: 'tutum/rabbitmq:latest'
      environment:
        - RABBITMQ_PASS=insecure
      ports:
        - '5672:5672'
    supervisor:
      image: 'radk0s/montage-supervisor:latest'
      environment:
        - 'S3_BUCKET="montage-dag"'
        - 'S3_PATH="0.10/input"'
      links:
        - amqp
    worker:
      image: 'radk0s/montage-worker:latest'
      environment:
        - 'AWS_ACCESS_KEY_ID="<your_acces_key>"'
        - 'AWS_SECRET_ACCESS_KEY="<your_secret_key>"'
      links:
        - amqp
        
        
Building containers locally:
    
    docker build -t example-supervior-name ./supervisor
    
Run container locally (interactive mode)

    docker run -it example-supervior-name
    
Run bash console without executing service

    docker run -it example-supervior-name bash
    
    
    
On Linux you need only Docker installed.

On Windows and Mac u need docker-machine:

    docker-machine create -d virtualbox default

    docker-machinse start default

    eval "$(docker-machine env default)"
    
Now you can use docker commands.



