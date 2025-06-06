FROM ubuntu:20.04
 
# Install dependencies
RUN apt update -y && apt upgrade -y \
    apt install tmate -y
 
# Create a dummy index page to keep the service alive
RUN mkdir -p /app && echo "Tmate Session Running..." > /app/index.html
WORKDIR /app
 
# Expose a fake web port to trick Railway into keeping container alive
EXPOSE 6080
 
# Start a dummy Python web server to keep Railway service active
# and start tmate session
CMD python3 -m http.server 6080 && tmate -F
