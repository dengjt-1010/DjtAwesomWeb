FROM golang:alpine

# 为我们的镜像设置必要的环境变量
ENV AUTHOR=dengjt \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64 \
	GOPROXY="https://goproxy.cn,direct"

# 这是我的代码跟目录
# 你们得修改成自己的
WORKDIR /home/dengjt/application

# 将代码复制到容器中
COPY . .

# 将我们的代码编译成二进制可执行文件  可执行文件名为 app
RUN go build -o simpleWeb .

# 移动到用于存放生成的二进制文件的 /dist 目录
WORKDIR /home/dengjt/share

# 声明服务端口
EXPOSE 80

# 启动容器时运行的命令
CMD ["/home/dengjt/application/simpleWeb"]
