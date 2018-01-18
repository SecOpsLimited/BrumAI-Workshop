# Docker image for Brum AI workshop Jan 2018

FROM python

LABEL maintainer="rob@styles.to"

#Install some Python dependencies
RUN git clone https://github.com/apixu/apixu-python
RUN cd apixu-python && python setup.py install

#Install node
RUN apt-get update
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install -y nodejs

#Install rasa_nlu data visualisation tool
RUN npm i -g rasa-nlu-trainer

#Install requirements
ADD requirements.txt .
RUN pip install -r requirements.txt
RUN python -m spacy download en

CMD ["/bin/bash"]
