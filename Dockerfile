# 1. 使用官方稳定的 Node.js 镜像
FROM node:18-alpine

# 2. 设置应用工作目录
WORKDIR /app

# 3. 复制代码及包管理文件
COPY package*.json ./
COPY index.js index.html ./

# 4. 安装基础依赖与 npm 包
RUN apk add --no-cache curl bash && \
    npm install

# 5. 声明端口
EXPOSE 3000

# 6. 启动指令
CMD ["npm", "start"]
