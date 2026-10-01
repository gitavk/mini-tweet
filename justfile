#!/usr/bin/env -S just --justfile
# Shebang Позволяет запускать файл напрямую как скрипт через ./justfile <команда>

# Быстрый алиас для запуска тестов (теперь можно писать `just t`)
alias t := test

# Настройка оболочки
set shell := ["bash", "-cu"]

# Список доступных команд по умолчанию
default:
    @just --list --unsorted

# ==================================================================================== #
# DEVELOPMENT
# ==================================================================================== #

# Запустить проект (принимает любые дополнительные аргументы, например: just run -- --help)
[group: 'dev']
run +args='':
    @cargo run {{ args }}

# Быстрая проверка: cargo clippy (check will be run by clippy)
[group: 'dev']
check:
    @cargo clippy

# Форматировать код
[group: 'dev']
fmt:
    @cargo fmt

# Run the tests (принимает фильтр, например: just test my_func)
[group: 'dev']
test +args='':
    @cargo test {{ args }}

# ==================================================================================== #
# QUALITY CONTROL
# ==================================================================================== #

# Полная проверка CI — формат, строгий линтинг и тесты
[group: 'check']
ci:
    @cargo fmt --check
    @cargo clippy -- -D warnings
    @cargo test

# ==================================================================================== #
# BUILD
# ==================================================================================== #

# Собрать дебаг-бинарник
[group: 'build']
build:
    @cargo build

# Release
[group: 'build']
release:
    @cargo build --release

# Очистить артефакты сборки
[group: 'misc']
clean:
    @cargo clean

