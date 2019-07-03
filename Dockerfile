FROM amazon/opendistro-for-elasticsearch-kibana:0.9.0
MAINTAINER coolyu <coolyu@gmail.com>

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.7.1/elasticsearch-analysis-ik-6.7.1.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v6.7.1/elasticsearch-analysis-pinyin-6.7.1.zip
