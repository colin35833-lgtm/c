# 一键推送工作主页到 GitHub（零弹窗）
$repo = "C:\Users\36203\WorkBuddy\2026-05-25-18-01-37\github-c"
$source = "C:\Users\36203\WorkBuddy\2026-05-08-task-1\index.html"

Copy-Item $source "$repo\index.html" -Force
Set-Location $repo

$msg = Read-Host "提交信息（回车使用默认）"
if ([string]::IsNullOrWhiteSpace($msg)) { $msg = "update index.html" }

git add index.html
git commit -m $msg
git push origin main

Write-Host "推送完成！Commit: $(git rev-parse --short HEAD)" -ForegroundColor Green
pause
