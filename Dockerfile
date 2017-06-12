FROM centos:6.8

RUN yum -y install git gcc gcc-c++ make git bzip2 openssl-devel readline-devel zlib-devel curl-devel && yum clean all

RUN useradd dev
RUN mkdir -p /home/dev && chown -R dev: /home/dev

RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
ENV PATH ~/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
ENV CONFIGURE_OPTS --disable-install-doc
RUN echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

ENV PATH ~/.rbenv/shims:~/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


RUN git clone https://github.com/creationix/nvm.git ~/.nvm

