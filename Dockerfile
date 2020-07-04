FROM ubuntu

# 控制权限，与创建镜像的用户权限保持一致
ARG UID
ARG GID
RUN groupadd -g $GID dummy && useradd -m -r --uid $UID -g dummy --groups "0" dummy

# 创建 blog 目录
RUN mkdir /blog && chown -R dummy:dummy /blog

# 安装依赖
RUN apt-get update && apt-get install -y ruby-full build-essential zlib1g-dev

USER dummy
ENV GEM_HOME="/home/dummy/gems"
ENV PATH="$GEM_HOME/bin:$PATH"
RUN gem install jekyll bundler && gem install minima github-pages

# 设置工作目录
WORKDIR /blog
CMD ["/bin/bash"]