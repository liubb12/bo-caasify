# 1. 使用官方稳定的 Node.js Alpine 基础镜像
FROM node:18-alpine

# 2. 设置标准的工作目录
WORKDIR /app

# 3. 复制代码及依赖文件
COPY index.js index.html package.json ./

# 4. 暴露端口（标准格式）
EXPOSE 3000

# 5. 清理缓存并安装基础工具及 npm 依赖
RUN apk update && apk upgrade && \
    apk add --no-cache openssl curl gcompat iproute2 coreutils bash && \
    chmod +x index.js && \
    npm install

# 6. 启动容器
CMD ["node", "index.js"]
