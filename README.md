# BJBook - 北街学长学习资料库

[![License](https://img.shields.io/badge/License-LPPL%201.3c-blue.svg)](https://www.latex-project.org/lppl/)
[![LaTeX](https://img.shields.io/badge/LaTeX-3.0-blue.svg)](https://www.latex-project.org/)

## 📚 项目简介

BJBook 是北街学长倾力打造的数据结构与操作系统学习资料库，采用 LaTeX 排版系统制作，提供高质量的 PDF 教材和练习题。

### 🎯 项目特色

- **深入浅出的讲解**：用通俗易懂的语言解释复杂的概念
- **丰富的图表资源**：包含大量精心绘制的 SVG 图表和 Excalidraw 文件
- **完整的练习体系**：每章都配有详细的练习题和答案
- **专业的排版**：使用 ElegantBook 模板，确保文档美观易读

## 📁 项目结构

```
BJBook/
├── DS/                          # 数据结构部分
│   ├── DSBook.tex              # 数据结构主教材
│   ├── DSBook.pdf              # 编译后的PDF教材
│   ├── DSExcercise/            # 数据结构练习题
│   │   ├── BJDS_excercise.pdf  # 练习题PDF
│   │   └── chapter1-9/         # 各章节答案
│   └── figure/                 # 图表资源
│       ├── excalidraw/         # Excalidraw 源文件
│       ├── svg/                # SVG 矢量图
│       ├── pdf/                # PDF 图表
│       └── png/                # PNG 位图
├── OS/                          # 操作系统部分
│   ├── OSClassExcecise/        # 课堂练习题
│   │   ├── BJOSClass_excercise.pdf
│   │   └── BJOSClass_excercise_answer.pdf
│   ├── OSExcercise/            # 课后练习题
│   │   ├── BJOSAfterClass_excercise.pdf
│   │   └── [北街学长]操作系统课后选择题.pdf
│   └── figure/                 # 操作系统图表资源
├── elegantbook.cls             # LaTeX 模板文件
├── reference.bib               # 参考文献
└── License                     # LPPL 许可证
```

## 📖 内容概览

### 数据结构 (DS)

**主教材：《深入浅出数据结构》**

涵盖内容：
- 数据结构基础概念
- 线性结构（数组、链表、栈、队列）
- 树形结构（二叉树、B树、红黑树、AVL树、堆）
- 图形结构（图的基本概念、遍历算法）
- 查找与排序算法
- 高级数据结构

**练习题体系：**
- 每章配套练习题
- 详细的解题思路和答案
- 涵盖基础题到综合应用题

### 操作系统 (OS)

**课堂练习题：**
- 操作系统概述
- 进程管理
- 内存管理
- 文件系统
- 设备管理

**课后练习题：**
- 名校考研真题
- 全国统考真题
- 综合应用题

## 🛠️ 使用说明

### 环境要求

- LaTeX 发行版（推荐 TeX Live 或 MiKTeX）
- 支持中文的编译器（XeLaTeX 或 LuaLaTeX）
- ElegantBook 模板

### 编译方法

1. **编译主教材：**
   ```bash
   xelatex DS/DSBook.tex
   ```

2. **编译练习题：**
   ```bash
   xelatex DS/DSExcercise/BJDS_excercise.tex
   xelatex OS/OSExcercise/BJOSAfterClass_excercise.tex
   ```

### 查看文档

- 直接打开对应的 PDF 文件即可阅读
- 建议使用支持中文的 PDF 阅读器

## 🎨 图表资源

项目包含丰富的图表资源：

- **Excalidraw 文件**：可编辑的矢量图源文件
- **SVG 格式**：高质量的矢量图
- **PDF 格式**：适合打印的图表
- **PNG 格式**：适合网页显示的位图

## 📝 贡献指南

欢迎提交 Issue 和 Pull Request 来改进这个项目！

### 贡献方式

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

### 代码规范

- 使用标准的 LaTeX 语法
- 保持文档结构清晰
- 添加适当的注释

## 📄 许可证

本项目采用 [LaTeX Project Public License (LPPL) 1.3c](https://www.latex-project.org/lppl/) 许可证。

## 👨‍💻 作者

**北街学长**

- 专注于数据结构与算法教学
- 致力于制作高质量的学习资料
- 用通俗易懂的方式讲解复杂概念

## 🙏 致谢

- 感谢 ElegantLaTeX 团队提供的优秀模板
- 感谢所有为这个项目做出贡献的朋友
- 感谢使用和推荐这个项目的同学们

## 📞 联系方式

如有问题或建议，欢迎通过以下方式联系：

- 提交 GitHub Issue
- 发送邮件至作者

---

⭐ 如果这个项目对你有帮助，请给它一个星标！
