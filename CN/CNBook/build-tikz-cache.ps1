# 预编译TikZ图形缓存脚本
# 用于首次编译或清理缓存后重建所有TikZ图形

param(
    [switch]$Clean = $false
)

$ErrorActionPreference = "Continue"

Write-Host "=== TikZ 缓存构建脚本 ===" -ForegroundColor Green

# 设置工作目录
Set-Location -LiteralPath $PSScriptRoot

# 清理缓存（如果需要）
if ($Clean) {
    Write-Host "清理现有TikZ缓存..." -ForegroundColor Yellow
    if (Test-Path "tikz-cache") {
        Remove-Item "tikz-cache\*" -Force -ErrorAction SilentlyContinue
    }
}

# 确保缓存目录存在
if (-not (Test-Path "tikz-cache")) {
    New-Item -ItemType Directory -Path "tikz-cache" -Force | Out-Null
}

Write-Host "开始预编译TikZ图形..." -ForegroundColor Cyan

# 使用快速模式编译一次以生成所有TikZ图形
$env:max_print_line = "1000"
$process = Start-Process -FilePath "latexmk" -ArgumentList @(
    "-xelatex",
    "-shell-escape", 
    "-interaction=nonstopmode",
    "-silent",
    "main-fast.tex"
) -Wait -PassThru -NoNewWindow

if ($process.ExitCode -eq 0) {
    Write-Host "TikZ缓存构建完成！" -ForegroundColor Green
    
    # 统计缓存文件数量
    $cacheCount = (Get-ChildItem "tikz-cache\*.pdf" -ErrorAction SilentlyContinue).Count
    Write-Host "已缓存 $cacheCount 个TikZ图形" -ForegroundColor Cyan
    
    Write-Host "`n现在你可以使用持续预览模式进行快速编译：" -ForegroundColor Yellow
    Write-Host "latexmk -xelatex -shell-escape -pvc -interaction=nonstopmode main-fast.tex" -ForegroundColor White
}
else {
    Write-Host "编译失败，请检查LaTeX错误" -ForegroundColor Red
    exit 1
}
