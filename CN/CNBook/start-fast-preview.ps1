# 快速持续预览脚本
# 使用简化编译模式进行实时预览，最大化编译速度

param(
    [switch]$Stop = $false
)

$ErrorActionPreference = "Continue"

# 设置工作目录
Set-Location -LiteralPath $PSScriptRoot

if ($Stop) {
    # 停止现有的latexmk进程
    Write-Host "停止现有的LaTeX编译进程..." -ForegroundColor Yellow
    Get-Process -Name "latexmk" -ErrorAction SilentlyContinue | Stop-Process -Force
    Get-Process -Name "xelatex" -ErrorAction SilentlyContinue | Stop-Process -Force
    Write-Host "已停止编译进程" -ForegroundColor Green
    exit 0
}

Write-Host "=== 快速持续预览模式 ===" -ForegroundColor Green
Write-Host "使用简化编译配置，实时监控文件变化" -ForegroundColor Cyan
Write-Host "按 Ctrl+C 停止预览" -ForegroundColor Yellow
Write-Host ""

# 使用latexmk的持续预览模式，监控main-simple.tex
$process = Start-Process -FilePath "latexmk" -ArgumentList @(
    "-xelatex",
    "-interaction=nonstopmode",
    "-synctex=1", 
    "-pvc",           # 持续预览模式
    "-view=none",     # 不自动打开PDF查看器
    "main-simple.tex"
) -PassThru -NoNewWindow

Write-Host "持续预览已启动，PID: $($process.Id)" -ForegroundColor Green
Write-Host "使用以下命令停止预览：" -ForegroundColor Yellow
Write-Host ".\start-fast-preview.ps1 -Stop" -ForegroundColor White

# 等待用户停止
try {
    $process.WaitForExit()
}
catch {
    Write-Host "预览已停止" -ForegroundColor Yellow
}
