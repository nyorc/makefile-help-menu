# Makefile Help Menu

print help menu by script, not echo forever

## 標記

help menu 靠兩個註解標記產生，都要在 `#` 後面留一個空格：

- `## 說明`：接在 target 的冒號後面，例如 `build: ## Compile the code`。有標的 target 才會列進 help menu，沒標的不會出現
- `##@ 群組名`：單獨佔一行，例如 `##@ Build`。它後面的 target 都歸到這個群組，直到下一個 `##@` 為止

## Reference
- https://gist.github.com/prwhite/8168133
