# .tmux

高度可定制的 tmux 配置文件，提供现代化的终端体验。

## 特性

- **现代化主题**: Catppuccin Mocha 主题，美观的配色方案
- **Vim 风格导航**: 使用 `h/j/k/l` 在 pane 之间导航
- **高效快捷键**: 自定义 prefix (Ctrl+a)，快速分屏和重载配置
- **会话恢复**: 使用 tmux-resurrect 自动保存和恢复工作环境
- **插件管理**: 通过 TPM (Tmux Plugin Manager) 管理插件
- **开发环境脚本**: 一键启动开发 session

## 前置要求

- tmux >= 2.9
- bash >= 4.0
- git
- 已安装的字体 (建议 Nerd Font)

## 安装

### 自动安装

```bash
curl -fsSL https://raw.githubusercontent.com/your-username/.tmux/main/install.sh | bash
```

或

```bash
git clone https://github.com/your-username/.tmux.git ~/.tmux
cd ~/.tmux
./install.sh
```

### 手动安装

1. 克隆此仓库:
   ```bash
   git clone https://github.com/your-username/.tmux.git ~/.tmux
   ```

2. 链接配置文件:
   ```bash
   ln -sf ~/.tmux/tmux.conf ~/.tmux.conf
   ```

3. 安装插件:
   - 首次启动 tmux 后，按 `prefix + I` (默认 `Ctrl+a + I`) 安装插件

## 目录结构

```
.tmux
├── tmux.conf          # 主配置文件
├── conf.d/            # 配置模块化目录
│   ├── base.conf      # 基础配置
│   ├── keybindings.conf  # 快捷键
│   ├── plugins.conf   # 插件配置
│   └── ui.conf        # UI/主题配置
├── plugins/           # 插件目录
├── scripts/           # 辅助脚本
│   ├── attach.sh      # 快速 attach
│   └── dev-session.sh # 开发环境 session
└── LICENSE
```

## 快捷键

### 前缀键

| 快捷键 | 说明 |
|--------|------|
| `Ctrl+a` | 新的前缀键 (替代默认的 `Ctrl+b`) |

### 分屏

| 快捷键 | 说明 |
|--------|------|
| `prefix + \|` | 水平分屏 |
| `prefix + -` | 垂直分屏 |

### Pane 导航

| 快捷键 | 说明 |
|--------|------|
| `prefix + h` | 切换到左侧 pane |
| `prefix + j` | 切换到下方 pane |
| `prefix + k` | 切换到上方 pane |
| `prefix + l` | 切换到右侧 pane |

### Pane 调整

| 快捷键 | 说明 |
|--------|------|
| `prefix + H` | 向左扩大 pane (5 单位) |
| `prefix + J` | 向下扩大 pane (5 单位) |
| `prefix + K` | 向上扩大 pane (5 单位) |
| `prefix + L` | 向右扩大 pane (5 单位) |

### 其他

| 快捷键 | 说明 |
|--------|------|
| `prefix + r` | 重载 tmux 配置 |
| `prefix + I` | 安装新插件 |
| `prefix + Ctrl-s` | 保存当前 session (tmux-resurrect) |
| `prefix + Ctrl-r` | 恢复 session (tmux-resurrect) |

## 插件列表

| 插件 | 说明 |
|------|------|
| [tpm](https://github.com/tmux-plugins/tpm) | Tmux 插件管理器 |
| [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) | 合理的默认配置 |
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | 会话恢复 |
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) | 自动保存/恢复 |
| [tmux-yank](https://github.com/tmux-plugins/tmux-yank) | 系统剪贴板集成 |
| [tmux-open](https://github.com/tmux-plugins/tmux-open) | 快速打开文件/URL |
| [tmux-fzf](https://github.com/sainnhe/tmux-fzf) | FZF 集成 |
| [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight) | 显示 prefix 状态 |
| [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat) | 正则搜索 |
| [catppuccin/tmux](https://github.com/catppuccin/tmux) | 主题 |

## 脚本

### dev-session.sh

创建一个预设的开发环境 session，包含:

- Editor (Neovim)
- Backend (uvicorn)
- Frontend (npm dev)
- Docker Compose

```bash
~/.tmux/scripts/dev-session.sh
```

### attach.sh

快速 attach 到已存在的 session，不存在则创建新的 dev session:

```bash
~/.tmux/scripts/attach.sh
```

## 配置

### 主题风格

默认使用 `mocha` 风格，可在 `conf.d/ui.conf` 中修改:

```bash
set -g @catppuccin_flavour 'mocha'  # mocha / latte / frappe / macchiato
```

### 状态栏模块

编辑 `conf.d/ui.conf` 中的模块配置:

```bash
set -g @catppuccin_status_modules_right "git cpu memory"
set -g @catppuccin_status_right "directory date_time"
```

## 常见问题

### tmux 版本过低

此配置要求 tmux >= 2.9。请升级 tmux:

```bash
# Ubuntu/Debian
sudo apt install tmux

# macOS
brew install tmux

# 从源码编译
git clone https://github.com/tmux/tmux.git
cd tmux
sh configure && make
```

### 颜色显示不正确

确保设置 `TERM` 为支持 256 色的终端，例如:

```bash
export TERM=xterm-256color
```

或在终端模拟器设置中选择 "xterm-256color"。

### 剪贴板不工作

在 macOS 上需要安装 `reattach-to-user-namespace`:

```bash
brew install reattach-to-user-namespace
```

## 许可证

[MIT](LICENSE)