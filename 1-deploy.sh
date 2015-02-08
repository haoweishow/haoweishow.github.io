echo "开始编译博客...."
rake generate
echo "开始部署博客...."
rake deploy
echo "开始上传源码...."
git push origin source
