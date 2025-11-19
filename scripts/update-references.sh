#!/bin/bash

# 设置变量
REFERENCES_RELATIVE_PATH=".context/references"  # references目录相对于项目根目录的路径
REFERENCES_DIR=$(realpath "$(dirname "$0")/../$REFERENCES_RELATIVE_PATH")
REFERENCES_LIST="$REFERENCES_DIR/references-list.txt"
GITIGNORE_FILE=$(realpath "$(dirname "$0")/../.gitignore")

# 检查references目录是否存在，如果不存在则创建
if [ ! -d "$REFERENCES_DIR" ]; then
  echo "创建 .references 目录..."
  mkdir -p "$REFERENCES_DIR"
fi

# 检查references-list.txt是否存在
if [ ! -f "$REFERENCES_LIST" ]; then
  echo "错误: $REFERENCES_LIST 不存在！"
  echo "请创建该文件并添加GitHub仓库链接，每行一个。"
  exit 1
fi

echo "开始处理参考项目..."

# 读取references-list.txt文件中的每一行
while IFS= read -r repo_url || [[ -n "$repo_url" ]]; do
  # 跳过空行和注释行
  if [[ -z "$repo_url" || "$repo_url" =~ ^# ]]; then
    continue
  fi
  
  echo "处理仓库: $repo_url"
  
  # 从URL中提取仓库名称
  repo_name=$(basename "$repo_url" .git)
  target_dir="$REFERENCES_DIR/$repo_name"
  
  # 检查目录名称是否为.gitignore中要添加的路径
  gitignore_path="$REFERENCES_RELATIVE_PATH/$repo_name"
  
  # 检查是否已经在.gitignore中
  if ! grep -q "^$gitignore_path\$" "$GITIGNORE_FILE"; then
    echo "添加 $gitignore_path 到 .gitignore..."
    # 确保添加的条目在新行上
    # 首先检查文件是否以换行符结束
    if [ -f "$GITIGNORE_FILE" ] && [ -s "$GITIGNORE_FILE" ]; then
      last_char=$(tail -c 1 "$GITIGNORE_FILE")
      if [ "$last_char" != "" ]; then
        # 如果最后一行不是空行，先添加一个换行符
        echo "" >> "$GITIGNORE_FILE"
      fi
    fi
    # 添加忽略路径
    echo "$gitignore_path" >> "$GITIGNORE_FILE"
  else
    echo "$gitignore_path 已在 .gitignore 中"
  fi
  
  # 检查目录是否存在
  if [ -d "$target_dir" ]; then
    # 目录存在，尝试更新
    echo "更新 $repo_name..."
    cd "$target_dir" && git pull && cd - > /dev/null
  else
    # 目录不存在，克隆仓库
    echo "克隆 $repo_name..."
    git clone "$repo_url" "$target_dir"
  fi
  
done < "$REFERENCES_LIST"

echo "所有参考项目处理完成！"